private ["_unit","_result","_curatorVehicles"];
_unit = _this select 0;
_result = false;

_result = getAssignedCuratorLogic _unit in allCurators;

_result;
