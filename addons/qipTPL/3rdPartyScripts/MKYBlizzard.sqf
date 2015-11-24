// [[[],"\qipTPL\3rdPartyScripts\MKYBlizzard.sqf"],"BIS_fnc_execVM",true,false] call BIS_fnc_MP;

if (isNil "MKYBlizzard") then {MKYBlizzard = false;};
if !(MKYBlizzard) then {
	enableEnvironment false;
	MKYBlizzardFirstRun = true;
	MKYBlizzard = true;

	0 = [] spawn {
		playSound "MKY_Blizzard";
		_cnt = 0;
		while {MKYBlizzard} do  {
			_cnt = _cnt + 1;
			if (_cnt >= 205) then {
				playSound "MKY_Blizzard";
				_cnt = 0;
			};
			sleep 1;
		};
	};

	effsnow = ppEffectCreate ["colorCorrections", 1501];
	effsnow ppEffectEnable true;
	effsnow ppEffectAdjust [1,1.0,0.0,[.55,.55,.52,.2],[.88,.88,.93,.75],[1,.1,.4,0.03]];
	effsnow ppEffectCommit 60;
	if (isServer) then {
		fogBaseInit = (getPosASL (allPlayers call BIS_fnc_selectRandom) select 2) + 15;
		publicVariable "fogBaseInit";
	};
	60 setFog [0.23,0.047,fogBaseInit];
	sleep 40;

	0 = [] spawn {
		while {MKYBlizzard} do {
			sleep 30;
			if (isServer) then {
				fogBase = (getPosASL (allPlayers call BIS_fnc_selectRandom) select 2) + ([15,60] call BIS_fnc_randomInt);
				publicVariable "fogBase";
			};
			30 setFog [0.23,0.047,fogbase];
		};
	};

	0 = [] spawn {
		while {MKYBlizzard} do {
			0 setRain 0;
			if !(getAssignedCuratorLogic qipTPL_unit in allCurators) then {
				deletevehicle snow_heavy1;
				deletevehicle snow_heavy2;
				deletevehicle snow_heavy3;
				deletevehicle snow_heavy4;
				deletevehicle snow_heavy5;
				sleep 2;

				_velocity = wind;
				// create the most awesomest particle effects ever haha..
				snow_heavy1 = "#particleSource" createVehicleLocal (getPosASL qipTPL_unit);
				snow_heavy1 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,8,[0,30,8],_velocity,(0),1.59,1,1.5,[3],[[1,1,1,.15],[1,1,1,0.25]],[1000],0, 0,"","",qipTPL_unit];
				snow_heavy1 setParticleCircle [0,[0,0,0]];
				snow_heavy1 setParticleRandom [0, [15,0, 8], [0, 0, 0], 0, .5, [0,0,0,0.03], 0, 0];
				snow_heavy1 setDropInterval 0.004;

				snow_heavy2 = "#particleSource" createVehicleLocal (getPosASL qipTPL_unit);
				snow_heavy2 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,5,[0,15,8],_velocity,(0),1.59,1,1.5,[3],[[1,1,1,.15],[1,1,1,0.15]],[1000],0, 0,"","",qipTPL_unit];
				snow_heavy2 setParticleCircle [0,[0,0,0]];
				snow_heavy2 setParticleRandom [0, [15,0,8], [0, 0, 0], 0, .5, [0,0,0,0.03], 0, 0];
				snow_heavy2 setDropInterval 0.004;

				snow_heavy3 = "#particleSource" createVehicleLocal (getPosASL qipTPL_unit);
				snow_heavy3 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,5,[0,-5,6],_velocity,(0),1.59,1,1.5,[3],[[1,1,1,0],[1,1,1,0.15]],[1000],0, 0,"","",qipTPL_unit];
				snow_heavy3 setParticleCircle [0,[0,0,0]];
				snow_heavy3 setParticleRandom [0, [15,0, 6], [0, 0, 0], 0, .5, [0,0,0,0.03], 0, 0];
				snow_heavy3 setDropInterval 0.006;

				snow_heavy4 = "#particleSource" createVehicleLocal (getPosASL qipTPL_unit);
				snow_heavy4 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,5,[15,0,6],_velocity,(0),1.59,1,1.5,[3],[[1,1,1,0],[1,1,1,0.25]],[1000],0, 0,"","",qipTPL_unit];
				snow_heavy4 setParticleCircle [0,[0,0,0]];
				snow_heavy4 setParticleRandom [0, [15,15, 4], [0, 0, 0], 0, .5, [0,0,0,0.03], 0, 0];
				snow_heavy4 setDropInterval 0.008;

				snow_heavy5 = "#particleSource" createVehicleLocal (getPosASL qipTPL_unit);
				snow_heavy5 setParticleParams [["a3\data_f\ParticleEffects\Universal\Universal.p3d",16,13,6,0],"","Billboard",1,5,[-15,0,6],_velocity,(0),1.59,1,1.5,[3],[[1,1,1,0],[1,1,1,0.25]],[1000],0, 0,"","",qipTPL_unit];
				snow_heavy5 setParticleCircle [0,[0,0,0]];
				snow_heavy5 setParticleRandom [0, [15,15, 4], [0, 0, 0], 0, .5, [0,0,0,0.03], 0, 0];
				snow_heavy5 setDropInterval 0.008;
			};
		};
	};
} else {
	MKYBlizzard = false;
	sleep 30;
	deletevehicle snow_heavy1;sleep 3;
	deletevehicle snow_heavy2;sleep 3;
	deletevehicle snow_heavy3;sleep 3;
	deletevehicle snow_heavy4;sleep 3;
	deletevehicle snow_heavy5;
	effsnow = ppEffectCreate ["ColorCorrections", 1999];
	effsnow ppEffectCommit 60;
	if (isServer) then {
		fogBaseExit = (getPosASL (allPlayers call BIS_fnc_selectRandom) select 2);
		publicVariable "fogBaseExit";
	};
	waitUntil {!isNil fogBaseExit};
	60 setFog [0.23,0.047,fogbaseExit];
	sleep 60;
	ppEffectDestroy effsnow;
};
