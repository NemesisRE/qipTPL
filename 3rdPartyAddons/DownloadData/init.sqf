/*
 =======================================================================================================================

	File:		init.sqf
	Author:		T-800a

=======================================================================================================================
*/

call compile preprocessFile "downloadData.sqf";
call compile preprocessFile "secureBomb.sqf";

waitUntil { !isNil "T8L_var_INITDONE" };
waitUntil { !isNil "secureBombINIT" };

if ( !isServer ) exitWith {};

if !(isNil "bomb01") {
	[ bomb01, "T8_SB_fnc_addAction", true, true] spawn BIS_fnc_MP;
};

if !(isNil "bomb02") {
	[ bomb02, "T8_SB_fnc_addAction", true, true] spawn BIS_fnc_MP;
};

if !(isNil "bomb03") {
	[ bomb03, "T8_SB_fnc_addAction", true, true] spawn BIS_fnc_MP;
};

if !(isNil "bomb04") {
	[ bomb04, "T8_SB_fnc_addAction", true, true] spawn BIS_fnc_MP;
};

if !(isNil "laptop01") {
	[ laptop01, "T8L_fnc_addActionLaptop", true, true] spawn BIS_fnc_MP;
};
if !(isNil "laptop02") {
	[ laptop02, "T8L_fnc_addActionLaptop", true, true] spawn BIS_fnc_MP;
};

if !(isNil "laptop03") {
	[ laptop03, "T8L_fnc_addActionLaptop", true, true] spawn BIS_fnc_MP;
};

if !(isNil "laptop04") {
	[ laptop04, "T8L_fnc_addActionLaptop", true, true] spawn BIS_fnc_MP;
};
