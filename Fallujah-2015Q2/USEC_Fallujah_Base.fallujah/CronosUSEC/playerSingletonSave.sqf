_playerObject = (_this select 0);
_id = (_this select 1);
_isLoaded = _playerObject getVariable ["loaded", "false"];
_isOnDisconnect = _playerObject getVariable ["disconnecting", "false"];
//Player ID
//Player Name
//Player Position
//player Direction
//Headgear
//Goggles
//Uniform
//UniformItems
//Vest
//VestItems
//Backpack
//Backpack items
//Inventory items
//Weapons
//Primary wep attachments
//Secondary wep attachments
//Handgun attachments



//_serverReply = ["argumentTest", "Is Player Loaded", _isLoaded] call invoke_java_method;
//_serverReply = ["argumentTest", "On Disconnect", _isOnDisconnect] call invoke_java_method;

_shouldSave = ( ( (_isLoaded == "true") && (canMove _playerObject) ) || ((_isLoaded == "true") && (_isOnDisconnect == "true") ) );

//_serverReply = ["argumentTest", "Should we save", _shouldSave ] call invoke_java_method;

if ((_shouldSave ) ) then {

//_serverReply = ["argumentTest", "We are saving on a disconnect", _isOnDisconnect] call invoke_java_method;
_name = (name _playerObject);
_playerPos = (getPosASL _playerObject);
_playerDir = (getDir _playerObject);
_playerHeadgear = (headgear _playerObject);
_playerGoggles = goggles _playerObject;

_uniform = (uniform _playerObject);

_uniformCargo = [];
_uniformMagazines = [];
_uniformWeapons = [];

//weaponCargo

if (_uniform == "") then {
	_uniformCargo = _uniformCargo + [];
	_uniformMagazines = _uniformMagazines + [];
	_uniformWeapons = _uniformWeapons + [];
	}else{
	_uniformCargo = _uniformCargo + ( itemCargo (uniformContainer _playerObject) ) ;
	_uniformMagazines = _uniformMagazines + (getMagazineCargo (uniformContainer _playerObject) );
	_uniformWeapons = _uniformWeapons + (weaponsItems (uniformContainer _playerObject) );
};

_vestCargo = [];
_vestMagazines = [];
_vestWeapons = [];

_vest = vest _playerObject;

if ( _vest == "") then {
	_vestCargo = _vestCargo + [];
	_vestMagazines =  _vestMagazines + [];
	_vestWeapons = _vestWeapons + [];
} else {
	_vestCargo = _vestCargo + itemCargo (vestContainer _playerObject);
	_vestMagazines = _vestMagazines + (getMagazineCargo  (vestContainer _playerObject));
	_vestWeapons = _vestWeapons + (weaponsItems (vestContainer _playerObject) );
};

_backpack = backpack _playerObject;

_backpackCargo = [];
_backpackMagazines = [];
_backpackWeapons = [];

//_uniformCargoReply = ["argumentTest", "backpack", _backpack ] call invoke_java_method;

//weapons in backpack
if ( backpack _playerObject == "") then {
	_backpackCargo = _backpackCargo + [];
	_backpackMagazines =  _backpackMagazines + [];
	_backpackWeapons = _backpackWeapons + [];
} else {
	_backpackCargo = _backpackCargo + itemCargo ( backpackContainer _playerObject );
	_backpackMagazines = _backpackMagazines + (getMagazineCargo (backpackContainer _playerObject) );
	_backpackWeapons = _backpackWeapons + (weaponsItems (backpackContainer _playerObject) );
};


_inventory = assignedItems _playerObject;

_weapons = [];
_weapons = _weapons + [primaryWeapon _playerObject];
_weapons = _weapons + [secondaryWeapon _playerObject];
_weapons = _weapons + [handgunWeapon _playerObject];

//_serverReply = ["argumentTest", "Weapons are", _weapons] call invoke_java_method;


_primaryWepAttachments = [];

if (primaryWeapon _playerObject == "" ) then {
	_primaryWepAttachments = _primaryWepAttachments + [];
} else {
	_primaryWepAttachments = _primaryWepAttachments + primaryWeaponItems _playerObject;
};


_secondaryWepAttachments = [];

if (secondaryWeapon _playerObject == "" ) then {
	_secondaryWepAttachments = _secondaryWepAttachments + [];
} else {
	_secondaryWepAttachments = _secondaryWepAttachments + secondaryWeaponItems _playerObject;
};

//_serverReply = ["argumentTest", "second wep attachment", _secondaryWepAttachments] call invoke_java_method;



_handgunAttachments = [];

if (handgunWeapon _playerObject == "" ) then {
	_handgunAttachments = _handgunAttachments + [];
} else {
	_handgunAttachments = _handgunAttachments + handgunItems _playerObject;
};


_weaponMagazines = [];

_weaponMagazines = _weaponMagazines + primaryWeaponMagazine _playerObject;
_weaponMagazines = _weaponMagazines + secondaryWeaponMagazine _playerObject;
_weaponMagazines = _weaponMagazines + handgunMagazine _playerObject;



_inVehicle = (vehicle _playerObject) != _playerObject;
_alive = alive _playerObject;

_selectedWeapon = currentWeapon _playerObject;
_currentStance = animationState _playerObject;
_fatigue = getFatigue _playerObject;

_serverReply = ["storeInfantry", _id, _name, _playerPos, _playerDir, _playerHeadgear, _playerGoggles, _uniform, _uniformCargo, _uniformMagazines, _vest, _vestCargo, _vestMagazines, _backpack, _backpackCargo, _backpackMagazines, _inventory, _weapons, _primaryWepAttachments, _secondaryWepAttachments, _handgunAttachments , _weaponMagazines, _inVehicle, _alive, _selectedWeapon, _currentStance, _fatigue, _uniformWeapons, _vestWeapons, _backpackWeapons] call invoke_java_method;

};
