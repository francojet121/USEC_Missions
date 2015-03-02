"openGarage" addPublicVariableEventHandler {

	_args = (_this select 1);
  
  LHA_garage = _args select 0;
  LHA_GarageActivityLog = _args select 1;
  
  //Garage has been retrieved from the server, open the dialog  
  USEC_DebarkationControl = createDialog "USEC_DebarkationControl";
  
  hint "";
};