/*
	m0nkey sand and snow EFX script
	v004 - 1/19/16
	v100 - 4/10/2016

	_this:
	0 -	scalar -	EFX strength (0-random, 1-light, 2-moderate, 3-heavy)
	1 -	boolean -	vary the EFX (default is false)

	EXAMPLE USE:
	Define two arrays in the init.sqf file (must be named as follows).
	MKY_arSandEFX = [];
	MKY_arSnowEFX = [];

	Leave the arrays blank to use the EFX defaults. The defaults and input parameters are located in:
	MKY\sand\MKY_Sand_Client.sqf
	MKY\sand\MKY_Snow_Client.sqf

	Add parameter values to the arrays to customize the EFX
	MKY_arSandEFX = [0,"",true,false,true];
	MKY_arSnowEFX = [[0.23,0.047,15],0.8,true];

	After arrays are created and parameters (if any) are set, execute this file.
	nul = [EFX strength value,(optional boolean)] execVM "\qipTPL\3rdPartyAddons\MKY\MKY_Sand_Snow_Init.sqf";

	Only clients need to define the MKY_arSandEFX/MKY_arSnowEFX arrays.
	Dedicated servers do not use these arrays.

	Do NOT place these commands in the initServer or initPlayerLocal files please, only init.sqf

	It is possible to customize the EFX by scripting the actions.
	Exec this script like this:
	nul = [(1,2 or 3),""] execVM "\qipTPL\3rdPartyAddons\MKY\MKY_Sand_Snow_Init.sqf";
	This will create light/moderate/heavy snow, with no variance.

	Script designer can then modify the dropInterval in one of two ways.

	First is not MP compliant by default. It could be remote executed, but I will leave that to designers.
	0 = [0.07] call MKY_fnc_setDI;
	This will change the dropInterval until the function is called again or until the effect changes types
	(which will not happen as declaring 1,2 or 3 made it static).

	Second is MP compliant, as the server would do this when vary EFX is in use.
	Set the varSnowData array indice 1 to a dropInterval value, and the client will
	adjust the dropInterval itself. Server must publicize this however before it takes effect.
	varSnowData set [1,0.07];
	publicVariable "varSnowData";

*/

// does the global data array exist?
// the file MKY\fnc\MKY_fnc_getInfoWorld.sqf returns this data array
// it contains the type of effect the currently loaded map/world can use
// you should modify the list of worlds in that file to your specifications
if (isNil "MKY_arInfoWorld") then {
	nul = [] execVM "\qipTPL\3rdPartyAddons\MKY\fnc\MKY_fnc_getInfoWorld.sqf";
	waitUntil {sleep 0.1; !(isNil "MKY_arInfoWorld")};
};

//sand - [fog,overcast,use ppEfx,allow rain,force wind,vary fog,use wind audio,EFX strength]
MKY_arSandEFX = [0,"",true,false,true,true,true,1];
// snow - [[fog data],int Overcast,ppEfx,allow rain, vary fog, use audio]
MKY_arSnowEFX = [[0.23,0.047,15],0.8,true];

// is this a JIP client ?
// send packet to server with input being the player
if (!isServer && isNull player) then {
	waitUntil {sleep 1;!(isNull player)};
	JIP_varSnowData = [player];
	publicVariableServer "JIP_varSnowData";
	JIP_varSandData = [player];
	publicVariableServer "JIP_varSandData";
};

if (isServer) then {
	nul = [] execVM "\qipTPL\3rdPartyAddons\MKY\snow\MKY_Snow_Server.sqf";
	nul = [] execVM "\qipTPL\3rdPartyAddons\MKY\sand\MKY_Sand_Server.sqf";
};

// any machine with an interface executes this
// this will not run on dedicated servers or headless clients FYI
if (hasInterface) then {
	0 = [] spawn {
		waitUntil {sleep 5;!(isNil "varEnableSand")};
		if (isNil "MKY_arSandEFX") exitWith {true;};
		0 = MKY_arSandEFX execVM "\qipTPL\3rdPartyAddons\MKY\sand\MKY_Sand_Client.sqf";

		waitUntil {sleep 5;!(isNil "varEnableSnow")};
		if (isNil "MKY_arSnowEFX") exitWith {true;};
		0 = MKY_arSnowEFX execVM "\qipTPL\3rdPartyAddons\MKY\snow\MKY_Snow_Client.sqf";
	};
};
