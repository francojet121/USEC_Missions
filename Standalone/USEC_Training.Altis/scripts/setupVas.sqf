private ["_box"];
_box = _this;

clearItemCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearBackpackCargoGlobal _box;

["AmmoboxInit",[_box,true,{true}]] spawn BIS_fnc_arsenal;

_box addAction ["<t color='#FF0000'>Load Rifleman</t>", "[player, ""rifleman""] call USEC_fnc_giveLoadout"];
_box addAction ["<t color='#FF0000'>Load Rifleman (AT)</t>", "[player, ""riflemanat""] call USEC_fnc_giveLoadout"];
_box addAction ["<t color='#FF0000'>Load Machine Gunner</t>", "[player, ""mg""] call USEC_fnc_giveLoadout"];
_box addAction ["<t color='#FF0000'>Load Marksman</t>", "[player, ""marksman""] call USEC_fnc_giveLoadout"];
_box addAction ["<t color='#FF0000'>Load Medic</t>", "[player, ""medic""] call USEC_fnc_giveLoadout"];
_box addAction ["<t color='#FF0000'>Load Team Leader</t>", "[player, ""teamleader""] call USEC_fnc_giveLoadout"];
_box addAction ["<t color='#FF0000'>Load Squad Leader</t>", "[player, ""squadleader""] call USEC_fnc_giveLoadout"];
_box addAction ["<t color='#FF0000'>Load Fixed Wing Pilot</t>", "[player, ""fixedpilot""] call USEC_fnc_giveLoadout"];
_box addAction ["<t color='#FF0000'>Load Helicopter Crewman</t>", "[player, ""aircrew""] call USEC_fnc_giveLoadout"];