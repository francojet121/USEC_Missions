_object = [_this, 0, this] call BIS_fnc_param;
_area = [_this, 1, "All"] call BIS_fnc_param;

if (_area == "501" || _area == "All") then {
  _object addAction ["<t color='#ff1111'>Load USEC Rifleman</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_501_rifleman-mg.sqf"
    _loadoutArray = _usec_501_rifle;
    
    call JNS_InvSys_fnc_loadPreDefined;
  }];
    
  _object addAction ["<t color='#ff1111'>Load USEC Squad Leader</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_501_squadLeader-teamLeader.sqf"
    _loadoutArray = _usec_501_sqdLdr;

    call JNS_InvSys_fnc_loadPreDefined;
  }];

  _object addAction ["<t color='#ff1111'>Load USEC Team Leader</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_501_squadLeader-teamLeader.sqf"
    _loadoutArray = _usec_501_teamLdr;

    call JNS_InvSys_fnc_loadPreDefined;
  }];

  _object addAction ["<t color='#ff1111'>Load USEC Machine Gunner</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_501_rifleman-mg.sqf"
    _loadoutArray = _usec_501_mg;

    call JNS_InvSys_fnc_loadPreDefined;
  }];

  _object addAction ["<t color='#ff1111'>Load USEC Anti-Tank</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_501_aa-at.sqf"
    _loadoutArray = _usec_501_at;

    call JNS_InvSys_fnc_loadPreDefined;
  }];

  _object addAction ["<t color='#ff1111'>Load USEC Anti-Air</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_501_aa-at.sqf"
    _loadoutArray = _usec_501_aa;

    call JNS_InvSys_fnc_loadPreDefined;
  }];

  _object addAction ["<t color='#ff1111'>Load USEC Squad Medic</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_501_medic.sqf"
    _loadoutArray = _usec_501_medic;

    call JNS_InvSys_fnc_loadPreDefined;
  }];

  _object addAction ["<t color='#ff1111'>Load USEC Platoon Medic</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_501_medic.sqf"
    _loadoutArray = _usec_501_medicPlt;

    call JNS_InvSys_fnc_loadPreDefined;
  }];
};

if (_area == "152" || _area == "All") then {    
  _object addAction ["<t color='#ff1111'>Load USEC Pilot</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_152_pilot.sqf"
    _loadoutArray = _usec_152_pilot;

    call JNS_InvSys_fnc_loadPreDefined;
  }];
    
  _object addAction ["<t color='#ff1111'>Load USEC Pilot (Medical)</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_152_pilot.sqf"
    _loadoutArray = _usec_152_pilotMed;

    call JNS_InvSys_fnc_loadPreDefined;
  }];

  _object addAction ["<t color='#ff1111'>Load USEC Pilot (Repair)</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_152_pilot.sqf"
    _loadoutArray = _usec_152_pilotRep;

    call JNS_InvSys_fnc_loadPreDefined;
  }];
  
  _object addAction ["<t color='#ff1111'>Load USEC Pilot (Fixed-Wing)</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_152_pilot.sqf"
    _loadoutArray = _usec_152_pilotFixed;

    call JNS_InvSys_fnc_loadPreDefined;
  }];
};

if (_area == "411" || _area == "All") then {
  _object addAction ["<t color='#ff1111'>Load USEC Crewman</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_411_crewman.sqf"
    _loadoutArray = _usec_411_crew;

    call JNS_InvSys_fnc_loadPreDefined;
  }];
    
  _object addAction ["<t color='#ff1111'>Load USEC Crewman (Medical)</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_411_crewman.sqf"
    _loadoutArray = _usec_411_crewMed;

    call JNS_InvSys_fnc_loadPreDefined;
  }];

  _object addAction ["<t color='#ff1111'>Load USEC Crewman (Repair)</t>", {
    #include "loadouts\prepare.sqf"
    
    #include "loadouts\usec_411_crewman.sqf"
    _loadoutArray = _usec_411_crewRep;

    call JNS_InvSys_fnc_loadPreDefined;
  }];
};
