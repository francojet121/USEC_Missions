/*--------------------------------------------------------------------
  Author: Jonpas
  Version: 1.0.0

  headlessClientInit.sqf
  Checks if Headless Client is connected (or more of them) and executes initialization on it, otherwise falls back to execution on Server

  Call from init.sqf with:
    _headlessClientInit1 = {
      // Put script initializations for Headless Client 1 here
      diag_log "Headless Script Initting on 1!";
    };
    _headlessClientInit2 = {
      // Put script initializations for Headless Client 2 here
      diag_log "Headless Script Initting on 2!";
    };
    _headlessClientInit3 = {
      // Put script initializations for Headless Client 3 here
      diag_log "Headless Script Initting on 3!";
    };
    #include "USEC\headlessClientInit.sqf"
--------------------------------------------------------------------*/

// If variable is not defined yet, define it (to prevent JIP rewriting it)
if (isNil "USEC_headlessClients") then {USEC_headlessClients = []};

// Execute on Server in Multiplayer only
if (isMultiplayer && {isServer}) then {
  // Headless Clients names
  USEC_headlessClients = ["headlessClient1", "headlessClient2", "headlessClient3"];

  // Remove names of empty Headless Client slots
  {
   if (isNil _x) then {
    USEC_headlessClients = USEC_headlessClients - [_x];
   };
  } forEach USEC_headlessClients;

  // Broadcast Headless Client names
  publicVariable "USEC_headlessClients";
};

// Execute in Multiplayer only and only if at least one Headless Client is present
if (isMultiplayer && {count USEC_headlessClients > 0}) then {
  // Execute on Headless Client
  if (!hasInterface && {!isServer}) then {
    _countHeadlessClients = count USEC_headlessClients;
    _headlessClient1 = USEC_headlessClients select 0;
    _headlessClient2 = "";
    _headlessClient3 = "";
    if (_countHeadlessClients == 3) then {
      _headlessClient2 = USEC_headlessClients select 1;
      _headlessClient3 = USEC_headlessClients select 2;
    };
    if (_countHeadlessClients == 2) then {
      _headlessClient2 = USEC_headlessClients select 1;
    };

    if (_countHeadlessClients > 1) then {
      // Execute all on their own Headless Client (NO fall-back)
      if (_countHeadlessClients == 3) then {
        if (local (missionNamespace getVariable [_headlessClient1, objNull])) then {
          call _headlessClientInit1;
        };
        if (local (missionNamespace getVariable [_headlessClient2, objNull])) then {
          call _headlessClientInit2;
        };
        if (local (missionNamespace getVariable [_headlessClient3, objNull])) then {
          call _headlessClientInit3;
        };
      // Fall-back to Headless Client 1 or 2 when 3 is NOT present
      } else {
        if (local (missionNamespace getVariable [_headlessClient1, objNull])) then {
          call _headlessClientInit1;
        };
        if (local (missionNamespace getVariable [_headlessClient2, objNull])) then {
          call _headlessClientInit2;
          call _headlessClientInit3;
        };
      };
    // Fall-back to Headless Client 1 when 2 and 3 are NOT present
    } else {
      if (local (missionNamespace getVariable [_headlessClient1, objNull])) then {
        call _headlessClientInit1;
        call _headlessClientInit2;
        call _headlessClientInit3; 
      };
    };
  };
// Execute on Server if NO Headless Clients present
} else {
  if (isServer) then {
    call _headlessClientInit1;
    call _headlessClientInit2;
    call _headlessClientInit3;
  };
};
