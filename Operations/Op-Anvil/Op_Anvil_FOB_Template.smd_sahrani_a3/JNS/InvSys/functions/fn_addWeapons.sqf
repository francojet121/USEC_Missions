/*
_configWeaponType = getNumber (configFile >> "CfgWeapons" >> _x >> "type");

_weaponTypes = [1,  // primaryWeapon (Rifle)
                2,  // handgunWeapon (Pistol)
                4   // secondaryWeapon (Launcher)
                ];

// Check if item is of any Weapon Type
_isWeapon = false;
{
  if (_x == _configWeaponType) then {
    _isWeapon = true;
  };
} forEach _weaponTypes;

if (_isWeapon) then {
  _player addWeapon _x;
};
*/

_configWeaponSimulation = getText (configFile >> "CfgWeapons" >> _x >> "simulation");

if (_configWeaponSimulation == "Weapon" || _configWeaponSimulation == "Binocular") then {_player addWeapon _x};
