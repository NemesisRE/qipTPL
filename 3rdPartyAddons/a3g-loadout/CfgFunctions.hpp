class Arsenal {
	file = "\qipTPL\3rdPartyAddons\a3g-loadout\functions\arsenal";
	class ReplaceLinkedItems {};
	class ReplaceWeapons {};
};

class Attachments {
	file = "\qipTPL\3rdPartyAddons\a3g-loadout\functions\attachments";
	class ReplacePrimaryAttachments {};
	class ReplaceSecondaryAttachments {};
	class ReplaceHandgunAttachments {};
};

class Containers {
	file = "\qipTPL\3rdPartyAddons\a3g-loadout\functions\containers";
	class ReplaceUniform {};
	class ReplaceBackpack {};
	class ReplaceVest {};
};

class General {
	file = "\qipTPL\3rdPartyAddons\a3g-loadout\functions\general";
	class AddItems {};
	class AddMagazines {};
	class AddItemsToUniform {};
	class AddItemsToVest {};
	class AddItemsToBackpack {};
	class ReplaceItems {};
	class ReplaceMagazines {};
};

class Init {
	file = "\qipTPL\3rdPartyAddons\a3g-loadout\functions\init";
	class ApplyLoadout {
		postInit = 1;
	};
	class AssignRespawn {};
	class DoLoadout {};
	class IsConfigEntry {};
};

class LinkedItems {
	file = "\qipTPL\3rdPartyAddons\a3g-loadout\functions\linkedItems";
	class ReplaceBinoculars {};
	class ReplaceCompass {};
	class ReplaceGoggles {};
	class ReplaceGPS {};
	class ReplaceHeadgear {};
	class ReplaceMap {};
	class ReplaceNVGoggles {};
	class ReplaceWatch {};
};

class Weapons {
	file = "\qipTPL\3rdPartyAddons\a3g-loadout\functions\weapons";
	class ReplaceHandgunWeapon {};
	class ReplacePrimaryWeapon {};
	class ReplaceSecondaryWeapon {};
};
