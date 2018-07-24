while {true} do {
	waitUntil { sleep 1; !isNull (findDisplay 312) };
	disableSerialization;
	_display = (findDisplay 312);
	_ctrl = _display displayCtrl 15717;
	if (qipTPL_zeusWatermark == "") then {
		_ctrl ctrlSetText "";
	} else {
		_ctrl ctrlSetText qipTPL_zeusWatermark;
	};
	_ctrl ctrlCommit 0;
	waitUntil { sleep 1; isNull (findDisplay 312) };
};
