// Camera Coordinaten für die gamelogic kann man per Curator Camera rausfinden:
// 		getPosASL curatorCamera
// 		vectorDir curatorCamera
// 		vectorUp curatorCamera
//
// in die init Zeile der gamelogic dann die gewonnen daten eintragen
//		this setPosASL [218.386,4889.98,14.6857];
//		this setVectorDir [-0.270562,0.888462,-0.370748];
//		this setVectorUp [-0.108009,0.354673,0.92873];
//
// und dann einfach in die init des monitors
// null = [this, gamelogicname] execVM "\qipTPL\3rdPartyScripts/camFeed.sqf";

private ["_monitor", "_camObject", "_camFov", "_visionMode", "_camVectorDir", "_camVectorUp", "_feedName", "_cam"];
_monitor = _this select 0;
_camObject = _this select 1;
_unitFeed = if (count _this > 2) then {if !(isNil {_this select 2}) then {_this select 2} else {false};} else {false};
_camFov = if (count _this > 3) then {if !(isNil {_this select 3}) then {_this select 3} else {0.5};} else {0.5};
_visionMode = if (count _this > 4) then {if !(isNil {_this select 4}) then {_this select 4} else {0.5};} else {0};
_camVectorDir = if (count _this > 5) then {if !(isNil {_this select 5}) then {_this select 5} else {vectorDir _camObject};} else {vectorDir _camObject};
_camVectorUp = if (count _this > 6) then {if !(isNil {_this select 6}) then {_this select 6} else {vectorUp _camObject};} else {vectorUp _camObject};
_feedName = format ["feed_%1", _monitor];

sleep 1;

_cam = "camera" camCreate (getPosASL _camObject);
_cam camSetFov _camFov;
_cam setVectorDirAndUp [_camVectorDir,_camVectorUp];
if (_unitFeed) then {
	_cam attachto [_camObject,[0,0.15,0], "neck"];
};
_cam cameraEffect ["INTERNAL", "BACK", _feedName];
_cam camCommit 1;

_feedName setPiPEffect [_visionMode, 1, 0.8, 1, 0.1, [0.3, 0.3, 0.3, -0.1], [1.0, 0.0, 1.0, 1.0], [0, 0, 0, 0]];

_monitor setObjectTextureglobal  [0,(format ["#(rgb,512,512,1)r2t(%1,1.0)", _feedName])];
