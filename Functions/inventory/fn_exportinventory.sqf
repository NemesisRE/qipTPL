/*
	Author: NemesisRE

	Description:
	Export unit's loadout qipTPL Style

	Returns:
	STRING - Class code
*/

_center = player;
_br = tostring [13,10];
_tab = toString [9];
_fnc_addArray = {
    _name = _this select 0;
    _array = _this select 1;

    _export = _export + _tab + format ["%1[] = {",_name];
    {
        if (_foreachindex > 0) then {_export = _export + ",";};
        _export = _export + format ["""%1""",_x];
    } foreach _array;
    _export = _export + "};" + _br;
};

_export = "";
_export = _export + format ["// Exported with qipTPL Arsenal by %1",profilename] + _br;
_export = _export + "class LOADOUTNAME {" + _br;
_export = _export + _tab + "items[] = {};" + _br;
_export = _export + _tab + "magazines[] = {};" + _br;
_export = _export + _tab + format ["uniform = ""%1"";",uniform _center] + _br;
["addItemsToUniform",uniformitems _center] call _fnc_addArray;
_export = _export + _tab + format ["vest = ""%1"";",vest _center] + _br;
["addItemsToVest",vestitems _center] call _fnc_addArray;
_export = _export + _tab + format ["backpack = ""%1"";",backpack _center] + _br;
["addItemsToBackpack",backpackitems _center] call _fnc_addArray;
_export = _export + _tab + format ["headgear = ""%1"";",headgear _center] + _br;
_export = _export + _tab + format ["goggles = ""%1"";",goggles _center] + _br;
_export = _export + _tab + format ["nvgoggles = ""%1"";",hmd _center] + _br;
_export = _export + _tab + format ["binoculars = ""%1"";",binocular _center] + _br;
_export = _export + _tab + format ["primaryWeapon = ""%1"";",primaryWeapon _center] + _br;
["primaryWeaponAttachments",_center weaponAccessories primaryWeapon _center] call _fnc_addArray;
_export = _export + _tab + format ["secondaryWeapon = ""%1"";",secondaryweapon _center] + _br;
["secondaryWeaponAttachments",_center weaponAccessories secondaryweapon _center] call _fnc_addArray;
_export = _export + _tab + format ["handgunWeapon = ""%1"";",handgunweapon _center] + _br;
["handgunWeaponAttachments",_center weaponAccessories handgunweapon _center] call _fnc_addArray;
["linkedItems",assigneditems _center - [binocular _center, hmd _center]] call _fnc_addArray;
_export = _export + "};" + _br;
//--- Export to clipboard
_export spawn {copytoclipboard _this;};
['showMessage',[_display,localize "STR_a3_RscDisplayArsenal_message_clipboard"]] call BIS_fnc_arsenal;
