// This file is part of Zenophon's ArmA 3 Co-op Mission Framework
// This file is released under Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International (CC BY-NC-ND 4.0)
// See Legal.txt

_Zen_stack_Trace = ["Zen_CalculatePositionObject", _this] call Zen_StackAdd;
private ["_area", "_min", "_max", "_water", "_pos", "_i", "_minAngle", "_maxAngle", "_road", "_roadDist", "_exit", "_nearestRoad", "_furthestRoad", "_roads", "_dist", "_iterationCount", "_failures", "_bestPos", "_leastFailures", "_maxFailures"];

_area = _this select 0;
_min = _this select 1;
_max = _this select 2;
_water = _this select 4;
_road = _this select 5;
_roadDist = _this select 6;
_minAngle = _this select 7;
_maxAngle = _this select 8;
_maxFailures = _this select 26;

_leastFailures = 20;
_bestPos = _area;
_pos = [0,0,0];
_exit = false;

if (_road == 2) then {
    _roads = _area nearRoads _max;
    _furthestRoad = [_roads, _area] call Zen_FindMaxDistance;

    if (count _roads > 0) then {
        _dist = [_furthestRoad, _area] call Zen_Find2dDistance;
        if (_dist < _min) then {
            0 = ["Zen_FindGroundPosition", "No valid position possible, no roads within area", _this] call Zen_PrintError;
            call Zen_StackPrint;
            _exit = true;
        };
    } else {
        0 = ["Zen_FindGroundPosition", "No valid position possible, no roads within area", _this] call Zen_PrintError;
        call Zen_StackPrint;
        _exit = true;
    };
};

if (_exit) exitWith {
    call Zen_StackRemove;
    (_area)
};

if (_water > 0) then {
    if (_water == 1) then {
        _exit = !([_area, _max, "land"] call Zen_IsNearTerrain);
    } else {
        _exit = !([_area, _max, "water"] call Zen_IsNearTerrain);
    };

    if (_exit) then {
        0 = ["Zen_FindGroundPosition", "No valid position possible, water preference impossible", _this] call Zen_PrintError;
        call Zen_StackPrint;
    };
};

if (_exit) exitWith {
    call Zen_StackRemove;
    (_area)
};

_iterationCount = ((((round (((_max^2) - (_min^2)) * (abs (_maxAngle - _minAngle)))) / 225)) max 20) min 1000;
for "_i" from 1 to _iterationCount step 1 do {
    _pos = [_area,_min,_max,_minAngle,_maxAngle] call Zen_PositionObject;

    if (_road in [1, 2]) then {
        _roads = _pos nearRoads _roadDist;
        if (count _roads > 0) then {
            _pos = ([([_roads] call Zen_ArrayGetRandom)] call Zen_ConvertToPosition);
        };
    };

    _dist = [_area, _pos] call Zen_Find2dDistance;
    if ((_dist <= _max) && (_dist >= _min)) then {
        _this set [27, _pos];
        _failures = _this call Zen_CheckPosition;

        if (_failures < _leastFailures) then {
            _bestPos = _pos;
            _leastFailures = _failures;
        };
    };

    if (_leastFailures <= _maxFailures) exitWith {};
    if (_i == _iterationCount) exitWith {
        0 = ["Zen_FindGroundPosition", "No valid position found", _this] call Zen_PrintError;
        call Zen_StackPrint;
    };
};

call Zen_StackRemove;
(_bestPos)
