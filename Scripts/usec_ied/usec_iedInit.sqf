if (!isServer) exitWith {};

/***SETTINGS***/
#include "usec_iedFunctions.sqf";

// Activation
  _activationSide = "WEST";
  
// Debug
  _debugShowZones = 1; // 0 = Hide Zones, 1 = Show Zones
  _debugShowIEDs  = 1; // 0 = Hide Zones, 1 = Show Zones
_optionsDebug = [_debugShowZones, _debugShowIEDs];

// Disarm
  _disarmIsItemRequired = 0;  // 0 = No, 1 = Yes
  _disarmItems = ["toolkit","AGM_DefusalKit"];  // Array of disarm capable items
  _disarmClassBonus = 0; // 0 = No, 1 = Yes. Improved disarm chance for specific classes
  _disarmClasses = ["B_soldier_exp_F", "B_engineer_F"];  // Classes receiving disarm bonus
  _disarmBaseChance = 75;  // Base % chance of successful disarm
  _disarmBonusChance = 20;  // Adjustment % for bonus classes
  _disarmWithExplosives = 1; // Allow explosives to trigger IEDs.  I need to look into ways of making this work
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
  
_optionsChancesIED = [_spawnChanceSmall,_spawnChanceMedium,_spawnChanceLarge];
_optionsChancesFake = [_spawnChanceFake,_spawnChanceDud];

// Item Types
  _itemsSmall = ["Land_MetalBarrel_F"];//Land_MetalBarrel_F
  _itemsMedium = ["Land_Bricks_V2_F"];//Land_Bricks_V2_F
  _itemsLarge = ["RHS_M6"];
_optionsItems = [_itemsSmall,_itemsMedium,_itemsLarge];

/***MARKERS***/
/*
  Created Markers in Code:
    ["Marker",#IEDs,[%,%,%],[%,%],Location,Size,Shape,Direction]
  Placed Markers 
    ["Marker",#IEDs,[%,%,%],[%,%]]
  
  Once created markers are placed, remove Location,Size,Shape,Direction
*/

// Create Markers in code
  // Do this later
  
// List Markers placed on the map
_placedMarkersIED =  [["iedFallujah1",100,[],[]],["iedFallujah2",10,[],[]],["iedFallujah3",13,[0,100,0],[0,0]]];
_placedMarkersSafe = ["iedSafe1","iedSafe2"];

// Combine code markers and placed markers
_zonesIED = _placedMarkersIED;
_zonesSafe = _placedMarkersSafe;


/***SPAWNING***/
// ied = [iedName,iedLocation,iedSize,trigger?] ???

_arrIEDs = [];

{
  _zone = _x;
  //if (_debugShowZones == 0) then { _zone setMarkerAlpha = 0;};
  
  _numIEDs = [_zone, _optionsChancesIED] call usec_iedCount; // return: array of how many of each size to spawn [#s,#m,#l]
  {
    _n = _x;
    _ni = _forEachIndex;  // Array index = ied size
    for "_i" from 0 to _n do {
      _iedPos  = [_zone select 0, _zonesSafe, _optionsLocations] call usec_iedPosition;  // return: [[x,y,z],inBuilding]
    
      if (_debugShowIEDs == 1) then {
        [_iedPos select 0, Format ["ied_%1_%2", _n,_i], "ColorBlack", [.6,.6], "mil_dot"] call Zen_SpawnMarker;
      };    
      
      _iedItem = [_iedPos select 0, _iedPos select 1, _ni ,_optionsItems] call usec_iedCreateIED; // return: ied object
      
      //_iedTrigger = [_iedPos select 0, _ni, _activationSide, _optionsChancesFake, _optionsDisarm] call usec_iedCreateTrigger; // return: do I really need to return anything?
    
      //_ied addAction [("<t color=""#0074E8"">" + ("Disarm IED") +"</t>"),"usec_iedActionDisarm", [_ied, _optionsDisarm], 6,false,true,"","((player distance _ied) < 1) && <logic for having item>"];
    };  
    
  } forEach _numIEDs;
} forEach _zonesIED;



_a = 1;
while {_a == 1} do {
  hint format ["%1 -- %2", getPosASL player, getPosATL player];
  sleep 1;
};



































