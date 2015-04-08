/*--------------------------------------------------------------------
  Author: Unity Security Force
  
  initPlayerLocal.sqf
  Initialization of scripts local to player for USEC Training Mission
  Executed locally when player joins mission (includes both mission start and JIP). Executed after initServer and before initPlayerServer and init.
  
  Arguments: [player:Object, didJIP:Boolean]
--------------------------------------------------------------------*/

// Types a structured text on the screen, letter by letter, cursor blinking.
[ 
  [ 
    ["Unity Security Force", "<t size = '0.7' underline = '1'>%1</t><br/>"],
    ["Training Mission"],
    ["Camp Gravia"],
    ["Sahrani"],
    ["October 12, 2030", "<t size = '0.7' font='puristaMedium'>%1</t>", 70]
  ], 1, 0.75, "<t align = 'center' shadow = '1' size = '1.0'>%1</t>"
] spawn BIS_fnc_typeText;

// =======================================
// Teleport Add Actions - [target,offset,isTargetMobile]  List Priority, Show Window, Hide on Use, Keybind, Conditions

  // Teleports FROM Base                                        
teleporterBase addAction [("<t color=""#0074E8"">" + ("Teleport - LHD") +"</t>"),"USEC\teleport.sqf", [teleporterLHD,[2,2,0],0],    5,false,true,"","((player distance teleporterBase) < 8)"];
teleporterBase addAction [("<t color=""#0074E8"">" + ("Teleport - MHQ 1") +"</t>"),"USEC\teleport.sqf", [mhq1,[-7,-7,0],1],       5,false,true,"","(alive mhq1) && ((player distance teleporterBase) < 8)"];
teleporterBase addAction [("<t color=""#0074E8"">" + ("Teleport - MHQ 2") +"</t>"),"USEC\teleport.sqf", [mhq2,[-7,-7,0],1],       5,false,true,"","(alive mhq2) && ((player distance teleporterBase) < 8)"];

  // Teleports FROM LHD
teleporterLHD addAction [("<t color=""#0074E8"">" + ("Teleport - Base") +"</t>"),"USEC\teleport.sqf", [teleporterBase,[2,2,0],0],   5,false,true,"","((player distance teleporterLHD) < 8)"];
teleporterLHD addAction [("<t color=""#0074E8"">" + ("Teleport - MHQ 1") +"</t>"),"USEC\teleport.sqf",  [mhq1,[-7,-7,0],1],       5,false,true,"","(alive mhq1) && ((player distance teleporterLHD) < 8)"];
teleporterLHD addAction [("<t color=""#0074E8"">" + ("Teleport - MHQ 2") +"</t>"),"USEC\teleport.sqf",  [mhq2,[-7,-7,0],1],       5,false,true,"","(alive mhq2) && ((player distance teleporterLHD) < 8)"];

  // Teleports FROM MHQ1
mhq1 addAction [("<t color=""#0074E8"">" + ("Teleport - Base") +"</t>"),"USEC\teleport.sqf",      [teleporterBase,[2,2,0],0],   5,false,true,"","(alive mhq1) && ((player distance mhq1) < 8)"];
mhq1 addAction [("<t color=""#0074E8"">" + ("Teleport - LHD") +"</t>"),"USEC\teleport.sqf",       [teleporterLHD,[2,2,0],0],    5,false,true,"","(alive mhq1) && ((player distance mhq1) < 8)"];
mhq1 addAction [("<t color=""#0074E8"">" + ("Teleport - MHQ 2") +"</t>"),"USEC\teleport.sqf",     [mhq2,[-7,-7,0],1],       5,false,true,"","(alive mhq1) && (alive mhq2) && ((player distance mhq1) < 8)"];

  // Teleports FROM MHQ2
mhq2 addAction [("<t color=""#0074E8"">" + ("Teleport - Base") +"</t>"),"USEC\teleport.sqf",      [teleporterBase,[2,2,0],0],   5,false,true,"","(alive mhq2) && ((player distance mhq2) < 8)"];
mhq2 addAction [("<t color=""#0074E8"">" + ("Teleport - LHD") +"</t>"),"USEC\teleport.sqf",       [teleporterLHD,[2,2,0],1],    5,false,true,"","(alive mhq2) && ((player distance mhq2) < 8)"];
mhq2 addAction [("<t color=""#0074E8"">" + ("Teleport - MHQ 1") +"</t>"),"USEC\teleport.sqf",     [mhq1,[-7,-7,0],1],       5,false,true,"","(alive mhq2) && (alive mhq1) && ((player distance mhq2) < 8)"];

