// USEC_Fallen_Angel <built for 0.7.0> by USEC
// Version = <150105>
// Tested with ArmA 3 <version number>

/////////////////////////////////////////////////

#include "Zen_FrameworkFunctions\Zen_InitHeader.sqf"
#include "JIPSync.sqf"
#include "ParseParams.sqf"
#include "functions.sqf"

#define CRASH_POS_ARGS 1, [3,150], 0, 0, 0, [1, 20], [1, 20, 10], [1,5,15] 
#define AA_POS_ARGS 1, [3,150], 0, 0, 0, [1, 20], [1, 20, 10], [1,1,30]
#define OPFOR_LOADOUTS ["Rifleman", "Rifleman", "AssistantAA", "AssistantAT", "AssistantAR", "Recon", "TeamLeader", "Grenadier", "Autorifleman", "Marksman", "Medic"]
#define BLUFOR_SIDE West
#define OPFOR_SIDE Independent

"mkAll" setMarkerAlpha 0;
"mkClose" setMarkerALpha 0;
Last_Fire_Event_Time_Local = 1;
Comm_Support_Array_Local = [];

/////////////////////////////////////////////////
player createDiaryRecord ["Diary", ["Mission", "Your mission is to locate and retrieve a downed helicopter and flight crew.  Evacuate the surviving crew, retrieve the helicopter's encryption module, and destroy the wreck before withdrawing.<br\><br\>Good intel is scarce right now; however, we certainly expect OPFOR to be out in force trying to beat us to the wreck.  Command doesn't have details for us yet, but expect coordinates for a search zone by the time you leave your staging point.<br\><br\>Enemy patrols are working to block the rescue convoy and to find the wreck.  The patrols will continue to spawn until you return to the staging zone with your cargo.  If you take too long, OPFOR will beat you to the target."]];
/////////////////////////////////////////////////

{
  _x addEventHandler ["Fired", f_HandleFire];
} forEach playableUnits;	// ??? get away with using allUnits?

if !(isServer) exitWith {titleText ["United Security Force", 2];};

/////////////////////////////////////////////////

// EVERYTHING BELOW IS SERVER SIDE ONLY

/////////////////////////////////////////////////

/*Time and Weather Information
// Time and Weather Information
// Starting Location
_startPos = ["mkClose"] call Zen_FindGroundPosition;
// Starting Time
_startHour = (_hourRange + [true]) call Zen_FindInRange;
_startMinute = round random 60;
//Weather Control
0 = [["overcast", (_overcastRangeStart call Zen_FindInRange), (_overcastRangeEnd call Zen_FindInRange), _overcastTime], ["fog", (_fogRangeStart call Zen_FindInRange), (_fogRangeEnd call Zen_FindInRange), _fogTime], ["date", _startMinute, _startHour]] spawn Zen_SetWeather;

sleep 1;

// Sync Position and Time
Zen_MP_Closure_Packet = ["f_PrintTitle", ["Altis: " + mapGridPosition _startPos + "\n" + str (((_startHour*100) + _startMinute) mod 2400) + " Hours", 3]];
publicVariable "Zen_MP_Closure_Packet";
// Sync Weather
Zen_JIP_Args_Server = [time, overcast, overcastForecast, time, _overcastTime, fog, fogForecast, time, _fogTime, [playableUnits]];
*/

/////////////////////////////////////////////////

// Randomize crash position using the parameters in CRASH_POS_ARGS
_crashpos = ["mkAll",0,["mkClose"], CRASH_POS_ARGS] call Zen_FindGroundPosition;

_pilot = [_crashpos] call f_CrashSite;  // returns _crashedHeli & _pilot
_searcharea = [_crashpos] call f_CrashMarker;
[_pilot, BLUFOR_SIDE] spawn f_CrashSiteTrigger;


/////////////////////////////////////////////////

// Spawn AA Sites.  Random locations around map.

for "_i" from 1 to 4 do {
	_aapos = ["mkAll",0,["mkClose",""], CRASH_POS_ARGS] call Zen_FindGroundPosition;
	[_aapos, "", "ColorBlack", [.6,.6],"mil_dot"] call Zen_SpawnMarker;
	[_aapos,OPFOR_SIDE,_aiskill] call f_AASite;
};






/*
_opforPatrolArray = [];

for "_i" from 20 to (20 + random _maxIndfor) do {		// This is where a mission parameter replaces the 10 for difficulty adjustment
    _opforPatrolGroup = [(["mkAll", [1000, 1000]] call Zen_FindGroundPosition), OPFOR_SIDE, _AISkill, _AISquadRange] call Zen_SpawnInfantry;
    [_opforPatrolArray, _opforPatrolGroup] call Zen_ArrayAppend;
};

[_opforPatrolArray, OPFOR_SIDE, OPFOR_LOADOUTS] call Zen_GiveLoadout;
//_OpforPatrolArray, _crashpos, [200, 1000]] spawn Zen_OrderInfantryPatrol;

["mkAll", 3500, 200] call Zen_SpawnAmbientVehicles;








