while {true} do {
	{
		private ["_EditableObjectBlacklist","_filteredList","_fullList","_objectsToAdd"];
		_curator = _x;
		_EditableObjectBlacklist = [
			"Ares_Module_Util_Create_Composition",
			"ModuleCurator_F",
			"GroundWeaponHolder",
			"Salema_F",
			"Ornate_random_F",
			"Mackerel_F",
			"Tuna_F",
			"Mullet_F",
			"CatShark_F",
			"Rabbit_F",
			"Snake_random_F",
			"Turtle_F",
			"Hen_random_F",
			"Cock_random_F",
			"Cock_white_F",
			"Sheep_random_F"
		];

		if (count (curatorAddons _curator) == 0) then {
			_fullList = [];
			_fullList = allUnits - allPlayers;
		} else {
			_fullList = [];
			_fullList = _fullList + allUnits;
			_fullList = _fullList + vehicles;
			_fullList = _fullList + switchableUnits;
			_fullList = _fullList + playableUnits;
			_fullList = _fullList + allDead;
			_fullList = _fullList + allUnitsUav;
			_fullList = _fullList + allPlayers;
		};

		_filteredList = [];

		{
			if (not ((typeOf _x) in _EditableObjectBlacklist)) then
			{
				_filteredList pushBack _x;
			};
		} forEach _fullList;

		_objectsToAdd = _filteredList;

		qipTPL_addUnitsToCuratorFunction = {
			(_this select 0) addCuratorEditableObjects [(_this select 1), true];
		};
		publicVariable "qipTPL_addUnitsToCuratorFunction";

		[[_curator, _objectsToAdd], "qipTPL_addUnitsToCuratorFunction", false] call BIS_fnc_MP;
	} foreach allCurators;
	sleep 10;
};
