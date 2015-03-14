//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Behaviour  //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_array","_setSkill","_setCombat","_setBehav","_setSpeed","_setForm","_setPatrol","_setSearch",
			"_setFleeing","_setHeliVal","_setPause","_setBldgBeh","_setSupport","_setJoin","_setEmpVeh","_setSupTime","_setHidTime"
		];

switch (_this select 0) do
{
//-------------------------------------------------------------------------------------------------------------------------
	case 0: // CSAT Default
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8]];
		_setCombat  = ["green","white","yellow"];
		_setBehav   = ["careless","safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,600,2];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 1: // NATO Default
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8]];
		_setCombat  = ["green","white","yellow"];
		_setBehav   = ["careless","safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,600,2];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,2];//support for other zones //blufor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 2: // Independent Default
	{
		//_setSkill = ["aimingAccuracy","aimingShake","aimingSpeed","Endurance","spotDistance","spotTime","courage","reloadSpeed","commanding","general"];
		_setSkill   = [[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8],[0.2,0.8]];
		_setCombat  = ["green","white","yellow"];
		_setBehav   = ["careless","safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,2];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,600,1];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [0,1];//no support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 3: // Civilian Default
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.1,0.2];
		_setCombat  = ["green","white","yellow"];
		_setBehav   = ["careless","safe","aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [3,50,120,600,1];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 4:
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.4,0.8];
		_setCombat  = ["yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[1,1],[1,1],[1,1],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,300,2];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 5:
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.4,0.8];
		_setCombat  = ["yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["limited","normal","full"];
		_setForm    = ["line","vee","column","wedge","stag column","ech left","ech right","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[1,1],[1,1],[1,1],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,120,300,2];
		_setPatrol  = ["45 + (20 * (skill _leader))","(60 + (random 60)) + ((skill _leader) * 50)"];
		_setSearch  = ["40 + ((skill _leader) * 150)","50 + ((skill _leader) * 50)"];
		_setSupport = [1,2];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["5 + ((skill _unit) * (5 * DAC_AI_Level))",2,5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 10:  // Knyte - CSAT/Enemy Casual Squads
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.4,0.8];
		_setCombat  = ["green","white"];
		_setBehav   = ["careless","safe"];
		_setSpeed   = ["limited","Normal"];
		_setForm    = ["line","vee","stag column","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[30,300],[60,180],[60,180],[20,300,5,60],[1,30],[1,30]];
		_setBldgBeh = [4,50,300,180,2];
		_setPatrol  = ["50 + (100 * (skill _leader))","(60 + (random 180))"];
		_setSearch  = ["40 + ((skill _leader) * 150)","180 + ((skill _leader) * 120)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["10 + ((skill _unit) * (5 * DAC_AI_Level))",(random 4),5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 11:  // Knyte - CSAT/Enemy Combat Squads
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.4,0.8];
		_setCombat  = ["white","yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["normal","full"];
		_setForm    = ["line","vee","stag column","file","diamond"];
		_setFleeing = [0,50];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[30,300],[60,180],[60,180],[20,300,5,60],[1,30],[1,30]];
		_setBldgBeh = [4,50,300,180,2];
		_setPatrol  = ["50 + (100 * (skill _leader))","(60 + (random 180))"];
		_setSearch  = ["40 + ((skill _leader) * 150)","300 + ((skill _leader) * 120)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 2;
		_setEmpVeh  = [[50,100],[50,100]];
		_setSupTime = ["10 + ((skill _unit) * (5 * DAC_AI_Level))",(random 8),5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 12:  // Knyte - CSAT/Enemy Casual Singles
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.4,0.8];
		_setCombat  = ["green","white"];
		_setBehav   = ["careless","safe"];
		_setSpeed   = ["limited","Normal"];
		_setForm    = ["line","vee","stag column","file","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[30,300],[60,180],[60,180],[20,300,5,60],[1,30],[1,30]];
		_setBldgBeh = [4,50,600,30,1];
		_setPatrol  = ["50 + (100 * (skill _leader))","(60 + (random 180))"];
		_setSearch  = ["40 + ((skill _leader) * 150)","180 + ((skill _leader) * 120)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 0;
		_setEmpVeh  = [[150,100],[150,100]];
		_setSupTime = ["10 + ((skill _unit) * (5 * DAC_AI_Level))",(random 4),5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 13:  // Knyte - CSAT/Enemy Combat Squads
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.4,0.8];
		_setCombat  = ["white","yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["normal","full"];
		_setForm    = ["line","vee","stag column","file","diamond"];
		_setFleeing = [0,50];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[30,300],[60,180],[60,180],[20,300,5,60],[1,30],[1,30]];
		_setBldgBeh = [4,50,300,180,2];
		_setPatrol  = ["50 + (100 * (skill _leader))","(60 + (random 180))"];
		_setSearch  = ["40 + ((skill _leader) * 150)","300 + ((skill _leader) * 120)"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 0;
		_setEmpVeh  = [[50,100],[50,100]];
		_setSupTime = ["10 + ((skill _unit) * (5 * DAC_AI_Level))",(random 8),5];
		_setHidTime = ["(((10 * DAC_AI_Level) + ((skill _leader) * 50)) / ((count units _group) + 1))"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 30: // Knyte - Civilian Casual
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.1,0.2];
		_setCombat  = ["green"];
		_setBehav   = ["careless"];
		_setSpeed   = ["limited","normal"];
		_setForm    = ["line","vee","stag column","diamond"];
		_setFleeing = [0,200];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,600,30,1];
		_setPatrol  = ["50","(60 + (random 120))"];
		_setSearch  = ["100","(60+ (random 120))"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 0;
		_setEmpVeh  = [[20,100],[20,100]];
		_setSupTime = ["0",2,5];
		_setHidTime = ["60+(random 240)"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	case 31: // Knyte - Civilian Active
	{
		//_setSkill = [global min,global max];
		_setSkill   = [0.1,0.2];
		_setCombat  = ["yellow"];
		_setBehav   = ["aware"];
		_setSpeed   = ["normal","full"];
		_setForm    = ["line","vee","stag column","diamond"];
		_setFleeing = [0,20];
		_setHeliVal = [50,100,0.7,1];
		_setPause   = [[5,10],[5,10],[5,10],[20,30,5,5],[1,3],[0,0]];
		_setBldgBeh = [4,50,1800,30,1];
		_setPatrol  = ["50","(60 + (random 120))"];
		_setSearch  = ["100","(60+ (random 120))"];
		_setSupport = [1,1];//support for other zones //opfor arti
		_setJoin    = 0;
		_setEmpVeh  = [[20,100],[20,100]];
		_setSupTime = ["0",2,5];
		_setHidTime = ["60+(random 240)"];
	};
//-------------------------------------------------------------------------------------------------------------------------
	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Behaviour > No valid config number";
				};
				if(true) exitwith {};
			};
};

_array =	[
				_setSkill,_setCombat,_setBehav,_setSpeed,_setForm,_setFleeing,
				_setHeliVal,_setPause,_setBldgBeh,_setPatrol,_setSearch,
				_setSupport,_setJoin,_setEmpVeh,_setSupTime,_setHidTime
			];
_array