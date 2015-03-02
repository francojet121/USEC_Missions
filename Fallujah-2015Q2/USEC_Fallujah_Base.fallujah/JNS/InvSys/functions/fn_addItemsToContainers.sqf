// Add items to Containers, starting with Uniform, when Uniform is full, start adding to Vest, then to Backpack

for "_i" from 1 to (_x select 1) do {
  if (_player canAddItemToUniform (_x select 0)) then {
    _player addItemToUniform (_x select 0);
  } else {
    if (_player canAddItemToVest (_x select 0)) then {
      _player addItemToVest (_x select 0);
    } else {
      if (_player canAddItemToBackpack (_x select 0)) then {
          _player addItemToBackpack (_x select 0);
      };
    };
  };
};
