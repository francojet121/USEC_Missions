_array=_this select 3;
_object=_this select 0;
_unit=_this select 1;
_action=_this select 2;

if (_unit distance _object<2) then {
	_unit playMove "amovpknlmstpsraswrfldnon_gear";
	_object removeAction _action;
	sleep 2;
	_object setVariable ["IEDStatus",0,true];
	_object removeEventHandler ["Hit",(_object getVariable "IEDHandler")];
	_pos=getPosATL _object;
	_unit switchMove "";
	hintSilent "IED Disarmed";
	
	_chance=floor(random 100);
	if (_chance>75) then {// They had a 75% chance, and lost
		if (isServer) then {
			[_pos] spawn fnc_iedSpawnEnemy;
		} else {
			iedEnemySpawn=_pos;
			publicVariableServer "iedEnemySpawn";
		};
	};
} else {
	_rand = floor(random 4);
	switch (_rand) do {
		case 0: {hintSilent "Get closer chicken!";};
		case 1: {hintSilent "Bomb activated!";};
		case 2: {hintSilent "Get closer wuss!";};
		case 3: {hintSilent "How long do you think your arms are?";};
	};
};