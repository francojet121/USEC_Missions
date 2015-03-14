usec_iedCount = {
/*
  _numIEDs = [_x, _optionsChances] call usec_iedCount;
  _x = ["Marker",#IEDs,[%Override (4)],"ActivationSide"]

  Return: [#,#,#] # of each type to spawn  
*/

private ["_total","_chances","_countIEDs"];
  _total = _this select 0 select 1; // # IEDs for the zone
  _chances = _this select 0 select 2;  // Array of override % chances for the zone

  // Check if there is an override %
  if (count (_chances) == 0) then { _chances = _this select 1; }; 

  for "_i" from 0 to ((count _chances)-1) step 1 do {
    _chances set [_i, ceil(_total*(_chances select _i) / 100)]; // Reusing the _chances variable to hold the calculated # of ieds.
  };

  // Return
  _chances // [# small, # medium, # big]
};

usec_iedPosition = {
// [_zone,_zonesSafe,_optionsLocations] call usec_iedPosition

private ["_zied","_zsafe","_optSIF","_optSNB","_optSIB","_inBld","_pos","_posB"];

_zied = _this select 0; // ied zone name
_zsafe = _this select 1;  // safe zones array
_optSIF = _this select 2 select 0;  // Spawn In Fields
_optSNB = _this select 2 select 1;  // Spawn Near Buildings
_optSIB = _this select 2 select 2;  // Spawn In Buildings
 
  if (_optSIF==1) then {_optSIF = 0;} else {_optSIF = 1;};
  if (_optSNB==1) then {_optSNB = 2;} else {_optSNB = 1;};

  _inBld = 0;
  
  _pos = [_zied,0, _zsafe,1, [_optSIF,50], [0,360], [_optSNB, 10,20], [0,0,0], [1,20], [0,0,-1], [0,0,0], [0,0,0], 1] call Zen_FindGroundPosition;
  
  if (_optSIB == 1) then {
    if (random 100 < 90) then { // 20% chance of moving a location to a nearby building
      _posB = [_pos,1,false] call Zen_FindBuildingPositions;
      if (count _posB > 0) then {
        _pos = _posB select (random ((count _posB) - 1));
        _inBld = 1;
      };
    };
  };
 
  // Return
 [_pos,_inBld] // [x,y,z]
};

usec_iedCreateIED = {
//_ied = [[ied position], inside?, s/m/l index,[[small items],[med],[large]]]call usec_iedCreateIED;

private ["_pos","_inBuild","_size","_iSml","_iMed","_iLrg","_item"];
  
_pos = _this select 0;  // ied position
_inBld = _this select 1;  // ied in building?
_size = _this select 2; // Array index of numIEDs.  0/1/2 correspond with Small/Medium/Large
_iSml = _this select 3 select 0;
_iMed = _this select 3 select 1;
_iLrg = _this select 3 select 2;
  
    if (_inBld == 1) then {_size = 0;}; // Use small items for interior IEDs, even if they'll spawn large explosions
  switch (_size) do {
    case 0: { _item = _iSml call Zen_ArrayGetRandom; }; // Small
    case 1: { _item = _iMed call Zen_ArrayGetRandom; }; // Medium
    case 2: { _item = _iLrg call Zen_ArrayGetRandom; }; // Large
    default { _item = _iSml call Zen_ArrayGetRandom; }; // All else fails, use a small item
  };

  _item = [_pos, _item,0, random 360, true] call Zen_SpawnVehicle;
  
  // return ied
  _item
};
/*
usec_iedAddActionDisarm = {
// 
private [];

};

usec_iedCreateTrigger = {
// _iedTrigger = [_iedPos select 0, _ni, _activationSide, _optionsChancesFake, _optionsDisarm] call usec_iedCreateTrigger;
// _optionsDisarm = [_disarmIsItemRequired,_disarmItems,_disarmClassBonus,_disarmClasses,_disarmBaseChance,_disarmBonusChance,_disarmWithExplosives];

private ["_trg","_pos","_side","_chanceFake","_chanceDud","_itemIsReqd","_itemList","_bonusIsGiven","_bonusClasses","_disarmBase","_disarmBonus"];

_pos = _this select 0;
_size = _this select 1;
_side = _this select 2;
_chanceFake = _this select 3 select 0;
_chanceDud = _this select 3 select 1;
_itemIsReqd = _this select 4 select 0; // Require an item to disarm 0/1
_itemList = _this select 4 select 1; // Required items list
_bonusIsGiven = _this select 4 select 2; // Give a bonus to disarm
_bonusClasses = _this select 4 select 3; // Which classes get bonus
_disarmBase = _this select 4 select 4; // Disarm base chance
_disarmBonus = _this select 4 select 5; // Disarm bonus adjustment
 

_size = 
  switch (_size) do {
    case 0: {  }; // Small
    case 1: {  }; // Medium
    case 2: {  }; // Large
    case 3: {  }; // Dud
    default {  }; // All else fails, use this
  };
  // If Fake, no trigger
  // If Dud, trigger with small poof
  // Trigger Conditions - All Within 10 meters
  //  1) Player Present - player height?
  //  2) Player speed
  //  3) Player critical distance 
  //  4) If items req'd, Items present	// Do I need to do this or just rely on AGM explosives mechanics?
  //  5) Shows disarm option	// Do I need to do this or just rely on AGM explosives mechanics?
  
  _trg = createTrigger ["EmptyDetector",_pos];
  _trg = setTriggerArea [10,10,0,false];  // Creates a trigger monitoring a 10m x 10m circle. That should be enough distance for all sizes to work in.
  _trg = setTriggerActivation ["WEST", "PRESENT", true];
  _trg = setTriggerStatements [,,];
// return
};

usec_iedExplosionSmall {
// Size - what blows up - rpg, mortar, helicopter explosion, etc.)
// Effects - cloud of smoke, debris thrown around, light flashes, noises

};

usec_iedExplosionMedium {

};

usec_iedExplosionLarge {

};

usec_iedExplosionDud {

};
