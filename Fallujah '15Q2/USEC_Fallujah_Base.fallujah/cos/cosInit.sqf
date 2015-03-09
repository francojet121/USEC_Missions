/*
 Civilian Occupation System (COS)
 By BangaBob v0.5
 
 null=[] execVM "cos/cosInit.sqf";
 
 IMPORTANT: BEFORE PROCEEDING ADD AN OBJECT NAMED 'headlessClient3' INTO THE EDITOR.
 
 To edit population of zones browse to line 95
 Open COS/AddScript_Unit.sqf to apply scripts to spawned units.
 Open COS/AddScript_Vehicle.sqf to apply scripts to spawned vehicles.
 To get Array of COS markers use _allMarkers=headlessClient3 getvariable "COSmarkers";
*/

if (isNil "headlessClient3") then {
  diag_log "You must ADD a object named 'headlessClient3'";
  player sideChat "You must ADD a object named 'headlessClient3'";
} else {
if (!isServer && !hasInterface) then {
If (!isNil ("COScomplete")) then {diag_log "Check your call. COS was called twice!";}else{

COS_distance=500;//Set spawn distance
_aerielActivation=false;// Set if flying units can activate civilian Zones

blackListTowns = ["Jolan", "Mualimeen", "Muhandisin", "Al-Fallujah", "Shurta", "Jeghaifi", "Askari", "Industrial Park", "Nazal Old City", "Resafa", "Sinai", "Shuhada"];// Remove towns from COS

whiteListMkrs=["cosSpawn1", "cosSpawn2", "cosSpawn3", "cosSpawn4"];// Add Custom Markers for COS to populate 

DefaultSide = Civilian;// Set side of units spawned

_showMarker=false;// Show COS markers on map

showTownLabel = false;// Show town information when entering COS zones

debugCOS=false;// Show spawned units on the map

COSpedestrians=true; //Spawn pedestrians
COScars=false;// Spawn Cars
COSparked=true;// Spawn parked cars

// Types of units that will be spawned as civilians.
COScivPool =["C_man_1","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_hunter_1_F","C_man_p_beggar_F","C_man_p_beggar_F_afro","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_w_worker_F"];	
COSmotPool =["C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_box_F","C_Van_01_fuel_F","C_Van_01_transport_F"];

COSmaxGrps=72;//Set Maximum group limit for COS at any one time (If limit is hit then civilians will be placed into a single group for each town)

// Browse to line 81 to customise number of civilians that spawn.
private ["_sizeX","_sizeY","_name","_pos","_mSize","_rad","_civilians","_vehicles","_parked","_actCond"];
breakPatrol_FNC=compile preprocessFileLineNumbers "cos\patrolFnc.sqf";unitScript_FNC=compile preprocessFileLineNumbers "cos\addScript_Unit.sqf";vehScript_FNC=compile preprocessFileLineNumbers "cos\addScript_Vehicle.sqf";
COScomplete=false;publicvariable "COScomplete";publicvariable "COS_distance";populating_COS=false;
cosMkrArray=[];
headlessClient3 setvariable ["cosGrpCount",0];//Set global group count
_rad=50;// Radius increase increment for finding minimum spawn points
_slack=2;// Additional spawn points

{
// Organise towns and markers
	if (_x in whiteListMkrs)
	 then {
		_sizeX=getMarkerSize _x select 0;
		_sizeY=getMarkerSize _x select 1;
		_pos=markerpos _x;
		_name=markerText _x;// Get the markers description
			if (_name == "") then {_name= _x;};// If description is empty then use marker name
			deletemarker _x;// Delete user placed marker	
			
		}else{
	 _name = text _x;// Get name
	 _sizeX = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusA");
	 _sizeY = getNumber (configFile >> "CfgWorlds" >> worldName >> "Names" >> (text _x) >> "radiusB");
	_pos=getpos _x;
			};
if (({_name==_x} count blackListTowns)>0 OR (_name == "")) then {}else{

			
// Scan for houses around the town area
	if (_sizeX < 50) then {_sizeX=300;};
	if (_sizeY < 50) then {_sizeY=300;};
	if (_sizeY>_sizeX) then {_mSize=_sizeY}else{_mSize=_sizeX};// Get the largest size
		_houses= count (nearestObjects [_pos, ["house"], _mSize]);// Count number of houses in town

		
// Customise population by number of houses
_randomisation=5;
	if (_houses <= 10) 
		then {
	_civilians=5+ round(random _randomisation);// Civilians spawned
	_vehicles=0;// Moving Vehicles Spawned
	_parked=1;// Parked Vehicles Spawned
			};		
 	if (_houses <= 30 and _houses > _randomisation) 
		then {
	_civilians=10+ round(random _randomisation);// Civilians spawned
	_vehicles=2;// Moving Vehicles Spawned
	_parked=2;// Parked Vehicles Spawned
			};
			
 	if (_houses <= 70 and _houses > 30) 
		then {
	_civilians=15+ round(random _randomisation);// Civilians spawned
	_vehicles=4;// Moving Vehicles Spawned
	_parked=2;// Parked Vehicles Spawned
			};
			
 	if (_houses <= 140 and _houses > 70) 
		then {
	_civilians=20+ round(random _randomisation);// Civilians spawned
	_vehicles=5;// Moving Vehicles Spawned
	_parked=3;// Parked Vehicles Spawned
			};
 	if (_houses > 140) 
		then {
	_civilians=25+ round(random _randomisation);// Civilians spawned
	_vehicles=5;// Moving Vehicles Spawned
	_parked=3;// Parked Vehicles Spawned
			};
			
 if (!COSpedestrians) then {_civilians=0;};	// If pedestrians disabled spawn 0
 if (!COScars) then {_vehicles=0;};// If cars disabled spawn 0
 if (!COSparked) then {_parked=0;};// If parked cars disabled spawn 0
 
 
// Create marker over town
	_markerID=format ["COSmkrID%1",_name];
		_foo = createmarker [_markerID, _pos];
		_foo setMarkerSize [_sizeX, _sizeY];
		_foo setMarkerShape "ELLIPSE";
		_foo setMarkerBrush "SOLID";
		_foo setMarkerColor "ColorGreen";
		_foo setMarkerText _name;
			cosMkrArray set [count cosMkrArray,_foo];
 if (!_showMarker) then {_foo setmarkerAlpha 0;}else{_foo setmarkerAlpha 0.5;};// Show or hide marker
	

// Get positions until we have enough for the population
 _roadlist = _pos nearRoads _mSize;
 _minPositions=(_civilians+_vehicles+_parked+_slack);
 if (count _roadlist < _minPositions) 
	then {
		while {count _roadlist < _minPositions} do 
			{
			_rad=_rad+_rad;
			_roadlist = _pos nearRoads (_mSize+_rad);
			sleep 0.1;
			};
		};
		
// Sort a position for each civilian
_roadPosArray = [];
_roadPosArray resize _minPositions;
_roadlist=_roadlist call BIS_fnc_arrayShuffle;

 for "_n" from 0 to _minPositions do
		{
     _roadPosArray set [_n, _roadlist select _n];
		};
	
// Save all information
	_information=[_civilians,_vehicles,_parked,_roadPosArray];
	_popVar=format["population%1",_foo];
	headlessClient3 setvariable [_popVar,_information];
		
// Create a trigger over town	
		_trigger = createTrigger ["EmptyDetector",_pos]; 
		_trigger setTriggerArea [(COS_distance+_sizeX),(COS_distance+_sizeY),0,FALSE]; 
		_trigger setTriggerActivation ["ANY","PRESENT",true];
		_trigger setTriggerTimeout [1, 1, 1, true];
			if _aerielActivation // Set whether units above 50m high will trigger
					then {
				_actCond="{vehicle _x in thisList && isplayer _x} count allunits > 0";
						}else{
					_actCond="{vehicle _x in thisList && isplayer _x && ((getPosATL _x) select 2) < 50} count allunits > 0";
						};
		_var=format["trig%1", _markerID];
		_trigAct=format ["null= [%1] execVM ""cos\cosCore.sqf"";headlessClient3 setvariable [%2,true];",str _foo,str _var];
		_trigDe=format ["headlessClient3 setvariable [%1,false];",str _var];
		_trigger setTriggerStatements [_actCond,_trigAct,_trigDe];
	};

}foreach (nearestLocations [getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["NameCityCapital","NameCity","NameVillage","CityCenter"], 25000]) +whiteListMkrs;

// All towns have been saved into cos Marker Array.
headlessClient3 setvariable ["COSmarkers",cosMkrArray,true];
COScomplete=true;publicvariable "COScomplete";
};

// LOCAL SCRIPTS
waituntil {COScomplete};
_mkrs=headlessClient3 getvariable "COSmarkers";// Use this to get all town markers
null=[] execVM "COS\localScript.sqf";// This shows messages for players during multiplayer

};
};
