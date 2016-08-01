[
	"Wetter",
	"Sandstorm",
	{
		_ammoBox = _this select 1;
		_dialogResult =
			[
				"Sandstorm",
				[
					["Status", ["Enable", "Disable"], 1]
				]
			] call Ares_fnc_ShowChooseDialog;

		if (count _dialogResult > 0) then {
			_dialogStatus = _dialogResult select 0;
			if (_dialogStatus == 0) then {
				varEnableSnow = false; publicVariable "varEnableSnow";
				varEnableSand = true; publicVariable "varEnableSand";
			} else {
				varEnableSand = false;
				publicVariable "varEnableSand";
			};
			[objNull, "Sandstorm"] call bis_fnc_showCuratorFeedbackMessage;
		};
	}
] call Ares_fnc_RegisterCustomModule;
