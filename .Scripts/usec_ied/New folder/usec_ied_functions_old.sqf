usec_iedCount = {
/*
  _numIEDs = [_x, _optionsChances] call usec_iedCount;
  _x = ["Marker",#IEDs,[%Override (4)],"ActivationSide"]

  Return: [#,#,#,#,#] # of each type to spawn  
*/
private ["_total","_chances","_countIEDs"];
  _total = _this select 0 select 1; // # IEDs for the zone

  _chances = _this select 0 select 2;  // Array of % chance of each spawn

  // Check if there is an override %
  if (count (_chances) == 0) then { _chances = _this select 1; }; 

  //
  for "_i" from 0 to 2 step 1 do {
    (_chances select 0) set [_i, ceil(_total*(_chances select 0 select _i) / 100)];
  };

  // Return
  _chances // [# small, # medium, # big, % fake, % dud]
};

usec_iedLocation = {
// [_zName,_zonesSafe,_optionsLocations] call usec_iedLocation;

private ["_zied","_zsafe","_optSIF","_optSNB","_optSIB","_zenRoad","_zenNBld","_zenIBld","_pos"];

_zied = _this select 0;
_zsafe = _this select 1;
_optSIF = _this select 2 select 0;
_optSNB = _this select 2 select 1;
_optSIB = _this select 2 select 2;
 
  if (_optSIF==1) then {_zenRoad = 0;} else {_zenRoad = 1;};
  if (_optSNB==1) then {_zenNBld = 2;} else {_zenNBld = 1;};

  _pos = [_zied,0,_zsafe,1,[_zenRoad,50],[0,360],[_zenNBld, 10,20],[0,0,0],[1,20],[0,0,-1],[0,0,0],[0,0,0],1] call Zen_FindGroundPosition;
  /*if (_optSIB == 1) then {
    if (random 100 < 20) then {
      _pos = [_pos,1,false] call Zen_FindBuildingPositions;
     hintC format ["%1", _pos];
    };
  };*/
  _pos
};

usec_iedCreate = {
// [_loc, _optionsItems, _y] call usec_iedCreate;

private ["_nIEDindex","_iSmall","_iMed","_iLrg","_item"];

_nIEDindex = _this select 2; 
_iSmall = _this select 1 select 0;
_iMed = _this select 1 select 1;
_iLrg = _this select 1 select 2;


_item = _iSmall call Zen_ArrayGetRandom;
hintc format ["%1", _item];
  switch (_nIEDindex) do {
    case 0: { _item = _iSmall call Zen_ArrayGetRandom; }; // Small
    case 1: { _item = _iMed call Zen_ArrayGetRandom; }; // Medium
    case 2: { _item = _iLrg call Zen_ArrayGetRandom; }; // Large
    default { _item = _iSmall call Zen_ArrayGetRandom; };
  };

  _item = [_loc, _item, random 360] call Zen_SpawnGroundVehicle;
  
_item
  
};

usec_iedTrigger = {
// [_ied, _loc, _optionsChances select 1, _optionsDisarm, _zSide, _y] call usec_iedTrigger;
// _optionsDisarm = [_disarmIsItemRequired,_disarmItems,_disarmClassBonus,_disarmClasses,_disarmBaseChance,_disarmBonusChance,_disarmWithExplosives];  
  
  private ["_trg","_pos"];
  
  _pos = _this select 1;
  _chanceFake = _this select 2 select 0;
  _chanceDud = _this select 2 select 1;
  
  _side = _this select 4; // activation side
  _nIEDindex = _this select 5;  // size
  
 // if (random 100 < _chanceFake) then {exitWith {};};
 // if (random 100 < _chanceDud) then { _nIEDindex = 3;};
  
   switch (_nIEDindex) do {
    case 0: {
      _trg=createTrigger["EmptyDetector",_pos];
      _trg setTriggerArea[2,2,0,false];
      _trg setTriggerActivation[_side,"PRESENT",true];
      _trg setTriggerStatements["this","[loc, 'M_Titan_AP', random 360] call Zen_SpawnGroundVehicle;", "hint 'no civilian near'"]; 

    }; // Small
    case 1: {


    }; // Medium
    case 2: {
    
    
    }; // Large
    case 3: {
    
    
    }; // Dud    
    default { 


    };
  };
 };

usec_iedExplosionSmall = {
_spot = this select 0;
  _bomb = [_spot, "M_Titan_AP", random 360] call Zen_SpawnGroundVehicle;

};

usec_iedExplosionMedium = {
  _explosiveSequence = ["M_Titan_AP","M_Titan_AP"]; 

};

usec_iedExplosionBig = {
  _explosiveSequence = ["M_Titan_AP","M_Titan_AP"]; 

};

usec_iedExplosionDud = {
  _explosiveSequence = ["M_Titan_AP","M_Titan_AP"]; 

};

usec_iedDisarm = {
  _explosiveSequence = ["M_Titan_AP","M_Titan_AP"]; 

};

usec_iedRemove = {
  _explosiveSequence = ["M_Titan_AP","M_Titan_AP"]; 

};