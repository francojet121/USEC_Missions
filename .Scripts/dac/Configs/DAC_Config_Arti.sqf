//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Arti       //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_ArtiSide","_ArtiTyp","_array","_ArtiSets","_set0","_set1",
			"_set2","_set3","_set4","_set5","_set6","_set7","_set8","_set9","_set10","_s"
		];

			_ArtiTyp = _this select 0;_array = [];_s = 0;_set10 = 0;
			_set0 = [];_set1 = [];_set2 = [];_set3 = [];_set4 = [];_set5 = [];_set6 = [];_set7 = [];_set8 = [];_set9 = [];


if(_ArtiTyp == 0) exitwith {};

switch (_ArtiTyp) do
{
//-------------------------------------------------------------------------------------------------------------------------
	case 1:
	{		
		_set0  = [20,2,0,60];                       // Conditions Check 1 - [Max Speed Target Group, Min # Units, Min # Vehicles, Min time to next strike]
		_set1  = [2,0.1,10,[],3,30];                // Conditions Check 2 - [Min # Units in Calling Group, Min avg Skill Calling Group, Min distance from caller to target, required unit types in call group, # attempts to call artillery, time between fire requests]
		_set2  = [100,10,50,500,4,1,0];             // Conditions Check 3 - [Overall % Chance of artillery to respond, Min distance Arti to target, Min distance of friendlies to target, Max # Arti strikes, Max # Arti units per call, Max # rounds per unit, Moveable arti (on.off)]
		_set3  = [["O_Mortar_01_F",["M_PG_AT"]]];   // Define Arti Unit   - [["Unit Type",["Ammunition Type"]]
		_set4  = [5,5,1];                           // Request Limits     - [Min Time from request to execution, Max time, skill dependent response times (0/1)]
		_set5  = [10,30,1];                         // Position Variation - [Min variation of position declared by Call-Group, Max, Skill dependent]
		_set6  = [10,30,1];                         // Position Variation - [Min variation of position declared by Arti-Group, Max, Skill dependent]
		_set7  = [0.1,0.5,1];                       // Volley Control     - [Min time between volleys, Max, Skill dependent
		_set8  = [];                                // Names of editor placed units to use as artillery
		_set9  = [];                                // Global conditions to affect artillery, eg: specific units alive, sectors controlled, etc.
		_set10 = 15000;                             // Maximum artillery range
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 2:
	{
		_set0  = [20,2,0,60];
		_set1  = [2,0.1,10,[],3,30];
		_set2  = [100,10,50,500,4,1,0];
		_set3  = [["B_Mortar_01_F",["M_PG_AT"]]];
		_set4  = [5,5,1];
		_set5  = [10,30,1];
		_set6  = [10,30,1];
		_set7  = [0.1,0.5,1];
		_set8  = [];
		_set9  = [];
		_set10 = 15000;
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 3:
	{
		_set0  = [0,0,0,0];
		_set1  = [0,0,0,[],1,5];
		_set2  = [100,0,0,500,4,1,1];
		_set3  = [["B_Mortar_01_F",["M_Mo_82mm_AT_LG"]],["B_MBT_01_arty_F",["R_60mm_HE"]]];
		_set4  = [2,5,0];
		_set5  = [5,10,1];
		_set6  = [5,10,1];
		_set7  = [0.1,1,1];
		_set8  = [];
		_set9  = [];
		_set10 = 1500;
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 10:  // No idea what I'm doing here.  I think the cases tie in with unit configurations.  
	{		
		_set0  = [20,1,0,60];                       // Conditions Check 1 - [Max Speed Target Group, Min # Units, Min # Vehicles, Min time to next strike]
		_set1  = [2,0.1,10,[],3,30];                // Conditions Check 2 - [Min # Units in Calling Group, Min avg Skill Calling Group, Min distance from caller to target, required unit types in call group, # attempts to call artillery, time between fire requests]
		_set2  = [100,10,50,500,4,1,0];             // Conditions Check 3 - [Overall % Chance of artillery to respond, Min distance Arti to target, Min distance of friendlies to target, Max # Arti strikes, Max # Arti units per call, Max # rounds per unit, Moveable arti (on.off)]
		_set3  = [["O_Mortar_01_F",["M_PG_AT"]]];   // Define Arti Unit   - [["Unit Type",["Ammunition Type"]]
		_set4  = [5,5,0];                           // Request Limits     - [Min Time from request to execution, Max time, skill dependent response times (0/1)]
		_set5  = [10,30,0];                         // Position Variation - [Min variation of position declared by Call-Group, Max, Skill dependent]
		_set6  = [10,30,0];                         // Position Variation - [Min variation of position declared by Arti-Group, Max, Skill dependent]
		_set7  = [0.1,0.5,0];                       // Volley Control     - [Min time between volleys, Max, Skill dependent
		_set8  = [];                                // Names of editor placed units to use as artillery
		_set9  = [];                                // Global conditions to affect artillery, eg: specific units alive, sectors controlled, etc.
		_set10 = 15000;                             // Maximum artillery range
	};  

//-------------------------------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Camps > No valid config number";
				};
				if(true) exitwith {};
			};
};

_array = [_set0,_set1,_set2,_set3,_set4,_set5,_set6,_set7,_set8,_set9,_set10];
_array