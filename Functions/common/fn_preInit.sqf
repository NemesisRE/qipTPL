diag_log "Init - executing initPre.sqf"; // Reporting. Do NOT edit/remove

if !(qipTPL_enabled) exitWith {};
[] spawn {
	qipTPL_initTFR = [] call qipTPL_fnc_tfrSettings;
};

player setVariable ["BIS_noCoreConversations",true]; // Disable AI chatter.
enableSaving [false,false]; // Disables save when aborting.
enableTeamSwitch false; // Disables team switch.
enableSentences false; // Disable AI chatter.
