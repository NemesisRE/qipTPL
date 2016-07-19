

// clients and servers may run this function/file
// return global array with data about the current world
// returning array because this function expected to grow in what it provides, thus array is proper

// modify as needed, just remember to lowercase all values
if (isNil "varSandWorlds") then {
	varSandWorlds = ["mountains_acr","shapur_baf","takistan","zargabad","bmfayshkhabur","clafghan","fata","mcn_aliabad","smd_sahrani_a3","pja306","tup_qom","queshkibrul","razani"];
};

if (isNil "varSnowWorlds") then {
	varSnowWorlds = ["klurs_land","pomegratskaya_w","saralite","plr_bulge","vostok_w","bet_hurtgensnow","bet_snowisland","chernarus_winter","utes_winter","thirskw","frankenwinter","wl_wroute191","esseker","anim_helvantis_v2","lostw","abramia"];
};

if (isNil "varGreenWorlds") then {
	// worlds that use woodland type camo skins, or worlds that have certain lighting?? ideas still needed on what "might" be used..
	// varGreenWorlds = [];
};

// if (toLower(worldName) in varGreenWorlds) exitWith {MKY_arInfoWorld = ["green"]};
if (toLower(worldName) in varSandWorlds) exitWith {MKY_arInfoWorld = ["sand"];};
if (toLower(worldName) in varSnowWorlds) exitWith {MKY_arInfoWorld = ["snow"];};
MKY_arInfoWorld = ["green"]; // default value ??
(true);