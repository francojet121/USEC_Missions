/*
    File: policeOffroad.sqf
    Author: Adapted from code by pettka

    Description:
    Sets proxies for the car to police, adds actions for sirens.

    Parameter(s):
    None

    Returns:
    Nothing
*/

if (isServer) then {
    _this animate ["HidePolice", 0];
    _this animate ["HideServices", 1];
    _this animate ["HideBackpacks", 1];
    _this animate ["HideBumper1", 1];
    _this animate ["HideBumper2", 0];
    _this animate ["HideConstruction", 0];
};

_this setObjectTexture [0, "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa"];

_this setObjectTexture [1, "\A3\soft_F\Offroad_01\Data\Offroad_01_ext_BASE02_CO.paa"];

_this addAction ["Beacons On",{(_this select 0) animate ["BeaconsStart",1]},[],50,false,true,"","_target animationPhase 'BeaconsStart' < 0.5 AND Alive(_target) AND driver _target == _this"];
_this addAction ["Beacons Off",{(_this select 0) animate ["BeaconsStart",0]},[],51,false,true,"","_target animationPhase 'BeaconsStart' > 0.5 AND Alive(_target) AND driver _target == _this"];  
