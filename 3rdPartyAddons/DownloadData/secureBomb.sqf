/*
 =======================================================================================================================

 

	### THIS IS PROBABLY OUTADTED ### MAY NOT WORK ###
 
 
 
	secureBomb - script to make a object a bomb with different options to defuse or explode it

	File:		secureBomb.sqf
	Author:		T-800a
	

	in the init.sqf:

	call compile preprocessFile "secureBomb.sqf";
	waitUntil { !isNil "secureBombINIT" };

	sleep 10;
	[ meineBombe, "T8_SB_fnc_addAction", true, true] spawn BIS_fnc_MP;
	
	
 ===== LICENSE =========================================================================================================
	
	DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
	Version 2, December 2004

	Copyright (C) 2004 Sam Hocevar
	14 rue de Plaisance, 75014 Paris, France
	Everyone is permitted to copy and distribute verbatim or modified
	copies of this license document, and changing it is allowed as long
	as the name is changed.

	DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
	TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION

	0. You just DO WHAT THE FUCK YOU WANT TO.

 =======================================================================================================================
*/

T8_SB_varTLine01 = "den blauen Draht zerschneiden";				// Text for the first addAction 	
T8_SB_varTLine02 = "den roten Draht zerschneiden";				// Text for the second addAction
T8_SB_varTLine03 = "die Batterie raustrennen";					// Text for the third addAction
T8_SB_varTLine04 = "Kabel aus dem Sprengstoff ziehen";			// Text for the fourth addAction

// Chance to defuse the Bomb for each addAction 
// 1 = bomb will always explode
// 0 = bomb will never explode
// 0.5 = 50/50 chance ....
T8_SB_varChance = [ 1, 0.75, 0.5, 0 ];

//T8_SB_fnc_hintArray = [ "Bomb was defused", "bomb not secured, mooooove!" ];
T8_SB_fnc_hintArray = [ "Bombe wurde entschaerft!", "Bombe konnte nicht entschaerft werden. Verschwinden sie da!" ];


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

T8_SB_fnc_hint = 
{
	private [ "_switch", "_text" ];
	_switch = _this select 0;
	_text = T8_SB_fnc_hintArray select _switch;
	
	hint _text;
};

T8_SB_fnc_explode = 
{
	private ["_pos", "_posX", "_posY", "_posZ", "_posNew", "_iedExpl01", "_iedExpl02"];
	
	_pos = getPos _this;

	_posX = _pos select 0;
	_posY = _pos select 1;
	_posZ = _pos select 2;
	_posNew = [_posX, _posY, _posZ + 1.5];

	sleep ( 10 + random 10 );
	
	_bomb01 = "Bo_Mk82_MI08" createVehicle _pos;
//	_bomb01 setVectorDirAndUp [[0,0,-1],[0,1,0]];
	sleep 0.6;
	_bomb02 = "Bo_Mk82_MI08" createVehicle _pos;
	sleep 2;
	_bomb03 = "Bo_Mk82_MI08" createVehicle _pos;
//	_bomb02 setVectorDirAndUp [[0,0,-1],[0,1,0]];
//	sleep 0.3;
//	_bomb03 = "R_60mm_HE" createVehicle _posNew;
//	_bomb03 setVectorDirAndUp [[0,0,-1],[0,1,0]];

	deleteVehicle _this;
};

T8_SB_fnc_addAction =
{
	_this addAction [ T8_SB_varTLine01, "call T8_SB_fnc_Defuse", 0, 0.1, false ];
	_this addAction [ T8_SB_varTLine02, "call T8_SB_fnc_Defuse", 1, 0.1, false ];
	_this addAction [ T8_SB_varTLine03, "call T8_SB_fnc_Defuse", 2, 0.1, false ];
	_this addAction [ T8_SB_varTLine04, "call T8_SB_fnc_Defuse", 3, 0.1, false ];
};


T8_SB_fnc_removeAction =
{
	private [ "_bomb", "_id" ];
	_bomb = _this select 0;
//	_id = _this select 1;
//	_bomb removeAction _id;
	removeAllActions _bomb;
};


T8_SB_fnc_Defuse =
{
	private [ "_bomb", "_caller", "_id", "_switch", "_chance" ];
	_bomb = _this select 0;
	_caller = _this select 1;
	_id = _this select 2;
	_switch = _this select 3;
	
	[ [ _bomb, _id ], "T8_SB_fnc_removeAction", true, true ] spawn BIS_fnc_MP;
	
	_chance = T8_SB_varChance select _switch;
	
	if ( ( random 1 ) > _chance ) then 
	{
		[ [ 0 ], "T8_SB_fnc_hint", true, true ] spawn BIS_fnc_MP;
		
	} else {
		[ [ 1 ], "T8_SB_fnc_hint", true, true ] spawn BIS_fnc_MP;
		
		_bomb spawn T8_SB_fnc_explode;
	};
};

secureBombINIT = true;
