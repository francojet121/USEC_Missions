/*
 * Specific whiteboard configuration.
 */

// DO NO EDIT!
private ["_defaultTexture", "_actions"];


// ============================== EDIT STARTS HERE

// This image will be set as the default image on the object
_defaultTexture = "Images\default.paa";

// These are all the actions which will be added in the order written here
// Format is "Text Message, "imageURL"
_actions = [
  ["Clear Board", "Images\default.paa"], 
  ["Objectives", "Images\objectives.paa"],
  ["Target photos", "Images\vehicles.paa"],
  ["L1", "Images\L1_1.paa"],  
  ["L2 step 1", "Images\L2_1.paa"], 
  ["L2 step 2", "Images\L2_2.paa"],
  ["Waldo", "Images\waldo.paa"]   
  // Last action has to be without a comma, all others must have it
];

// ============================== EDIT STOPS HERE


// DO NOT EDIT!
[whiteboard_equipmentUX501, whiteboard_equipmentUX501, _defaultTexture, _actions] call USEC_Misc_fnc_whiteboardController;
