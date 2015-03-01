//Zen_JIP_Args_Server = [time, overcast, overcastForecast, time, _overcastTime, fog, fogForecast, time, _fogTime, [playableUnits]];

if (_Zen_Is_JIP) then {
    titleText ["Good Luck", "BLACK FADED", 0.3];

    Zen_Task_Array_Global = 1;
    Zen_MP_Closure_Packet = ["Zen_SyncJIPServer", player];
    publicVariableServer "Zen_MP_Closure_Packet";

    waitUntil {
        (!(isNil "Zen_JIP_Args_Server") && (typeName Zen_Task_Array_Global == "ARRAY"))
    };

    _serverArgs = Zen_JIP_Args_Server;

    0 = [["overcast", (_serverArgs select 1), (_serverArgs select 2), (_serverArgs select 3) + (_serverArgs select 4) - (_serverArgs select 0)], ["fog", (_serverArgs select 5), (_serverArgs select 6), (_serverArgs select 7) + (_serverArgs select 8) - (_serverArgs select 0)], ["packet", false]] spawn Zen_SetWeather;
    
    if (count _serverArgs > 11) then {
        0 = [((_serverArgs select 11) select 0), "<t color='#2D8CE0'>Steal Intel</t>", "f_StealIntel", ((_serverArgs select 11) select 1)] call f_AddAction;
    };

    if ((count ([player] call Zen_GetUnitTasks)) == 0) then {
        0 = [([(_serverArgs select 10)] call Zen_ConvertToObjectArray) - [player], false] call Zen_AddGiveMagazine;
        0 = [player] call Zen_AddGiveMagazine;

        0 = [([(_serverArgs select 10)] call Zen_ConvertToObjectArray) - [player], false] call Zen_AddRepackMagazines;
        0 = [player] call Zen_AddRepackMagazines;

        0 = [player, BLUFOR_LOADOUTS] call Zen_GiveLoadoutBlufor;

        private ["_refUnit"];
        _refUnitArray = (units group player) - [player];
        if (count _refUnitArray == 0) then {
            _refUnit = (([west] call Zen_ConvertToObjectArray) - [player]) select 0;
        } else {
            _refUnit = _refUnitArray select 0;
        };

        if (vehicle _refUnit != _refUnit) then {
            player moveInAny (vehicle _refUnit);
            0 = [(vehicle _refUnit), BLUFOR_LOADOUTS, 1, false] call Zen_AddLoadoutDialog;
        } else {
            player setPosATL ([_refUnit, 2 + random 3, random 360] call Zen_ExtendPosition);
        };

        {
            if (_refUnit in (_x select 1)) then {
                _x set [1, (_x select 1) + [player]];
            };
        } forEach Zen_Task_Array_Global;
        publicVariable "Zen_Task_Array_Global";
    } else {
        0 = [(_serverArgs select 10), false] call Zen_AddGiveMagazine;
        0 = [(_serverArgs select 10), false] call Zen_AddRepackMagazines;
    };

    {
        0 = [(_x select 1), (_x select 4), (_x select 5), (_x select 3), false, (_x select 0), (_x select 6)] call Zen_InvokeTaskClient;
        0 = [(_x select 0)] call Zen_UpdateTask;
        sleep 0.1;
    } forEach Zen_Task_Array_Global;

    sleep 2;
    {
        _data = [_x] call Zen_GetTaskDataGlobal;
        _dest = _data select 3;
        _marker = [allMapMarkers, _dest] call Zen_FindMinDistance;
        if ((([_marker, _dest] call Zen_Find2dDistance) < 2) && {(markerShape _marker == "ICON")}) then {
            _marker setMarkerAlphaLocal 1;
        };
    } forEach ([player] call Zen_GetUnitTasks);
};

if (isServer) then {
    Zen_SyncJIPServer = {
        Zen_JIP_Args_Server set [0, time];
        Zen_JIP_Args_Server set [1, overcast];
        Zen_JIP_Args_Server set [2, overcastForecast];
        Zen_JIP_Args_Server set [5, fog];
        Zen_JIP_Args_Server set [6, fogForecast];

        (owner _this) publicVariableClient "Zen_Task_Array_Global";
        (owner _this) publicVariableClient "Zen_Fire_Support_Array_Global";
        (owner _this) publicVariableClient "Zen_Loadout_Array_Global";
        (owner _this) publicVariableClient "Zen_Damage_Increase";
        (owner _this) publicVariableClient "Zen_JIP_Args_Server";
    };
};
