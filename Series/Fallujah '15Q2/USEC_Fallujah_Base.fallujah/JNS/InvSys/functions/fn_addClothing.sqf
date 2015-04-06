_configClothingType = getNumber (configFile >> "CfgWeapons" >> _x >> "ItemInfo" >> "type");

switch (_configClothingType) do {
  case 605: { // Headgear
    _player addHeadgear _x;
  };
  case 801: { // Uniform
    _player forceAddUniform _x;
  };
  case 701: { // Vest
    _player addVest _x;
  };
};
