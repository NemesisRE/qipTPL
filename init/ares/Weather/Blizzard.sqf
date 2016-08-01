[
	"Wetter",
	"Blizzard",
	{
		_ammoBox = _this select 1;
		_dialogResult =
			[
				"Blizzard",
				[
					["Status", ["Enable", "Disable"], 1],
					["Intensity", ["Random", "Light", "Moderate", "Heavy"], 0]
				]
			] call Ares_fnc_ShowChooseDialog;

		if (count _dialogResult > 0) then {
			_dialogStatus = _dialogResult select 0;
			_dialogIntensity = _dialogResult select 0;
			if (_dialogStatus == 0) then {
				varEnableSand = false; publicVariable "varEnableSand";
				varEnableSnow = true; publicVariable "varEnableSnow";
			} else {
				varEnableSnow = false;
				publicVariable "varEnableSnow";
			};
			MKY_iStrengthEFX = _dialogIntensity;
			varSnowData set [0,MKY_iStrengthEFX];
			publicVariable "varSnowData";
			[objNull, "Blizzard"] call bis_fnc_showCuratorFeedbackMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;
