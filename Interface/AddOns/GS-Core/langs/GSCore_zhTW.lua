local L = LibStub("AceLocale-3.0"):NewLocale("GS-E", "zhTW", true)

-- L["Active Version "] = ""
-- L["Active Version: "] = ""
-- L["Adding missing Language :"] = ""
-- L[" already exists."] = ""
-- L["A sequence colision has occured. "] = ""
-- L["A sequence collision has occured.  Your local version of "] = ""
-- L["As GS-E is updated, there may be left over macros that no longer relate to sequences.  This will check for these automatically on logout.  Alternatively this check can be run via /gs cleanorphans"] = ""
-- L["Author Colour"] = ""
-- L["Auto Create Class Macro Stubs"] = ""
-- L["Auto Create Global Macro Stubs"] = ""
-- L["Available Addons"] = ""
-- L["Blizzard Functions Colour"] = ""
-- L["By setting the default Icon for all macros to be the QuestionMark, the macro button on your toolbar will change every key hit."] = ""
-- L["By setting this value the Sequence Editor will show every macro for every class."] = ""
-- L["By setting this value the Sequence Editor will show every macro for your class."] = ""
-- L["|cffff0000GS-E:|r Gnome Sequencer - Enhanced Options"] = ""
-- L["Checking if specID "] = ""
-- L["Choose Language"] = ""
-- L["Class = "] = ""
-- L["Classwide Macro"] = ""
-- L["Clear"] = ""
-- L["Clear Errors"] = ""
-- L["Close"] = ""
-- L["Close to Maximum Macros.|r  You can have a maximum of "] = ""
-- L["Close to Maximum Personal Macros.|r  You can have a maximum of "] = ""
-- L["Colour"] = ""
-- L["Colour and Accessibility Options"] = ""
-- L["Command Colour"] = ""
-- L["Completely New GS Macro."] = ""
-- L["Conditionals Colour"] = ""
-- L["Contributed by: "] = ""
-- L["createButton PostMacro: "] = ""
-- L["createButton PreMacro: "] = ""
-- L["Creating New Sequence."] = ""
-- L["Cycle Version "] = ""
-- L["Debug"] = ""
-- L["Debug Mode Options"] = ""
-- L["Debug Output Options"] = ""
-- L["<DEBUG> |r "] = ""
-- L["Debug Sequence Execution"] = ""
-- L[" Deleted Orphaned Macro "] = ""
-- L["Delete Orphaned Macros on Logout"] = ""
-- L["Delete Version"] = ""
-- L["Different helpTxt"] = ""
-- L["Different PostMacro"] = ""
-- L["Different PreMacro"] = ""
-- L["Different Sequence Steps"] = ""
-- L["Different specID"] = ""
-- L["Different StepFunction"] = ""
-- L["Disable"] = ""
-- L["Disable Sequence"] = ""
-- L["Display debug messages in Chat Window"] = ""
-- L["Dump of GS Debug messages"] = ""
-- L["Edit"] = ""
-- L["Editor Colours"] = ""
-- L["Emphasis Colour"] = ""
-- L["Enable"] = ""
-- L["Enable Debug for the following Modules"] = ""
-- L["Enable Mod Debug Mode"] = ""
-- L["Enable Sequence"] = ""
-- L["Entering GSSplitMeIntolines with :"] = ""
-- L[" equals "] = ""
-- L[" equals currentclassid "] = ""
-- L["Filter Macro Selection"] = ""
-- L[" from "] = ""
-- L[" From library"] = ""
-- L["FYou cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = ""
-- L["Gameplay Options"] = ""
-- L["GCD Delay:"] = ""
-- L["General"] = ""
-- L["General Options"] = ""
-- L["GnomeSequencer-Enhanced"] = ""
-- L["GnomeSequencer-Enhanced loaded.|r  Type "] = ""
-- L["Gnome Sequencer: Sequence Debugger. Monitor the Execution of your Macro"] = ""
-- L["Gnome Sequencer: Sequence Editor."] = ""
-- L["Gnome Sequencer: Sequence Version Manager"] = ""
-- L["Gnome Sequencer: Sequence Viewer"] = ""
-- L["GnomeSequencer was originally written by semlar of wowinterface.com."] = ""
-- L["[GNOME] syntax error on line %d of Sequences.lua:|r %s"] = ""
-- L["/gs cleanorphans|r will loop through your macros and delete any left over GS-E macros that no longer have a sequence to match them."] = ""
-- L["GS-E can save all macros or only those versions that you have created locally.  Turning this off will cache all macros in your WTF\\GS-Core.lua variables file but will increase load times and potentially cause colissions."] = ""
-- L["GS-E is out of date. You can download the newest version from https://mods.curse.com/addons/wow/gnomesequencer-enhanced."] = ""
-- L["GS-E: Left Click to open the Sequence Editor"] = ""
-- L["GS-E: Middle Click to open the Transmission Interface"] = ""
-- L["GS-E Plugins"] = ""
-- L["GS-E: Right Click to open the Sequence Debugger"] = ""
-- L["/gs help|r to get started."] = ""
-- L["], (GSisEmpty(GSMasterOptions.SequenceLibrary["] = ""
-- L["/gs listall|r will produce a list of all available macros with some help information."] = ""
-- L["/gs|r again."] = ""
-- L["/gs|r will list any macros available to your spec.  This will also add any macros available for your current spec to the macro interface."] = ""
-- L["GSSE:loadSequence "] = ""
-- L["/gsse |r to get started."] = ""
-- L["/gs showspec|r will show your current Specialisation and the SPECID needed to tag any existing macros."] = ""
-- L["GSTranslateSequenceFromTo(GSMasterOptions.SequenceLibrary["] = ""
-- L["GSUpdateSequence PostMacro updated to: "] = ""
-- L["GSUpdateSequence PreMacro updated to: "] = ""
-- L[" has been added as a new version and set to active.  Please review if this is as expected."] = ""
-- L["has been disabled.  The Macro stub for this sequence will be deleted and will not be recreated until you re-enable this sequence.  It will also not appear in the /gs list until it is recreated."] = ""
-- L["has been enabled.  The Macro stub is now available in your Macro interface."] = ""
-- L["Help Colour"] = ""
-- L["Help Information"] = ""
-- L["I am loaded"] = ""
-- L["Icon: "] = ""
-- L["Icon Colour"] = ""
-- L["If you load Gnome Sequencer - Enhanced and the Sequence Editor and want to create new macros from scratch, this will enable a first cut sequenced template that you can load into the editor as a starting point.  This enables a Hello World macro called Draik01.  You will need to do a /console reloadui after this for this to take effect."] = ""
-- L["Import"] = ""
-- L["Imported new sequence "] = ""
-- L["Import Macro from Forums"] = ""
-- L["Incorporate the belt slot into the PostMacro. This is the equivalent of /use [combat] 5 in a PostMacro."] = ""
-- L["Incorporate the first ring slot into the PostMacro. This is the equivalent of /use [combat] 11 in a PostMacro."] = ""
-- L["Incorporate the first trinket slot into the PostMacro. This is the equivalent of /use [combat] 13 in a PostMacro."] = ""
-- L["Incorporate the Head slot into the PostMacro. This is the equivalent of /use [combat] 1 in a PostMacro."] = ""
-- L["Incorporate the neck slot into the PostMacro. This is the equivalent of /use [combat] 2 in a PostMacro."] = ""
-- L["Incorporate the second ring slot into the PostMacro. This is the equivalent of /use [combat] 12 in a PostMacro."] = ""
-- L["Incorporate the second trinket slot into the PostMacro. This is the equivalent of /use [combat] 14 in a PostMacro."] = ""
-- L["is currently disabled from use."] = ""
-- L[" is not available.  Unable to translate sequence "] = ""
-- L[" is unknown."] = ""
-- L["].lang) and GSMasterOptions.SequenceLibrary["] = ""
-- L["].lang or GetLocale()), key)"] = ""
-- L["Language Colour"] = ""
-- L["Like a /castsequence macro, it cycles through a series of commands when the button is pushed. However, unlike castsequence, it uses macro text for the commands instead of spells, and it advances every time the button is pushed instead of stopping when it can't cast something."] = ""
-- L["Line : "] = ""
-- L["Load Sequence"] = ""
-- L["Macro Found "] = ""
-- L["Macro Icon"] = ""
-- L[" macros per Account.  You currently have "] = ""
-- L[" macros per character.  You currently have "] = ""
-- L["Make Active"] = ""
-- L["Manage Versions"] = ""
-- L["Matching helpTxt"] = ""
-- L["Matching PostMacro"] = ""
-- L["Matching PreMacro"] = ""
-- L["Matching specID"] = ""
-- L["Matching StepFunction"] = ""
-- L["Moving on - "] = ""
-- L["Moving on - LiveTest.PosMacro already exists."] = ""
-- L["Moving on - LiveTest.PreMacro already exists."] = ""
-- L["Moving on - macro for "] = ""
-- L["New"] = ""
-- L["No"] = ""
-- L["No Active Version"] = ""
-- L["No Help Information "] = ""
-- L["No Help Information Available"] = ""
-- L["No Macro Found. Possibly different spec for Sequence "] = ""
-- L["none"] = ""
-- L["Normal Colour"] = ""
-- L["No Sequence Icon setting to "] = ""
-- L["No Sequences present so none displayed in the list."] = ""
-- L["No Specialisation information for sequence "] = ""
-- L[" not added to list."] = ""
-- L["No value"] = ""
-- L["of no value"] = ""
-- L["Only Save Local Macros"] = ""
-- L["Options"] = ""
-- L["Output"] = ""
-- L["Output the action for each button press to verify StepFunction and spell availability."] = ""
-- L[". Overriding with information for current spec "] = ""
-- L["Pause"] = ""
-- L["Picks a Custom Colour for emphasis."] = ""
-- L["Picks a Custom Colour for the Author."] = ""
-- L["Picks a Custom Colour for the Commands."] = ""
-- L["Picks a Custom Colour for the Mod Names."] = ""
-- L["Picks a Custom Colour to be used for braces and indents."] = ""
-- L["Picks a Custom Colour to be used for Icons."] = ""
-- L["Picks a Custom Colour to be used for language descriptors"] = ""
-- L["Picks a Custom Colour to be used for macro conditionals eg [mod:shift]"] = ""
-- L["Picks a Custom Colour to be used for Macro Keywords like /cast and /target"] = ""
-- L["Picks a Custom Colour to be used for numbers."] = ""
-- L["Picks a Custom Colour to be used for Spells and Abilities."] = ""
-- L["Picks a Custom Colour to be used for StepFunctions."] = ""
-- L["Picks a Custom Colour to be used for strings."] = ""
-- L["Picks a Custom Colour to be used for unknown terms."] = ""
-- L["Picks a Custom Colour to be used normally."] = ""
-- L["Please wait till you have left combat before using the Sequence Editor."] = ""
-- L["Plugins"] = ""
-- L["PostMacro"] = ""
-- L["PreMacro"] = ""
-- L["Prevent Sound Errors"] = ""
-- L["Prevent UI Errors"] = ""
-- L["Priority List (1 12 123 1234)"] = ""
-- L["|r.  As a result this macro was not created.  Please delete some macros and reenter "] = ""
-- L["Ready to Send"] = ""
-- L["Received Sequence "] = ""
-- L["Registered Addons"] = ""
-- L["Reloading Sequences"] = ""
-- L["Removing "] = ""
-- L["Require Target to use"] = ""
-- L["Reset Macro when out of combat"] = ""
-- L["Resets macros back to the initial state when out of combat."] = ""
-- L["Resume"] = ""
-- L["|r Incomplete Sequence Definition - This sequence has no further information "] = ""
-- L[":|r The Sequence Translator allows you to use GS-E on other languages than enUS.  It will translate sequences to match your language.  If you also have the Sequence Editor you can translate sequences between languages.  The GS-E Sequence Translator is available on curse.com"] = ""
-- L[":|r To get started "] = ""
-- L["|r.  You can also have a  maximum of "] = ""
-- L[":|r You cannot delete the only copy of a sequence."] = ""
-- L[":|r Your current Specialisation is "] = ""
-- L["Same Sequence Steps"] = ""
-- L["Save"] = ""
-- L[" saved as version "] = ""
-- L["Seed Initial Macro"] = ""
-- L["Selecting tab: "] = ""
-- L["Select Other Version"] = ""
-- L["Send"] = ""
-- L["Send To"] = ""
-- L[" sent"] = ""
-- L["Sequence"] = ""
-- L["Sequence Author set to Unknown"] = ""
-- L["Sequence Debugger"] = ""
-- L["<SEQUENCEDEBUG> |r "] = ""
-- L["Sequence Editor"] = ""
-- L["sequenceIndex: "] = ""
-- L["Sequence Name"] = ""
-- L["Sequence Name: "] = ""
-- L[" Sequence named "] = ""
-- L["Sequence Saved as version "] = ""
-- L["SequenceSpecID: "] = ""
-- L["Sequence specID set to current spec of "] = ""
-- L["Sequence Viewer"] = ""
-- L["Sequential (1 2 3 4)"] = ""
-- L["Set Default Icon QuestionMark"] = ""
-- L["Setting Editor clean "] = ""
-- L["Show All Macros in Editor"] = ""
-- L["Show Class Macros in Editor"] = ""
-- L["Source "] = ""
-- L["Source Language "] = ""
-- L["Spec = "] = ""
-- L["Specialisation / Class ID"] = ""
-- L["Specialization Specific Macro"] = ""
-- L["SpecID/ClassID Colour"] = ""
-- L["Spell Colour"] = ""
-- L["Step Function"] = ""
-- L["Step Functions"] = ""
-- L["Store Debug Messages"] = ""
-- L["Store output of debug messages in a Global Variable that can be referrenced by other mods."] = ""
-- L["String Colour"] = ""
-- L["String Icon "] = ""
-- L["Target language "] = ""
-- L["Testing "] = ""
-- L["Testing String: "] = ""
-- L["  The Alternative ClassID is "] = ""
-- L["The command "] = ""
-- L["The Macro Translator will translate an English sequence to your local language for execution.  It can also be used to translate a sequence into a different language.  It is also used for syntax based colour markup of Sequences in the editor."] = ""
-- L["The Sequence Editor can attempt to parse the Sequences, PreMacro and PostMacro in realtime.  This is still experimental so can be turned off."] = ""
-- L["The Sequence Editor is an addon for GnomeSequencer-Enhanced that allows you to view and edit Sequences in game.  Type "] = ""
-- L["This is a small addon that allows you create a sequence of macros to be executed at the push of a button."] = ""
-- L["This option clears errors and stack traces ingame.  This is the equivalent of /run UIErrorsFrame:Clear() in a PostMacro.  Turning this on will trigger a Scam warning about running custom scripts."] = ""
-- L["This option dumps extra trace information to your chat window to help troubleshoot problems with the mod"] = ""
-- L["This option hide error sounds like \"That is out of range\" from being played while you are hitting a GS Macro.  This is the equivalent of /console Sound_EnableErrorSpeech lines within a Sequence.  Turning this on will trigger a Scam warning about running custom scripts."] = ""
-- L["This option hides text error popups and dialogs and stack traces ingame.  This is the equivalent of /script UIErrorsFrame:Hide() in a PostMacro.  Turning this on will trigger a Scam warning about running custom scripts."] = ""
-- L["This option prevents macros firing unless you have a target. Helps reduce mistaken targeting of other mobs/groups when your target dies."] = ""
-- L["This Sequence is currently Disabled Locally."] = ""
-- L["This version has been modified by TimothyLuke to make the power of GnomeSequencer avaialble to people who are not comfortable with lua programming."] = ""
-- L[". This version was not loaded."] = ""
-- L["This will display debug messages for the Core of GS-E"] = ""
-- L["This will display debug messages for the GS-E Ingame Transmission and transfer"] = ""
-- L["This will display debug messages for the GS-E Sequence Editor"] = ""
-- L["This will display debug messages for the GS-E Translator"] = ""
-- L["This will display debug messages in the Chat window."] = ""
-- L["Title Colour"] = ""
-- L["To get started "] = ""
-- L["To use a macro, open the macros interface and create a macro with the exact same name as one from the list.  A new macro with two lines will be created and place this on your action bar."] = ""
-- L["Translated Sequence"] = ""
-- L["Translate to"] = ""
-- L[" tried to overwrite the version already loaded from "] = ""
-- L["Two sequences with unknown sources found."] = ""
-- L["Unknown Author|r "] = ""
-- L["Unknown Colour"] = ""
-- L["Update"] = ""
-- L["Updating due to new version."] = ""
-- L["Use Belt Item in Postmacro"] = ""
-- L["Use First Ring in Postmacro"] = ""
-- L["Use First Trinket in Postmacro"] = ""
-- L["Use Global Account Macros"] = ""
-- L["Use Head Item in Postmacro"] = ""
-- L["Use Macro Translator"] = ""
-- L["Use Neck Item in Postmacro"] = ""
-- L["Use Realtime Parsing"] = ""
-- L["Use Second Ring in Postmacro"] = ""
-- L["Use Second Trinket in Postmacro"] = ""
-- L["Version="] = ""
-- L[" was imported with the following errors."] = ""
-- L["We have a perfect match"] = ""
-- L["When creating a macro, if there is not a personal character macro space, create an account wide macro."] = ""
-- L["When loading or creating a sequence, if it is a global or the macro has an unknown specID automatically create the Macro Stub in Account Macros"] = ""
-- L["When loading or creating a sequence, if it is a macro of the same class automatically create the Macro Stub"] = ""
-- L[" with iconid "] = ""
-- L["with no body"] = ""
-- L["Yes"] = ""
-- L["You cannot delete this version of a sequence.  This version will be reloaded as it is contained in "] = ""
-- L["You need to reload the User Interface for the change in StepFunction to take effect.  Would you like to do this now?"] = ""
-- L["You need to reload the User Interface to complete this task.  Would you like to do this now?"] = ""
-- L["Your current Specialisation is "] = ""

