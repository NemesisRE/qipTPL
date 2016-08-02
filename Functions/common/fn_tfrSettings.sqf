// Set radio frequencies
// TF_FREQ_SIDE [Active Channel (0-8), Volume (0-9), [8 Frequenzies for SW and 9 for LR], Stereo Mode (0=both;1=left,2=right), Encryption Key, Additional Channel, ADCH Stero Mode, Owner, Speaker mode (bool)]
// TF_FREQ_SIDE_LR [Active Channel (0-9), Volume (0-9), [8 Frequenzies for SW and 9 for LR], Stereo Mode (0=both;1=left,2=right), Encryption Key, Additional Channel, ADCH Stero Mode, Speaker mode (bool)]
tf_freq_west = [0,7,["310","320","330","340","350","360","370","380"],0,"_bluefor",-1,0,getPlayerUID player,false];
tf_freq_west_lr = [0,7,["84.4","31","32","33","34","35","36","37","38"],0,"_bluefor",-1,0,false];
tf_freq_east = [0,7,["410","420","430","440","450","460","470","480"],0,"_opfor",-1,0,getPlayerUID player,false];
tf_freq_east_lr = [0,7,["74.4","41","42","43","44","45","46","47","48"],0,"_opfor",-1,0,false];
tf_freq_guer = [0,7,["510","520","530","540","550","560","570","580"],0,"_independent",-1,0,getPlayerUID player,false];
tf_freq_guer_lr = [0,7,["64.4","51","52","53","54","55","56","57","58"],0,"_independent",-1,0,false];

if(!f_radios_settings_tfr_indepUseRadioCode) then {
	tf_guer_radio_code = "_independent";

	if (([west, resistance] call BIS_fnc_areFriendly) and {!([east, resistance] call BIS_fnc_areFriendly)}) then {
		tf_guer_radio_code = "_bluefor";
	};

	if (([east, resistance] call BIS_fnc_areFriendly) and {!([west, resistance] call BIS_fnc_areFriendly)}) then {
		tf_guer_radio_code = "_opfor";
	};
};

if (isServer) then {
	publicVariable "tf_freq_west";
	publicVariable "tf_freq_west_lr";
	publicVariable "tf_freq_east";
	publicVariable "tf_freq_east_lr";
	publicVariable "tf_freq_guer";
	publicVariable "tf_freq_guer_lr";
};
