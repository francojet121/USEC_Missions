

//Handle Corpse removal

addMissionEventHandler ["HandleDisconnect", { 
 // private ["_unit", "_pos", "_wholder"];
  
  if (isDedicated) then {
    _unitObj = (_this select 0);
    _id = (_this select 2);
  
    [_unitObj, _id] call playerSaveModule;
  };
      
    
  
  
    _unit  = _this select 0;
    
    _pos = getPosATL _unit;
    
    _wholder = nearestObjects [_pos, ["weaponHolderSimulated", "weaponHolder"], 2];
    
    {
        deleteVehicle _x;
    }forEach _wholder + [_unit];
    
    false

}];  

if (!isDedicated) exitWith {};
//if (isDedicated) then {

["onPlayerDiscnndId", "onPlayerDisconnected", {
        
   private ["_body","_weaponholders"];
   
   _body = missionNamespace getVariable _uid;
   
   if (!isNull _body) then 
   {
        _weaponholders = [];
       
        _weaponholders = nearestObjects [getPosATL _body, ["weaponHolderSimulated", "weaponHolder"], 20];
        
        {
            deleteVehicle _x;
        }forEach _weaponholders;

        deleteVehicle _body;
        
        missionNamespace setVariable [_uid,nil];
   };

}] call BIS_fnc_addStackedEventHandler;  
//};
