private ["_unit","_didJIP"];

_unit = (_this select 0);
_didJIP = (_this select 1);

//No third person bullshit here
call USEC_fnc_restrictThirdPerson;

//Make sure all the ranks are synced
{
	_x call USEC_fnc_syncRank;
} forEach (call CBA_fnc_players);


//Non USEC-Standard code below here ------------------------------------------