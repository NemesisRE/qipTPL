diag_log "RPT: Init - executing Function rptLog"; // Reporting. Do NOT edit/remove

// Init
qipTPL_log_rptMods = "";
if (isMultiplayer) then {qipTPL_log_pUnits = playableUnits;} else {qipTPL_log_pUnits = switchableUnits};
if (((count allUnits)-(count qipTPL_log_pUnits)) < 0) then {qipTPL_log_aiUnits = 0} else {qipTPL_log_aiUnits = ((count allUnits)-(count qipTPL_log_pUnits))};
if (mod_CBA) then {qipTPL_log_rptMods = qipTPL_log_rptMods + "CBA A3";};
//if (mod_CUP) then {qipTPL_log_rptMods = qipTPL_log_rptMods + ", CUP";};
if (mod_TFAR) then {qipTPL_log_rptMods = qipTPL_log_rptMods + ", TFAR";};
if (mod_ACE3) then {qipTPL_log_rptMods = qipTPL_log_rptMods + ", ACE3";};
if (mod_Ares) then {qipTPL_log_rptMods = qipTPL_log_rptMods + ", Ares";};
if (mod_Achilles) then {qipTPL_log_rptMods = qipTPL_log_rptMods + ", Achilles";};
if (mod_RHS) then {qipTPL_log_rptMods = qipTPL_log_rptMods + ", RHS";};

// Init reporting
diag_log ""; diag_log "";
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Mission name: %1",(getText (missionConfigFile >> "overviewText"))];
diag_log format ["RPT: Init - Mission developer: %1",(getText (missionConfigFile >> "author"))];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Number of clients connected: %1", (count qipTPL_log_pUnits)];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - Number of AI's active: %1", qipTPL_log_aiUnits];
diag_log "--------------------------------------------------------------------------------------";
diag_log format ["RPT: Init - autodetect addons active: %1", qipTPL_log_rptMods];
diag_log "--------------------------------------------------------------------------------------";
diag_log ""; diag_log "";
qipTPL_log_aiUnits = nil; qipTPL_log_rptMods = nil;

if (!mod_CBA) exitWith { // Terminate init as CBA is NOT present
	["### ERROR! CBA_A3 not present. CBA is required by qipTPL ###","systemChat"] call BIS_fnc_MP;
	diag_log "";diag_log "";
	diag_log "######################################################################################";
	diag_log "RPT: <ERROR>  CBA_A3 not present. CBA is required by qipTPL. Terminating init!";
	diag_log "######################################################################################";
	diag_log "";diag_log "";
};
