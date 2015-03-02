_configWeaponType = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");

_weaponTypes = [101,  // Muzzle
                201,  // Optics
                301   // Side Mount
                ];

// Check if item is of any Weapon Type
_isAttachment = false;
{
  if (_configWeaponType == _x) then {
    _isAttachment = true;
  };
} forEach _weaponTypes;

if (_isAttachment) then {      
  _player addPrimaryWeaponItem _x;
  _player addSecondaryWeaponItem _x;
  _player addHandgunItem _x;
};
