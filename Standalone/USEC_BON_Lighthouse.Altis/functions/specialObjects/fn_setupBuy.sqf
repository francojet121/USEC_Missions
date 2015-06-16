/*
	BONYO_fnc_setupBuy
	
	DESCRIPTION:
		This function adds the various addactions for the buying stand to the given object
		
	PARAMETERS:
		Object
			The object to add actions to
			
	RETURNS
		nothing
		
	EXAMPLE
		 _object call BONYO_fnc_setupBuy
*/

private ["_object"];

_object = _this;

if (isNil "_object") then {
	["The given argument is nil"] call BIS_fnc_error;
};

_object addAction ["Buy Quadbike $1000", {["B_Quadbike_01_F",1000] call BONYO_fnc_buyVehicle}, nil, 6, false, true];
_object addAction ["Buy HMMWV $4,000", {["rhsusf_m1025_w",4000] call BONYO_fnc_buyVehicle}, nil, 6, false, true];
_object addAction ["Buy HMMWV (M2) $10,000", {["rhsusf_m1025_w_m2",10000] call BONYO_fnc_buyVehicle}, nil, 6, false, true];
_object addAction ["Buy M113 $20,000", {["rhsusf_m113_usarmy",20000] call BONYO_fnc_buyVehicle}, nil, 6, false, true];
_object addAction ["Buy Humming Bird $50,000", {["B_Heli_Light_01_F",50000] call BONYO_fnc_buyVehicle}, nil, 6, false, true];
_object addAction ["Buy Pawnee $100,000", {["B_Heli_Light_01_armed_F",100000] call BONYO_fnc_buyVehicle}, nil, 6, false, true];

_object addAction ["<t color='#FF0000'>--------------------------------</t>", "", nil, 6, false, true];

_object addAction ["Buy Sandbag Wall $25", {["Land_BagFence_Long_F", 25] call BONYO_fnc_buyFort}, nil, 6, false, true];
_object addAction ["Buy Sandbag Wall (Round) $30", {["Land_BagFence_Round_F", 30] call BONYO_fnc_buyFort}, nil, 6, false, true];
_object addAction ["Buy Sandbag Wall (Corner) $15", {["Land_BagFence_Corner_F", 15] call BONYO_fnc_buyFort}, nil, 6, false, true];
_object addAction ["Buy Sandbag Wall (Tiny) $10", {["Land_BagFence_End_F", 10] call BONYO_fnc_buyFort}, nil, 6, false, true];
_object addAction ["Buy H-Barrier $50", {["Land_HBarrier_3_F", 50] call BONYO_fnc_buyFort}, nil, 6, false, true];
_object addAction ["Buy H-Barrier (Single) $20", {["Land_HBarrier_1_F", 20] call BONYO_fnc_buyFort}, nil, 6, false, true];
_object addAction ["Buy Ramp $5", {["Land_Obstacle_Ramp_F", 5] call BONYO_fnc_buyFort}, nil, 6, false, true];