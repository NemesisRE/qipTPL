waitUntil {time > 0};
waitUntil {call TFAR_fnc_haveSWRadio};
waitUntil {call TFAR_fnc_haveLRRadio};

[] spawn {
	while {true} do {
		waitUntil {sleep 0.1;!(isNull (findDisplay 312))};
		(findDisplay 312) displayAddEventHandler ["KeyDown", "[_this, 'keydown'] call TFAR_fnc_processCuratorKey"];
		(findDisplay 312) displayAddEventHandler ["KeyUp", "[_this, 'keyup'] call TFAR_fnc_processCuratorKey"];
		(findDisplay 312) displayAddEventHandler ["keyUp", "_this call TFAR_fnc_onSwTangentReleasedHack"];
		(findDisplay 312) displayAddEventHandler ["keyDown", "_this call TFAR_fnc_onSwTangentPressedHack"];
		(findDisplay 312) displayAddEventHandler ["keyUp", "_this call TFAR_fnc_onLRTangentReleasedHack"];
		(findDisplay 312) displayAddEventHandler ["keyUp", "_this call TFAR_fnc_onDDTangentReleasedHack"];
		waitUntil {sleep 0.1;isNull (findDisplay 312)};
	};
};

{
	_currentSwRadio = _x;
	_currentSwRadioString = (_x splitString "_") select 1;
	switch (true) do {
		case (_currentSwRadioString == "anprc152"): {
			[_currentSwRadio, tf_freq_west] call TFAR_fnc_setSwSettings;
		};
		case (_currentSwRadioString == "fadak"): {
			[_currentSwRadio, tf_freq_east] call TFAR_fnc_setSwSettings;
		};
		case (_currentSwRadioString == "anprc148jem"): {
			[_currentSwRadio, tf_freq_guer] call TFAR_fnc_setSwSettings;
		};
		default {};
	};
} forEach (player call TFAR_fnc_radiosList);

[TF_curator_backpack_1, "TF_curatorBackPack", tf_freq_west_lr] call TFAR_fnc_setLrSettings;
[TF_curator_backpack_2, "TF_curatorBackPack", tf_freq_east_lr] call TFAR_fnc_setLrSettings;
[TF_curator_backpack_3, "TF_curatorBackPack", tf_freq_guer_lr] call TFAR_fnc_setLrSettings;
