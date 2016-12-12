/*
	Author: Karel Moricky

	Description:
	Remove virtual backpacks from an object (e.g., ammo box).
	Virtual items can be selected in the Arsenal.

	Parameter(s):
		0: OBJECT - objct from which backpacks will be removed
		1: STRING or ARRAY of STRINGs - backpack class(es) to be removed
		2 (Optional): BOOL - true to remove backpacks globally (default: false)

	Returns:
	ARRAY of ARRAYs - all virtual items within the object's space in format [<items>,<weapons>,<magazines>,<backpacks>]
*/

private ["_object","_classes","_isGlobal"];
_object = _this param [0,missionnamespace,[missionnamespace,objnull]];
_classes = _this param [1,[],["",true,[]]];
_isGlobal = _this param [2,false,[false]];
[_object,_classes,_isGlobal,true,-1,3] call qipTPL_fnc_addVirtualItemCargo;
