# TonkahLUI
A LUI configuration by Tonkah

This is a LUI profile with profiles for Omen, Recount, Bartender, ArkInventory, TomTom, Chatter, DBM, and Healbot. It also contains other addons that don't require much configuration. I plan on adding, tweaking and improving these addons and profiles as I go, creating branches for various screen sizes.

All of these addons are available from their respective authors. This repo is for the simple purpose of saving you/me time in configuration, if you like the way my UI looks/works.

Master branch is 1920x1080 by default. Due to some addons not fully supporting profiles, some tweaking may be necessary after installing.

![Tonkah's Custom LUI Sample](https://cdn.discordapp.com/attachments/135080106983948288/234858454160769024/Screen_Shot_2016-10-09_at_7.54.07_PM.png)

## Installation

#### Mac

1. Download source
1. Open terminal and navigate to extracted source folder
1. Run `sh install-mac.sh` and then follow instructions.
1. Launch WoW and configure each addon to use (or copy from) the `Taunkah LUI` profile
1. Tweak further as you see fit

#### Windows

1. Download source
1. Right-click `install-windows.bat` and select "Run as Administrator" and then follow instructions.
1. Launch WoW and configure each addon to use (or copy from) the `Taunkah LUI` profile
1. Tweak further as you see fit

#### Contributors

Your installation instructions will be pretty much the same except that you'll want to fork/clone instead of just download. Then, you should have the installer create symlinks instead of copying the addons and profiles into your WoW folder. This can be accomplished by:

- **Mac:** Pass `-link` parameter when installing.
- **Windows:** Instead of running the batch file, run powershell as adminstrator, then run `install-windows.ps1 -link`.

Once the symlinks are created, you'll be able to easily use git to create branches, try new UI configs, screen resolutions, profile-sets, etc.
