/****************************************************************
DO NOT EDIT THIS FILE
Configure the mission timer in initConfig.sqf
****************************************************************/

diag_log "Init - executing initPost.sqf"; // Reporting. Do NOT edit/remove

private ["_unit","_unitName","_cnt","_timerInput","_timer","_halfTime","_uavIntro","_initMsg","_postInitMsg"];
_unitName = name qipTPL_unit;
_cnt = 0;
_timerInput = qipTPL_missionInitTime; // Mission Init time counter. Min 30 secs. Add 1 sec per 2 players. 10 players = 35 secs.
_timer = _timerInput / 100;
_cntStop = -1;

if (isDedicated || isHC) exitWith {};

if (isVirtualCurator) exitWith {
	[] call qipTPL_fnc_reassignCurator;
	/*waitUntil {!isNull getAssignedCuratorLogic player};
	(getAssignedCuratorLogic player) addEventHandler ["CuratorObjectPlaced", {call qipTPL_fnc_fixZeusPlacing}];*/
};

if (qipTPL_init) then {
	if (qipTPL_uavIntro) then {
		_uavIntro = [
			vehicle qipTPL_unit, // Target position (replace MARKERNAME)
			getText (missionConfigFile >> "onLoadName"), // SITREP text
			100,                    // 400m altitude
			100,                    // 200m radius
			160,                    // 0 degrees viewing angle
			1,                      // Clockwise movement
			[],
			0
		] spawn BIS_fnc_establishingShot;
	} else {
		_uavIntro = 0 spawn {};
	};

	while {(_cnt != 100)} do {
		_cnt = _cnt + 1;

		_initMsg = format ["
			<br/>
			<t align='left' size='1.2' color='#F7D358'>Missions Initialsierung:</t><br/>
			<t align='left' size='1.1' color='#CCA9A9' font='PuristaBold'>%1&#0037; abgeschlossen</t><br/><br/>
			<t align='left' color='#FFFFFF'>Hallo %3,</t><br/>
			<t align='left' color='#A1A4AD'>die Initialisierung dauert etwa %2 Sekunden. Währenddessen kannst du dich nicht bewegen oder andere Aktionen durchführen, also keine Panik.</t><br/>
			<br/>
		", _cnt,_TimerInput,_unitName];

		sleep _timer;
		if (scriptDone _uavIntro) then {
			hintSilent parseText _initMsg;
			if (_cntStop == -1) then {
				_cntStop = _cnt;
				["<img size= '9' shadow='false' image='" + qipTPL_clanLogo + "'/><br/><br/><t size='.7' color='#FFFFFF'>Mission presented by " + qipTPL_clanName + "</t>",0,0,5,((100 - _cntStop) * _timer)] spawn BIS_fnc_dynamicText;
			};
		};
	};

	waitUntil {scriptDone qipTPL_initTPL};
	waitUntil {scriptDone qipTPL_init3rdPartyScripts};
	waitUntil {scriptDone qipTPL_init3rdPartyAddons};

	_postInitMsg = format ["
		<br/>
		<t align='left' size='1.2' color='#F7D358'>Missions Initialsierung:</t><br/>
		<t align='left' size='1.1' color='#A9CCA9' font='PuristaBold'>Vollständig abgeschlossen</t><br/><br/>
		<t align='left' color='#FFFFFF'>Viel Spaß und denkt daran:</t><br/>
		<t align='left' color='#A1A4AD'>- Folgt den Befehlen eures Teamleiters.</t><br/>
		<t align='left' color='#A1A4AD'>- Stellt euren Funkkanal ein.</t><br/>
		<t align='left' color='#A1A4AD'>- Sichert und senkt eure Waffe.</t><br/>
		<t align='left' color='#A1A4AD'>- Haltung bewahren, wenn angebracht.</t><br/>
		<t align='left' color='#A1A4AD'>- Verwendet nicht den Chat.</t><br/>
		<br/>
	"];

	hint parseText _postInitMsg;
	sleep 5;
	qipTPL_unit enableSimulation true;
};
hintSilent "";

if ( vehicle qipTPL_unit == qipTPL_unit ) then {
	if ( primaryWeapon qipTPL_unit != "" ) then {
		qipTPL_unit playMove "AmovPercMstpSlowWrflDnon";
	} else {
		if ( handgunWeapon qipTPL_unit != "" ) then {
			qipTPL_unit playMove "AmovPercMstpSrasWpstDnon_AmovPercMstpSrasWlnrDnon";
		};
	};
};
