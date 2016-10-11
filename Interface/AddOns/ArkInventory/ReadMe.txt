Description:

ArkInventory (AI or ARKINV) is an inventory mod that was based off EngInventory when the BtS 2.0.0 patch came out and I needed a working replacement.

AI's display windows are built from "virtual bars", you assign categories to bars so that items in that category are displayed on the specific bars you want. There is no limit to the number of bars you can have inside a window but obviously you only have so much screen real estate before it becomes "too many".

AI allows you to view all your Inventory locations, eg the Bank or Vault, without having to be there (offline mode).  It will also allow you to view the Inventory of your other characters as well.

AI uses several methods to assign a default category to an item such as what professions you have, tooltip scanning, basic type/subtype and PeriodicTable. You then assign those categories to a virtual bar.


You can also over-ride the default category by creating a rule that matches either a single or multiple items.






to see how you need to setup sorting go here https://github.com/arkayenro/arkinventory/wiki/UserGuide_HowTo_Sorting
to see how to setup rules go here https://github.com/arkayenro/arkinventory/wiki/RuleFunction
the FAQ is https://github.com/arkayenro/arkinventory/wiki/FAQ
the wiki is here https://github.com/arkayenro/arkinventory/wiki

please ensure you have read those before you lodge a ticket at https://github.com/arkayenro/arkinventory/issues


General:

    * home page - https://github.com/arkayenro/arkinventory/wiki
	
	* faq - https://github.com/arkayenro/arkinventory/wiki/FAQ

	* betas;
		* backup your saved variables file for arkinventory
		* when installing a new beta always restore a copy of your saved variabes from the backup you made (so it's starts clean - theres usually no automatic upgrade between beta versions)

	* example rules - https://github.com/arkayenro/arkinventory/wiki/ExampleRules
	
	* download from;
		* curse gaming - http://wow.curse.com/downloads/wow-addons/details/ark-inventory.aspx
		* wow interface - http://www.wowinterface.com/downloads/info6488
		
	
	


Overview:

    * unlimited number of bars (there are practical limits though before your screen becomes full)
    * assign items to a category of your choice (overrides the default assignment)
    * assign categories to the bar of your choice
    * configurable bars per row
    * configurable width
    * display bank, bag, keyrings for current and alts across all realms
    * separate keybindings for bag, keyring and bank viewing
    * /arkinv ui reset (puts the windows back in the centre of the screen)
    * /arkinv db reset confirm (resets all user options back to defaults)
    * /arkinv cache erase confirm (erases all cached data - not options)

	
Key Bindings (How To):

	Press ESCAPE to bring up the blizzard menu
	click on Key Bindings
	scroll down to ArkInventory
	bind the keys you want to use to specific functions
	
	
Issues:
	* the background can appear in front of the items rendering them unuseable - note this is not an ai code problem, it would appear to be an issue with blizzards CreateFrame api function.  a workaround for this issue is included in the addon config menu.


Bugs:
	* guild bank (vault) can have display issues on first open, just change tabs or refresh
	
	
To Do:


Version History:
	* see VersionHistory.txt or https://github.com/arkayenro/arkinventory/wiki/VersionHistory
