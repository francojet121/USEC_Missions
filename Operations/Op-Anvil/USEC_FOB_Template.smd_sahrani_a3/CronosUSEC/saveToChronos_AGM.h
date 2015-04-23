/**
class All;
class AllVehicles: All {
  class AGM_Actions {
    class USEC_Chronos_SaveToChronos {
      displayName = "Save to Chronos";
      condition = "(alive _target) && {!isEngineOn _target} && {locked _target <= 1} && {count (crew _target) == 0} && {(_target getVariable ['vehicleChronosID','None']) == 'None'}";
      statement = "[2, [_target], 'Chronos_fnc_saveToChronos', 'Saving Vehicle to Chronos ...'] call AGM_Core_fnc_progressBar; [_target] call AGM_Core_fnc_closeDialogIfTargetMoves";
      showDisabled = 0;
      priority = -6.0;
      icon = "usec_resources\images\Chronos\saveToChronos_AGM.paa";
    };
  };
};
**/