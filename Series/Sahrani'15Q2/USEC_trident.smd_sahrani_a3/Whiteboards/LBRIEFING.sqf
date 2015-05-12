/*
 * Specific whiteboard configuration.
 */

// DO NO EDIT!
private ["_defaultTexture", "_actions"];


// ============================== EDIT STARTS HERE

// This image will be set as the default image on the object
_defaultTexture = "Images\Title.paa";

// These are all the actions which will be added in the order written here
// Format is "Text Message, "imageURL"
_actions = [
  ["Title", "Images\Title.paa"], 
  ["Overview", "Images\Overview.paa"],
  ["Pacamac", "Images\Pacamac.paa"],
  ["Tandag", "Images\Tandag.paa"],  
  ["Tlaloc", "Images\Tlaloc.paa"]
  // Last action has to be without a comma, all others must have it
];

// ============================== EDIT STOPS HERE


// DO NOT EDIT!
[whiteboard_interactiveUX501_landFOB, whiteboard_interactiveUX501_landFOB, _defaultTexture, _actions] call USEC_Misc_fnc_whiteboardController;
[whiteboard_interactiveUCOM_landFOB, whiteboard_interactiveUCOM_landFOB, _defaultTexture, _actions] call USEC_Misc_fnc_whiteboardController;