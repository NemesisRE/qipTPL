diag_log "Init - executing initPre.sqf"; // Reporting. Do NOT edit/remove

if (isNil "qipTPL_enabled" || !(qipTPL_enabled)) exitWith {};

player setVariable ["BIS_noCoreConversations",true]; // Disable AI chatter.
enableSaving [false,false]; // Disables save when aborting.
enableTeamSwitch false; // Disables team switch.
enableSentences false; // Disable AI chatter.


if (isServer) then {
    TFAR_defaultFrequencies_sr_west = ["310","320","330","340","350","360","370","380","30.6"];
    TFAR_defaultFrequencies_lr_west = ["84.4","31","32","33","34","35","36","37","38","30.6"];
    TFAR_defaultFrequencies_sr_east = ["410","420","430","440","450","460","470","480","40.6"];
    TFAR_defaultFrequencies_lr_east = ["74.4","41","42","43","44","45","46","47","48,""40.6"];
    TFAR_defaultFrequencies_sr_independent = ["510","520","530","540","550","560","570","580","50.6"];
    TFAR_defaultFrequencies_lr_independent = ["64.4","51","52","53","54","55","56","57","58","50.6"];
};
