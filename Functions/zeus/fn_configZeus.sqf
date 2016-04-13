{
	private ["_curator","_curatorVehicle"];
	_curator = _x;

	if (count (curatorAddons _curator) == 0) then {
		_curator addCuratorPoints 1;
		[_curator,[-1,-2,0,1,2,3,4,5,6,7]] call BIS_fnc_setCuratorVisionModes;
		{
			_curator setCuratorCoef [_x,-10000];
		} forEach ["place","edit","delete","destroy","group","synchronize"];
	} else {
		_curator addCuratorPoints 1;
		_curator setCuratorWaypointCost 0;
		[_curator,"player",["Skill","UnitPos","Rank","Damage","Fuel","Lock","RespawnVehicle","RespawnPosition","Exec"]] call BIS_fnc_setCuratorAttributes;

		[_curator,[-1,-2,0,1,2,3,4,5,6,7]] call BIS_fnc_setCuratorVisionModes;

		{
			_curator setCuratorCoef [_x,0];
		} forEach ["place","edit","delete","destroy","group","synchronize"];

		_curatorVehicle = getAssignedCuratorUnit _curator;
		_curatorVehicle addEventHandler ["Init", {
			if (mod_ACE3) then {
				_this setVariable ["ace_medical_allowDamage", false];
			};
			_curatorVehicle addEventHandler ["HandleDamage", {false}];
		}];
	};
} foreach allCurators;
