private ["_groupList"];

_groupList = [];

//Fireteam
_groupList pushBack [
	[_teamLeader, "CORPORAL"],
	[_mg, "PRIVATE"],
	[_marksman, "PRIVATE"],
	[_riflemanAT, "PRIVATE"]
];

//Engineer Team
_groupList pushBack [
	[_teamLeader, "CORPORAL"],
	[_engineer, "PRIVATE"],
	[_engineer, "PRIVATE"],
	[_rifleman, "PRIVATE"]
];

//Explosives Team
_groupList pushBack [
	[_teamLeader, "CORPORAL"],
	[_exSpecialist, "PRIVATE"],
	[_rifleman, "PRIVATE"],
	[_rifleman, "PRIVATE"]
];

//Indirect Fire Team
_groupList pushBack [
	[_teamLeader, "CORPORAL"],
	[_grenadier, "PRIVATE"],
	[_grenadier, "PRIVATE"],
	[_rifleman, "PRIVATE"]
];

//Platoon HQ
_groupList pushBack [
	[_squadLeader, "LIEUTENANT"],
	[_teamLeader, "SERGEANT"],
	[_medic, "CORPORAL"]
];

//Command Team
_groupList pushBack [
	[_officer, "CAPTAIN"],
	[_officer, "LIEUTENANT"],
	[_rifleman, "CORPORAL"]
];

//Sniper Team
_groupList pushBack [
	[_sniper, "SERGEANT"],
	[_spotter, "CORPORAL"]
];



//Playercount 5+
if (count (call CBA_fnc_players) >= 5) then {
	//Rifle Squad
	_groupList pushBack [
		[_squadLeader, "SERGEANT"],
		[_teamLeader, "CORPORAL"],
		[_rifleman, "PRIVATE"],
		[_rifleman, "PRIVATE"],
		[_medic, "PRIVATE"],
		[_mg, "PRIVATE"],
		[_marksman, "PRIVATE"],
		[_riflemanAT, "PRIVATE"]
	];
	
	//Machine gun Squad
	 _groupList pushBack [
		[_squadLeader, "SERGEANT"],
		[_teamLeader, "CORPORAL"],
		[_rifleman, "PRIVATE"],
		[_mg, "PRIVATE"],
		[_medic, "PRIVATE"],
		[_mg, "PRIVATE"],
		[_marksman, "PRIVATE"],
		[_riflemanAT, "PRIVATE"]
	];
};

_groupProto = (_groupList call BIS_fnc_selectRandom);