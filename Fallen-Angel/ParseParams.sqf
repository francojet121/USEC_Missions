//

private ["_AISkill", "_maxIndfor", "_AISquadRange", "_overcastRangeStart", "_fogRangeStart", "_overcastRangeEnd", "_fogRangeEnd", "_overcastTime", "_fogTime", "_hourRange", "_allowCivCars", "_allowFullResupply"];

if !(isMultiplayer) then {
    _AISkill = "militia";
    _maxIndfor = 40;
    _AISquadRange = [2,4];
    _overcastRangeStart = [0, 1];
    _fogRangeStart = [0, 0.2];
    _overcastRangeEnd = [0, 1];
    _fogRangeEnd = [0, 0.2];
    _overcastTime = 60*60;
    _fogTime = 60*30;
    _hourRange = [0,23];
    _allowCivCars = true;
    _allowFullResupply = true;
} else {
    {
        switch (_forEachIndex) do {
            case 0: { // AI skill
                if (isDedicated) then {
                    switch (_x) do { // copied from Zen_SetAISkill, with accuracy at 1/3
                        case 0: {
                            _AISkill = [[0.02, 0.023], [0.01, 0.02], [0.1, 0.15], 1, [0, 0.2], [0.2, 0.4], [0.5, 0.6], [0.1, 0.2], [0.5, 0.6], [0.1, 0.2]];
                        };
                        case 1: {
                            _AISkill = [[0.027, 0.033], [0.03, 0.04], [0.15, 0.2], 1, [0.4, 0.5], [0.5, 0.7], [0.7, 0.8], [0.6, 0.8], [0.7, 0.8], [0.3, 0.4]];
                        };
                        case 2: {
                            _AISkill = [[0.047, 0.05], [0.1, 0.12], [0.25, 0.3], 1, 1, 1, 1, 1, [0.8, 0.9], [0.5, 0.6]];
                        };
                    };
                } else {
                    switch (_x) do {
                        case 0: {
                            _AISkill = "militia";
                        };
                        case 1: {
                            _AISkill = "infantry";
                        };
                        case 2: {
                            _AISkill = "SOF";
                        };
                    };
                };
            };
            case 1: { // AI strength
                switch (_x) do {
                    case 0: {
                        _maxIndfor = 40;
                    };
                    case 1: {
                        _maxIndfor = 60;
                    };
                    case 2: {
                        _maxIndfor = 80;
                    };
                };
            };
            case 2: { // AI squad size
                switch (_x) do {
                    case 0: {
                        _AISquadRange = [2,4];
                    };
                    case 1: {
                        _AISquadRange = [4,6];
                    };
                    case 2: {
                        _AISquadRange = [6,10];
                    };
                };
            };
            case 3: { // weather start
                switch (_x) do {
                    case 0: {
                        _overcastRangeStart = [0, 0.3];
                        _fogRangeStart = [0, 0.2];
                    };
                    case 1: {
                        _overcastRangeStart = [0.8, 1];
                        _fogRangeStart = [0.1, 0.3];
                    };
                    case 2: {
                        _overcastRangeStart = [0.3, 0.5];
                        _fogRangeStart = [0.6, 0.8];
                    };
                    case 3: {
                        _overcastRangeStart = [0, 1];
                        _fogRangeStart = [0, 1];
                    };
                };
            };
            case 4: { // weather end
                switch (_x) do {
                    case 0: {
                        _overcastRangeEnd = [0, 0.3];
                        _fogRangeEnd = [0, 0.2];
                    };
                    case 1: {
                        _overcastRangeEnd = [0.8, 1];
                        _fogRangeEnd = [0.1, 0.3];
                    };
                    case 2: {
                        _overcastRangeEnd = [0.3, 0.5];
                        _fogRangeEnd = [0.6, 0.8];
                    };
                    case 3: {
                        _overcastRangeEnd = [0, 1];
                        _fogRangeEnd = [0, 1];
                    };
                };
            };
            case 5: { // weather change time
                switch (_x) do {
                    case 0: {
                        _overcastTime = 60*30;
                        _fogTime = 60*15;
                    };
                    case 1: {
                        _overcastTime = 60*60;
                        _fogTime = 60*30;
                    };
                    case 2: {
                        _overcastTime = 60*90;
                        _fogTime = 60*45;
                    };
                };
            };
            case 6: { // time of day
                switch (_x) do {
                    case 0: {
                        _hourRange = [8,17];
                    };
                    case 1: {
                        _hourRange = [19,29];
                    };
                    case 2: {
                        _hourRange = [0,23];
                    };
                };
            };
            case 7: { // allow civilian cars in towns
                switch (_x) do {
                    case 0: {
                        _allowCivCars = false;
                    };
                    case 1: {
                        _allowCivCars = true;
                    };
                };
            };
            case 8: { // allow full resupply
                switch (_x) do {
                    case 0: {
                        _allowFullResupply = false;
                    };
                    case 1: {
                        _allowFullResupply = true;
                    };
                };
            };
        };
    } forEach paramsArray;
};
