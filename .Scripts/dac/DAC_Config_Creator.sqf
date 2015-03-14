//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Creator    //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

//////////////////////////////////////////////////////////
// Modified by Monsoon to be headless client compatible //
//////////////////////////////////////////////////////////

isHC = if(!isServer && !hasInterface) then{ True } else{ False };

_scr = [] spawn (compile preprocessFile "DAC\Scripts\DAC_Preprocess.sqf");
waituntil {scriptdone _scr};

scalar = "any";DAC_Init_Camps = 0;

waituntil{time > 0.3};

if(isServer || isHC) then {if(local player) then {DAC_Code = 1} else {DAC_Code = 0}} else {if(isnull player) then {DAC_Code = 3} else {DAC_Code = 2}};

//===============|
// DAC_Settings	 |
//===============|=============================================================================================|

// Playable units must be named here and in the editor to affect DAC
  if(isNil "DAC_STRPlayers") then {
    DAC_STRPlayers = []; // need to define it in this scope first
    {DAC_STRPlayers pushBack str(_x)} forEach playableUnits;  // This works multiplayer only...
  };
DAC_STRPlayers = ["ucom_tacom"]; // delete this shit before releasing
// Squad size ranges [Min#,Max#] of units in squad
	if(isNil "DAC_AI_Count_Level")	then {		DAC_AI_Count_Level  = [[1,3],[2,6],[4,8],[6,12],[1,1]]    };
// Single player only dynamic weather.
	if(isNil "DAC_Dyn_Weather") 	  then {		DAC_Dyn_Weather		  = [0,0,0,[0, 0, 0],0]                 };
// Ranges at which to grow and reduce squads [Build Up Distance,Reduce Distance,Time between spawning units]
	if(isNil "DAC_Reduce_Value") 	  then {		DAC_Reduce_Value  	= [1200,1300,0.3]                       };
// Delay times for AI respawn [[inf seconds, +random, +idle],[veh seconds, +random, +idle],0/1 (global/local),min pc dist from camp,0/1 (last stay at or leave camp)
	if(isNil "DAC_AI_Spawn") 		    then {		DAC_AI_Spawn	    	= [[10,5,5],[10,5,15],0,120,250,0]    };
// Time to remove dead and wrecks. [[inf time,dist],[veh time, dist],[destroy empty vehc after]]
	if(isNil "DAC_Delete_Value") 	  then {		DAC_Delete_Value    = [[180,150],[180,150],6000]          };
// Removes player bodies [time,dist]
	if(isNil "DAC_Del_PlayerBody") 	then {		DAC_Del_PlayerBody	= [0,0]                               };
// DAC dev help.  System Messages, Initialization Hints, Radio Updates, Monitor [0/1,0/1/2,0/1/2/3,0/1/"Name"]
	if(isNil "DAC_Com_Values") 		  then {		DAC_Com_Values		  = [1,2,3,1]                           };
// Selects which AI script folder to use.  eg: Allows use of AI_2 folder for testing new settings
	if(isNil "DAC_AI_AddOn") 		    then {		DAC_AI_AddOn		    = 2                                   };
// AI skill.  1/2/3/4 (easy->hard)
	if(isNil "DAC_AI_Level") 		    then {		DAC_AI_Level		    = 4                                   };
// Resistance friendly to? 0/1/2 East/West/Nobody
	if(isNil "DAC_Res_Side") 		    then {		DAC_Res_Side		    = 0                                   };
// DAC dev help. Uses configurations located in DAC_Config_Marker
	if(isNil "DAC_Marker") 			    then {		DAC_Marker			    = 2									              		};
// Delay between generating waypoints.  Use 0 to force game to stop while DAC generates
	if(isNil "DAC_WP_Speed") 		    then {		DAC_WP_Speed		    = 0.01							            			};
// Unused command
	if(isNil "DAC_Join_Action")		  then {		DAC_Join_Action		  = false							              		};
// Single Player Only.  Improves DAC startup time.
	if(isNil "DAC_Fast_Init") 		  then {		DAC_Fast_Init		    = false										            };
// Creates marker for each player on the map
	if(isNil "DAC_Player_Marker") 	then {		DAC_Player_Marker 	= false										            };
// False=At least 1 DAC zone at beginning, True=DAC zones at start not required
	if(isNil "DAC_Direct_Start")	  then {		DAC_Direct_Start	  = false										            };
// DAC testing sounds
	if(isNil "DAC_Activate_Sound")	then {		DAC_Activate_Sound	= false										            };
// Dynamic squad adjustment.  [#players designed for,% chance for each player above or below design].  Place <# of units to spawn> in dac_zone call in quotes to activate adjustment ["z1",[1,0,0],["18",.....]
  if(isNil "DAC_Auto_UnitCount")	then {		DAC_Auto_UnitCount	= [8,10]									            };
//  DAC_Support options for player
	if(isNil "DAC_Player_Support")	then {		DAC_Player_Support	= [10,[4,2000,3,1000]]				    		};
//  Array of [Radius,"Obj Name"] creating dac-free zones.  DAC will not spawn in these zones.
	if(isNil "DAC_SaveDistance")	  then {		DAC_SaveDistance	  = [500,["DAC_Save_Pos"]]			    		};
// Adjusts the number of radios available in a group?
	if(isNil "DAC_Radio_Max")	    	then {		DAC_Radio_Max		    = DAC_AI_Level							        	};
 
// Buildings AI is not allowed in
	DAC_BadBuildings 	= 	[];
// Types of static weapons AI may not use
	DAC_GunNotAllowed	= 	[];
// Types of vehicles AI may not use
	DAC_VehNotAllowed	= 	[];
// Specific named vehicles AI may not use.  eg: Can still drive civilian SUV, but not "playerCar1".
	DAC_Locked_Veh		=	[];
// Soldier types available for suppression fire
	DAC_SP_Soldiers   =   ["B_soldier_AR_F","B_G_soldier_AR_F","O_soldier_AR_F","O_soldierU_AR_F","O_G_soldier_AR_F","I_soldier_AR_F","I_G_soldier_AR_F"];
	DAC_Data_Array 		= 	[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,[]];
	DAC_Marker_Val		= 	[];
	DAC_Zones			    =	  [];

	//=============================================================================================================|
	
	_scr = [] spawn (compile preprocessFile "DAC\Scripts\DAC_Start_Creator.sqf");
	waituntil {scriptdone _scr};
	sleep 0.1;
	waituntil {(DAC_Basic_Value > 0)};
	
if(DAC_Code < 2) then
{
	//===========================================|
	// StartScriptOnServer                       |
	//===========================================|
	//player sidechat "ServerStart"
	//[] execVM "myServerScript.sqf";
	//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
}
else
{
	if(DAC_Code == 3) then
	{
		//===========================================|
		// StartScriptOnJipClient                    |
		//===========================================|
		//player sidechat "JipClientStart"
		//[] execVM "myJipClientScript.sqf";
	}
	else
	{
		//===========================================|
		// StartScriptOnClient                       |
		//===========================================|
		//player sidechat "ClientStart"
		//[] execVM "myClientScript.sqf";
		//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
	};
};