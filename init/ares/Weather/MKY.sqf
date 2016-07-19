[
	"Wetter",
	"Blizzard",
	{
		_ammoBox = _this select 1;
		_dialogResult =
			[
				"Blizzard",
				[
					["Status", ["Enabled", "Disabled"], 1],
					["Intensity", ["Random", "Light", "Moderate", "Heavy"], 0]
					// Don't ask about tents. No one cares about tents.
				]
			] call Ares_fnc_ShowChooseDialog;

		if (count _dialogResult > 0) then {
			_dialogStatus = _dialogResult select 0;
			_dialogIntensity = _dialogResult select 0;
			if (_dialogStatus == 0) then {
				if (isServer) then {
					varEnableSand = false; publicVariable "varEnableSand";
					varEnableSnow = true; publicVariable "varEnableSnow";
				};
			} else {
				if (isServer) then { varEnableSnow = false; publicVariable "varEnableSnow"; };
			};
			MKY_iStrengthEFX = _dialogIntensity;
			varSnowData set [0,MKY_iStrengthEFX];
			publicVariable "varSnowData";
			[objNull, "Blizzard"] call bis_fnc_showCuratorFeedbackMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;

[
	"Wetter",
	"Sandstorm",
	{
		_ammoBox = _this select 1;
		_dialogResult =
			[
				"Sandstorm",
				[
					["Status", ["Enabled", "Disabled"], 1]
					// Don't ask about tents. No one cares about tents.
				]
			] call Ares_fnc_ShowChooseDialog;

		if (count _dialogResult > 0) then {
			_dialogStatus = _dialogResult select 0;
			if (_dialogStatus == 0) then {
				if (isServer) then {
					varEnableSnow = false; publicVariable "varEnableSnow";
					varEnableSand = true; publicVariable "varEnableSand";
				};
			} else {
				if (isServer) then { varEnableSand = false; publicVariable "varEnableSand"; };
			};
			[objNull, "Sandstorm"] call bis_fnc_showCuratorFeedbackMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;
