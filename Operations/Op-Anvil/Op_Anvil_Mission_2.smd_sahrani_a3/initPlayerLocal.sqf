/*--------------------------------------------------------------------
  Author: Unity Security Force
  
  initPlayerLocal.sqf
  Initialization of scripts local to player
  Executed locally when player joins mission (includes both mission start and JIP). Executed after initServer and before initPlayerServer and init.
  
  Arguments: [player:Object, didJIP:Boolean]
--------------------------------------------------------------------*/

// Types a structured text on the screen, letter by letter, cursor blinking.
[ 
  [ 
    ["Unity Security Force", "<t size = '0.7' underline = '1'>%1</t><br/>"],
    ["Mission 2 - Defend Dolores"],
    ["USS Okinawa"],
    ["Sahrani"],
    ["October 01, 2030", "<t size = '0.7' font='puristaMedium'>%1</t>", 70]
  ], 1, 0.75, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
] spawn BIS_fnc_typeText;

// =======================================

// Set respawn height to LHD Hangar Deck
_mrk_respawn_west = "respawn_west";
_mrk_respawn_west setMarkerPosLocal [markerPos _mrk_respawn_west select 0, markerPos _mrk_respawn_west select 1, 11];
