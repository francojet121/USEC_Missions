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
  ["Annotated AO", "Images\KnAO.paa"],  
  ["Annotated Objective", "Images\ObjAnno.paa"], 
  ["Callsigns", "Images\Callsigns.paa"],
  ["Radio Channels", "Images\comms.paa"],
  ["Codewords 1", "Images\CWp1.paa"],
  ["Codewords 2", "Images\CWp2.paa"]   
  // Last action has to be without a comma, all others must have it
];

// ============================== EDIT STOPS HERE


// DO NOT EDIT!
[whiteboard_equipmentUX501, whiteboard_equipmentUX501, _defaultTexture, _actions] call USEC_Misc_fnc_whiteboardController;
