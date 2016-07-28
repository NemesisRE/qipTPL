/****************************************************************
File: init.sqf
****************************************************************
DO NOT EDIT. CONFIGURE IN 'config/'
All Files in config directory are there to be changed on a
per mission base.
****************************************************************/
if !(qipTPL_enabled) exitWith {};
diag_log "Init - executing init.sqf"; // Reporting. Do NOT edit/remove

if (!isDedicated && (isNull player)) then {
	waitUntil {!(isNull player)};
};

call compile preprocessFileLineNumbers ("qipTPL\Config\tfrSettings.sqf");
qipTPL_initTFR = [] call qipTPL_fnc_tfrSettings;
call compile preprocessFileLineNumbers ("qipTPL\config\initConfig.sqf");
call compile preprocessFileLineNumbers ("qipTPL\config\briefing.sqf");
call compile preprocessFileLineNumbers ("\qipTPL\init\tplCredits.sqf");

// Get addon/mod/dlc availability from the A3 config file and store them in easy to use variables
dlc_MarksMan 				= isClass (configFile >> "CfgMods" >> "Mark"); // Check if Marksman DLC is present
dlc_Bundle 					= isClass (configFile >> "CfgMods" >> "DLCBundle"); // Check if DLC Bundle is present
dlc_Heli 					= isClass (configFile >> "CfgMods" >> "Heli"); // Check if Helicopters DLC is present

mod_CBA 					= isClass (configFile >> "CfgPatches" >> "cba_main"); // Check if CBA is present
//mod_CUP 					= isClass (configFile >> "CfgPatches" >> "CUP"); // Check if CBA is present
mod_TFAR 					= isClass (configFile >> "CfgPatches" >> "task_force_radio"); // Check if TFAR is present
mod_ACE3 					= isClass (configFile >> "CfgPatches" >> "ace_common"); // ACE3 Core
mod_Ares 					= isClass (configFile >> "CfgPatches" >> "Ares"); // Ares Zeus V1.39 B7
mod_Achilles 				= isClass (configFile >> "CfgPatches" >> "Achilles"); // Ares Zeus V1.39 B7
mod_CSAT 					= isClass (configFile >> "CfgPatches" >> "TEC_CSAT"); // TEC CSAT V1.39 B7
mod_RHS	 					= isClass (configFile >> "CfgPatches" >> "rhs_main"); // Red Hammer Studios V1.39 B7
qipTPL_unit					= (missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player]);
isVirtualCurator			= [player] call qipTPL_fnc_isVirtualCurator;
qipTPL_init					= ["initTPL"] call qipTPL_fnc_paramToBool;
qipTPL_uavIntro				= ["uavIntro"] call qipTPL_fnc_paramToBool;
if !(isServer || hasInterface) then {
	isHC					= true;
};

[] spawn qipTPL_fnc_tfrZeus;

if (qipTPL_init) then {
	qipTPL_unit enableSimulation false;
	if (!qipTPL_uavIntro) then {
		_l = ["tLayer"] call BIS_fnc_rscLayer;
		_l cutText ["", "BLACK IN", (qipTPL_missionInitTime + 5)];
	};
};

/********** Server only Init **********/
if (isServer) then  { //server init
	[] call qipTPL_fnc_rptLog;
};

/**********  Execute Core  **********/
qipTPL_initTPL = [] execVM '\qipTPL\init\initTPL.sqf';

/**********  Execute 3rd Party addons/scripts **********/
qipTPL_init3rdPartyScripts = [] execVM '\qipTPL\3rdPartyScripts\initScripts.sqf';	// initialize 3rd Scripts
qipTPL_init3rdPartyAddons = [] execVM '\qipTPL\3rdPartyAddons\initAddons.sqf';	// initialize 3rd Addons

/********** Post processing **********/
qipTPL_initPost = [] execVM '\qipTPL\init\initPost.sqf'; // Should be the last line of the init.sqf
