if (!isServer) exitWith {};

/***SETTINGS***/
#include "usec_ied_functions.sqf";

// Debug
  _debugShowZones = 1; // 0 = Hide Zones, 1 = Show Zones
  _debugShowIEDs  = 1; // 0 = Hide Zones, 1 = Show Zones
_optionsDebug = [_debugShowZones, _debugShowIEDs];

// Disarm
  _disarmIsItemRequired = 1;  // 0 = No, 1 = Yes
  _disarmItems = ["toolkit","AGM_DefusalKit"];  // Array of disarm capable items
  _disarmClassBonus = 0; // 0 = No, 1 = Yes. Improved disarm chance for specific classes
  _disarmClasses = ["B_soldier_exp_F", "B_engineer_F"];  // Classes receiving disarm bonus
  _disarmBaseChance = 75;  // Base % chance of successful disarm
  _disarmBonusChance = 20;  // Adjustment % for bonus classes
  _disarmWithExplosives = 1; // Allow explosives to trigger IEDs
_optionsDisarm = [_disarmIsItemRequired,_disarmItems,_disarmClassBonus,_disarmClasses,_disarmBaseChance,_disarmBonusChance,_disarmWithExplosives];

// IED Spawning Locations
  _spawnInFields = 1;
  _spawnNearBuildings = 1;
  _spawnInBuildings = 1;
_optionsLocations = [_spawnInFields,_spawnNearBuildings,_spawnInBuildings];

// IED Spawning Chances
  _spawnChanceSmall = 40;
  _spawnChanceMedium = 40;
  _spawnChanceLarge = 20;
  _spawnChanceFake = 10; // % chance any IED may be fake - no trigger, separate from SML chance
  _spawnChanceDud = 10; // % chance any IED may be a dud - explosion without damage, separate from SML chance
  
_optionsChances = [[_spawnChanceSmall,_spawnChanceMedium,_spawnChanceLarge],[_spawnChanceFake,_spawnChanceDud]];

// Item Types
  _itemsSmall = ["Land_MetalBarrel_F"];
  _itemsMedium = ["Land_Bricks_V2_F"];
  _itemsLarge = ["Land_Wreck_Offroad2_F"];  // Don't use too large of items.  They may spawn in houses...
_optionsItems = [_itemsSmall,_itemsMedium,_itemsLarge];

/***MARKERS***/
/*
  Created Markers in Code:
    ["Marker",#IEDs,[[%,%,%],[%,%]],"ActivationSide",Location,Size,Shape,Direction]
  Placed Markers 
    ["Marker",#IEDs,[[%,%,%],[%,%]],"ActivationSide"]
  
  Once created markers are placed, remove Location,Size,Shape,Direction
*/

// Create Markers in code
  // Do this later
  
// List Markers placed on the map
_placedMarkersIED =  [["iedFallujah1",100,[],"WEST"],["iedFallujah2",10,[],"WEST"],["iedFallujah3",13,[[0,100,0],[0,0]],"WEST"]];
_placedMarkersSafe = ["iedSafe1","iedSafe2"];

// Combine code markers and placed markers
_zonesIED = _placedMarkersIED;
_zonesSafe = _placedMarkersSafe;


/***SPAWNING***/
_arrIEDs = [];

{
  _zName = _x select 0;
  _zSide = _x select 3;
  _numIEDs = [_x, _optionsChances] call usec_iedCount; // return: array of how many of each size to spawn [[s,m,l],[f,d]]

  {
    _y = _forEachIndex;
    hint format ["%1",_y];
    
    for "_i" from 0 to (_numIEDs select 0 select _forEachIndex) do {
      loc = [_zName, _zonesSafe, _optionsLocations] call usec_iedLocation; // return: single ied location
    
      _testing = [_loc,"ied","ColorBlack",[.6,.6],"mil_dot"] call Zen_SpawnMarker;  // this will be in the debug section later
      
      _ied = [_loc, _optionsItems, _y] call usec_iedCreate;  // return: single ied
      [_ied, _loc, _optionsChances select 1, _optionsDisarm, _zSide, _y] call usec_iedTrigger;
            
      //_arrIEDs pushBack _ied;
    };
  } forEach _numIEDs select 0;
} forEach _zonesIED;