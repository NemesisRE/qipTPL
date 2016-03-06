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

qipTPL_MissionConfig = [] execVM "qipTPL\config\initConfig.sqf";
waitUntil {scriptDone qipTPL_MissionConfig;};
qipTPL_initBriefing = [] execVM "qipTPL\config\briefing.sqf"; // Load Mission Briefing
qipTPL_initCredits = [] execVM "\qipTPL\init\tplCredits.sqf";

// Get addon/mod/dlc availability from the A3 config file and store them in easy to use variables
dlc_MarksMan 				= isClass (configFile >> "CfgMods" >> "Mark"); // Check if Marksman DLC is present
dlc_Bundle 					= isClass (configFile >> "CfgMods" >> "DLCBundle"); // Check if DLC Bundle is present
dlc_Heli 					= isClass (configFile >> "CfgMods" >> "Heli"); // Check if Helicopters DLC is present

mod_CBA 					= isClass (configFile >> "CfgPatches" >> "cba_main"); // Check if CBA is present
mod_TFAR 					= isClass (configFile >> "CfgPatches" >> "task_force_radio"); // Check if TFAR is present
mod_CTAB 					= isClass (configFile >> "CfgPatches" >> "cTab"); // Check if cTab is present
mod_ACE3 					= isClass (configFile >> "CfgPatches" >> "ace_common"); // ACE3 Core
mod_AIA	 					= isClass (configFile >> "CfgPatches" >> "AiA_Core"); // All in Arma (Terrain Pack) V1.39 B7
mod_Ares 					= isClass (configFile >> "CfgPatches" >> "Ares"); // Ares Zeus V1.39 B7
mod_CSAT 					= isClass (configFile >> "CfgPatches" >> "TEC_CSAT"); // TEC CSAT V1.39 B7
mod_RHS	 					= isClass (configFile >> "CfgPatches" >> "rhs_main"); // Red Hammer Studios V1.39 B7
qipTPL_unit					= (missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player]);
isVirtualCurator			= [player] call qipTPL_fnc_isVirtualCurator;
qipTPL_init					= ["initTPL"] call qipTPL_fnc_paramToBool;
qipTPL_uavIntro				= ["uavIntro"] call qipTPL_fnc_paramToBool;
qipTPL_debug				= ["debugTPL"] call qipTPL_fnc_paramToBool;
qipTPL_Log_ServerPerfEnable	= ["ServerPerf"] call qipTPL_fnc_paramToBool; // Enable server performance logging in RPT. [true/false]
qipTPL_Caching				= ["Caching"] call qipTPL_fnc_paramToBool; // // Enable/disable caching of units and vehicles.
qipTPL_CleanUp				= ["Cleanup"] call qipTPL_fnc_paramToBool; // enable cleaning up of dead bodies (friendly, enemy, vehicles, etc.) [true/false].
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
	if (qipTPL_CleanUp) then {
		[] execVM "\qipTPL\3rdPartyScripts\delete.sqf";
	}; // garbage collector.
	if (qipTPL_Caching) then {
		[] execVM "\qipTPL\3rdPartyAddons\zbe_cache\main.sqf";
	}; // Configure in qipTPL_init_config.sqf
};

/**********  Execute Core  **********/
qipTPL_initLoadout = [] call qipTPL_fnc_initLoadout;
qipTPL_initTPL = [] execVM '\qipTPL\init\initTPL.sqf';

/**********  Execute 3rd Party addons/scripts **********/
qipTPL_init3rdPartyScripts = [] execVM '\qipTPL\3rdPartyScripts\initScripts.sqf';	// initialize 3rd Scripts
qipTPL_init3rdPartyAddons = [] execVM '\qipTPL\3rdPartyAddons\initAddons.sqf';	// initialize 3rd Addons

/********** Post processing **********/
qipTPL_initPost = [] execVM '\qipTPL\init\initPost.sqf'; // Should be the last line of the init.sqf
