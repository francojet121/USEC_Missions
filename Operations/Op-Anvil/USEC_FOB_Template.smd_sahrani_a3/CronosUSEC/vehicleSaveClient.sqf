"getVehicleObject" addPublicVariableEventHandler {
	private ["_vehNum", "_vehicle", "_vehName"];
	_vehNum = (_this select 1);
  
  _vehicle = (vehicles select _vehNum);
  _vehName = vehicleVarName _vehicle;
  
  vehObj = [_vehicle, _vehName, _vehNum];
  
	publicVariableServer "vehObj";
};