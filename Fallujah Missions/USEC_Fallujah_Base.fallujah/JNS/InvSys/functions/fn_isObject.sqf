// Check if script is ran via addAction on object or directly on player and assign a proper variables

if (!isPlayer (_this select 0)) then {
  _object = _this select 0; // Object to which addAction is added
  _player = _this select 1;	// Player using addAction
} else {
  _player = _this select 0;	// Player
};
