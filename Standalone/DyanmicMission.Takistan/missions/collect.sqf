_object = (_this select 3) select 0;
_item = typeOf(_object);

//Check if space
_slotsFree = [player] call BIS_fnc_invSlotsEmpty;
_slotsReq = [_item] call BIS_fnc_invSlotType;
_hasSpace = true;
_avail = 0;
_val = 0;
{
	_avail = _slotsFree select _val;
	if (_avail < _x) then {_hasSpace = false};
	_val = _val + 1;
} forEach _slotsReq;

//Add to inventory
if (_hasSpace) then {
	player addWeapon _item;
	_object hideObject true;
} else {
	TitleText["You do not have enough space","PLAIN DOWN",3];
};