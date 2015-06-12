private ["_unit","_didJIP"];

_unit = (_this select 0);
_didJIP = (_this select 1);

//No third person bullshit here
call USEC_fnc_restrictThirdPerson;


//Non USEC-Standard code below here ------------------------------------------