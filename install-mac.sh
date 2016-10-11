#!/bin/bash

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DEFAULT_DIRECTORY="/Applications/World of Warcraft"

if [ ! -z "$0" ] && [[ "$TARGET_DIRECTORY" =~ "World of Warcraft$" ]] && [ -d "$TARGET_DIRECTORY" ] ; then
    TARGET_DIRECTORY="$0"
elif [ -d "$DEFAULT_DIRECTORY" ]; then
    TARGET_DIRECTORY="$DEFAULT_DIRECTORY"
fi

echo "To install this, we have to get enough information to target the correct WoW folders. This includes providing your account name, realm name and main character's name.\n"

function promptInfo {
    read -p "Enter your WoW Account name (case sensitive): " ACCOUNT_NAME
    read -p "Enter your WoW Server name (case sensitive): " SERVER_NAME
    read -p "Enter your main character's name (case sensitive): " CHARACTER_NAME

    verifyInfo
}

function verifyInfo {
    while true; do
        echo "Is this information correct? y/n\n\tAccount: $ACCOUNT_NAME\n\tServer: $SERVER_NAME\n\tCharacter: $CHARACTER_NAME"
        read yn
        case $yn in
            [Yy]* ) checkDirectory; break;;
            [Nn]* ) promptDirectory;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

function promptDirectory {
    read -p "Please type in the full path to your World of Warcraft directory: " TARGET_DIRECTORY
    TARGET_DIRECTORY=${TARGET_DIRECTORY%/} #strip trailing slash

    checkDirectory
}

function checkDirectory {
    if [ -z "$TARGET_DIRECTORY" ] ; then
        promptDirectory
    elif [[ ! "$TARGET_DIRECTORY" =~ "World of Warcraft$" ]] && [ -d "$TARGET_DIRECTORY" ] ; then
        install
    else
        echo "Could not find World of Warcraft directory at: '$TARGET_DIRECTORY'"
        promptDirectory
    fi
}

function install {
    while true; do
        read -p "Installing to WoW folder located at: '$TARGET_DIRECTORY'. Is this correct? y/n: " yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) promptDirectory;;
            * ) echo "Please answer yes or no.";;
        esac
    done

    if [ -d "$TARGET_DIRECTORY/Interface" ] && [ ! -d "$TARGET_DIRECTORY/Interface_Backup" ] ; then
        echo "Backing up '$TARGET_DIRECTORY/Interface' folder..."
        cp -r "$TARGET_DIRECTORY/Interface" "$TARGET_DIRECTORY/Interface_Backup"
    fi

    if [ -d "$TARGET_DIRECTORY/WTF" ] && [ ! -d "$TARGET_DIRECTORY/WTF_Backup" ] ; then
        echo "Backing up '$TARGET_DIRECTORY/WTF' folder..."
        cp -r "$TARGET_DIRECTORY/WTF" "$TARGET_DIRECTORY/WTF_Backup"
    fi

    echo "Installing addons..."
    cp -rf "$SCRIPT_DIRECTORY/Interface" "$TARGET_DIRECTORY/Interface"

    echo "Installing profiles..."
    mkdir -p "$TARGET_DIRECTORY/WTF/Account/$ACCOUNT_NAME/$SERVER_NAME/$CHARACTER_NAME"
    cp -rf "$SCRIPT_DIRECTORY/WTF/Account/[ACCOUNTNAME]/[SERVERNAME]/[CHARACTERNAME]/SavedVariables" "$TARGET_DIRECTORY/WTF/Account/$ACCOUNT_NAME/$SERVER_NAME/$CHARACTER_NAME/SavedVariables"
    mkdir -p "$TARGET_DIRECTORY/WTF/Account/$ACCOUNT_NAME"
    cp -rf "$SCRIPT_DIRECTORY/WTF/Account/[ACCOUNTNAME]/SavedVariables" "$TARGET_DIRECTORY/WTF/Account/$ACCOUNT_NAME/SavedVariables"

    echo "Installation complete."
    exit
}

promptInfo