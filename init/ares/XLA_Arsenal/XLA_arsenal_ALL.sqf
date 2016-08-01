[
	"Arsenal",
	"Add Full XLA Arsenal",
	{
		_ammoBox = _this select 1;
		if (isNull _ammoBox) then {
			_ammoBox = "B_supplyCrate_F" createVehicle (_this select 0);
			clearWeaponCargoGlobal _ammoBox;
			clearMagazineCargoGlobal _ammoBox;
			clearItemCargoGlobal _ammoBox;
			clearBackpackCargoGlobal _ammoBox;
			[[_ammoBox]] call Ares_fnc_AddUnitsToCurator;
		};
		//[_ammoBox, ["%ALL"],true,false] call XLA_fnc_addVirtualSideCargo;
		["AmmoboxInit",[_ammoBox,true,{true},"<t color='#45B6EA'>Arsenal",true]] spawn XLA_fnc_arsenal;
		["XLA Arsenal Added"] call Ares_fnc_ShowZeusMessage;
	}
] call Ares_fnc_RegisterCustomModule;
