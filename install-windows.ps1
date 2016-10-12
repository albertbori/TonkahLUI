#!\bin\bash

param (
    [switch]$link = $false
)

$SCRIPT_DIRECTORY = Split-Path -Parent $PSCommandPath
$DEFAULT_DIRECTORY = "C:\Program Files (x86)\World of Warcraft"

if (Test-Path $DEFAULT_DIRECTORY) {
    $TARGET_DIRECTORY=$DEFAULT_DIRECTORY
}

if ($link -eq $true) {
    echo "Symlink mode enabled. Symlinks will be created to the source folder instead of copying files to the World of Warcraft install directory."
}

echo "---`nTo install this, we have to get enough information to target the correct WoW folders. This includes providing your account name, realm name and main character's name.`n---"

function promptInfo {
    $ACCOUNT_NAME = Read-Host -Prompt "Enter your WoW Account name (case sensitive)" 
    $SERVER_NAME = Read-Host -Prompt "Enter your WoW Server name (case sensitive)" 
    $CHARACTER_NAME = Read-Host -Prompt "Enter your main character's name (case sensitive)"

    verifyInfo
}

function verifyInfo {
    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "This info is correct."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "This info is incorrect."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $result = $host.ui.PromptForChoice("Verify your WoW Info", "Is this information correct?`n`tAccount: $ACCOUNT_NAME`n`tServer: $SERVER_NAME`n`tCharacter: $CHARACTER_NAME", $options, 0)
    switch ($result)
    {
        0 {checkDirectory}
        1 {promptInfo}
    }
}

function promptDirectory {
    $TARGET_DIRECTORY = Read-Host -Prompt "Please type in the full path to your World of Warcraft directory" 
    $TARGET_DIRECTORY = $TARGET_DIRECTORY.TrimEnd('\') #strip trailing slash

    checkDirectory
}

function checkDirectory {
    if ([string]::IsNullOrEmpty($TARGET_DIRECTORY)) {
        promptDirectory
    } elseif ((Test-Path $TARGET_DIRECTORY) -And ($TARGET_DIRECTORY -match "World of Warcraft\\?$"))  {
        install
    } else {
        echo "Could not find World of Warcraft directory at '$TARGET_DIRECTORY'"
        promptDirectory
    }
}

function install {

    $yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes", "This info is correct."
    $no = New-Object System.Management.Automation.Host.ChoiceDescription "&No", "This info is incorrect."
    $options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
    $result = $host.ui.PromptForChoice("Verify your WoW directory", "Installing to WoW folder located at'$TARGET_DIRECTORY'. Is this correct?", $options, 0)
    switch ($result)
    {
        0 {}
        1 {
            promptDirectory
            return
        }
    }

    if ((Test-Path "$TARGET_DIRECTORY\Interface\") -And !(Test-Path "$TARGET_DIRECTORY\Interface_Backup\")) {
        echo "Backing up '$TARGET_DIRECTORY\Interface' folder..."
        Copy-Item "$TARGET_DIRECTORY\Interface\" "$TARGET_DIRECTORY\Interface_Backup\" -Recurse -Force
    } else {
        echo "Already backed up '$TARGET_DIRECTORY\Interface' folder."
    }

    if ((Test-Path "$TARGET_DIRECTORY\WTF\") -And !(Test-Path "$TARGET_DIRECTORY\WTF_Backup\")) {
        echo "Backing up '$TARGET_DIRECTORY\WTF' folder..."
        Copy-Item "$TARGET_DIRECTORY\WTF\" "$TARGET_DIRECTORY\WTF_Backup\" -Recurse -Force
    } else {
        echo "Already backed up '$TARGET_DIRECTORY\WTF' folder."
    }

    if ($link -eq $true) {
        echo "Setting up addons symlink..."
        if (Test-Path "$TARGET_DIRECTORY\Interface\") {
            Remove-Item "$TARGET_DIRECTORY\Interface\" -Recurse -Force
        }
        cmd /c mklink /D "$TARGET_DIRECTORY\Interface" "$SCRIPT_DIRECTORY\Interface\"

        echo "Setting up profiles symlink..."
        if (Test-Path "$TARGET_DIRECTORY\WTF\") {
            Remove-Item "$TARGET_DIRECTORY\WTF\" -Recurse -Force
        }
        $null = New-Item "$TARGET_DIRECTORY\WTF\Account\$ACCOUNT_NAME\$SERVER_NAME\$CHARACTER_NAME\" -type Directory
        cmd /c mklink /D "$TARGET_DIRECTORY\WTF\Account\$ACCOUNT_NAME\$SERVER_NAME\$CHARACTER_NAME\SavedVariables" "$SCRIPT_DIRECTORY\WTF\Account\ACCOUNTNAME\SERVERNAME\CHARACTERNAME\SavedVariables\" 
        cmd /c mklink /D "$TARGET_DIRECTORY\WTF\Account\$ACCOUNT_NAME\SavedVariables" "$SCRIPT_DIRECTORY\WTF\Account\ACCOUNTNAME\SavedVariables\"
    } else {
        echo "Installing addons..."
        Copy-Item "$SCRIPT_DIRECTORY\Interface\" "$TARGET_DIRECTORY\" -Recurse -Force
        
        echo "Installing profiles..."
        if (!(Test-Path "$TARGET_DIRECTORY\WTF\Account\$ACCOUNT_NAME\$SERVER_NAME\$CHARACTER_NAME\")) {
            $null = New-Item "$TARGET_DIRECTORY\WTF\Account\$ACCOUNT_NAME\$SERVER_NAME\$CHARACTER_NAME\" -type Directory
        }        
        Copy-Item "$SCRIPT_DIRECTORY\WTF\Account\ACCOUNTNAME\SERVERNAME\CHARACTERNAME\SavedVariables\" "$TARGET_DIRECTORY\WTF\Account\$ACCOUNT_NAME\$SERVER_NAME\$CHARACTER_NAME\" -Recurse -Force
        Copy-Item "$SCRIPT_DIRECTORY\WTF\Account\ACCOUNTNAME\SavedVariables\" "$TARGET_DIRECTORY\WTF\Account\$ACCOUNT_NAME\" -Recurse -Force
    }

    echo "Installation complete."
    exit
}

promptInfo