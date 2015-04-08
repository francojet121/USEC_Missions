	if ((count USEC_MissionPublisher) < 1) exitWith {};
	_mission = _this select 0;
	_number = _this select 1;
	_tracker = _this select 2;
	
	_missions = [
		"",
		"Snatch and Grab",
		"Extreme Prejudice",
		"Treasure Hunt",
		"Black Hawk Down",
		"Infiltration",
		"King of the Hill",
		"Direct Action"
	];
	
	if (!(_number in CurrentMissions)) then {

		_doMission = true;
		_missName = (_missions select _mission);
		_first = ["MISSION",_missName] spawn BIS_fnc_infoText;
		waitUntil{scriptDone _first};
		sleep 1;
		CurrentMissions = CurrentMissions + [_number];
		
		disableSerialization;
		USEC_MissionTask_Dialog = createDialog "USEC_MissionTask";
		
		//Initialize Display Variables
		USEC_MissionPublisher = [];
		_display = (findDisplay 10010);
		_TextTitle = (_display displayCtrl 1100);
		_TextPicture = (_display displayCtrl 1201);
		_TextPicture2 = (_display displayCtrl 1202);
		

		switch (_mission) do {
			case 1: {
				_TextTitle ctrlSetText "Dear Sir\n\n   Enclosed is a request for a capture of a local rebel leader. The target is going to be travelling along in a convoy of three vehicles with his own guards. He will be very difficult to take down, you will need to disable his vehicles and take out his guards and scare him to the point that he surrenders.\n\n   Care will need to be taken to not kill the target as he is extremely important to our efforts. Please advise local forces once he is aprehended.";
				_TextPicture ctrlSetText format["\usec_lha\ui\targets\%1_CA.paa",(TypeOf _tracker)];
				
				_task = player createSimpleTask[_missName];
				_task setSimpleTaskDescription["A Rebel leader is travelling in a convoy. You must intercept him and capture him. He will do whatever he can to get away, so be careful", "Capture Rebel Leader", "Capture"];
				_task setSimpleTaskDestination (position _tracker);
				
				["MIS001",0,_missName] call fnc_usec_recordEventClient;
				
				waitUntil{!dialog};
				
				[_task] call mk_fTaskHint;
				
				private ["_task2"];
				
				while {_doMission} do {
					_status = _tracker getVariable["status",0];
					_task setSimpleTaskDestination (position _tracker);
					if (_status != 0) then {
						switch (_status) do {
							case 1: {
								//Failed: He got away
								//hint "failed: got away";
								_task settaskstate "FAILED";
								["MIS002",0,"Rebel Leader escaped"] call fnc_usec_recordEventClient;
								[_task] call mk_fTaskHint;
								_strTime = call fnc_usec_getTimeStr;
								_first = ["Hostage Escaped",_strTime] spawn BIS_fnc_infoText;
								_doMission = false;
							};
							case 2: {
								//Failed: He was killed
								//hint "failed: killed";
								_task settaskstate "FAILED";
								["MIS002",0,"Rebel Leader was Killed"] call fnc_usec_recordEventClient;
								[_task] call mk_fTaskHint;
								_strTime = call fnc_usec_getTimeStr;
								_first = ["Hostage Killed",_strTime] spawn BIS_fnc_infoText;
								_doMission = false;
							};
							case 3: {
								//Win: He was captured
								_tracker switchMove "TestSurrender";
								//hint "captured";
								_task settaskstate "SUCCEEDED";
								["MIS003",0,"Rebel leader was Captured"] call fnc_usec_recordEventClient;
								[_task] call mk_fTaskHint;					
								_strTime = call fnc_usec_getTimeStr;
								_first = ["Rebal Leader Has Surrendered",_strTime] spawn BIS_fnc_infoText;
								_doMission = false;
							};
							default {};
						};
					};
					sleep 1;
				};
				if ((_tracker getVariable["status",0]) == 3) then {
					sleep 3;
					_task2 = player createSimpleTask["Secure Hostage for transport"];
					_task2 setSimpleTaskDescription["Secure the hostage until other forces arrive to collect him for processing.", "Secure Hostage", "Secure"];
					_task2 setSimpleTaskDestination (position _tracker);
					[_task2] call mk_fTaskHint;		
					waitUntil{((_tracker getVariable["status",0]) == 4)};
					_task2 settaskstate "SUCCEEDED";
					[_task2] call mk_fTaskHint;
					_strTime = call fnc_usec_getTimeStr;
					_first = ["Hostage Secured",_strTime] spawn BIS_fnc_infoText;
				};
				//Mission over so Cleanup
				sleep 10;
				{player removeSimpleTask _x} forEach [_task,_task2];
			};
			case 2: {
				_TextTitle ctrlSetText "Dear Sir\n\n   Enclosed is a request for the disposal of a local rebel leader. The target is going to be travelling along in a convoy of three vehicles with his own guards. He may be travelling by air or by ground vehicles.\n\nFind the rebel leader and dispose of him\n\nWe only know the location he is leaving from, so you will need to search from that location to find him as quick as you can.";
				_TextPicture ctrlSetText format["\usec_lha\ui\targets\%1_CA.paa",(TypeOf _tracker)];
				
				_task = player createSimpleTask["Kill Rebel Leader"];
				_task setSimpleTaskDescription["A Rebel leader is travelling in a convoy. You must intercept him and kill him. He will do whatever he can to get away, so be careful", "Kill Rebel Leader", "Kill"];
				_task setSimpleTaskDestination (position _tracker);
				
				["MIS001",0,"Kill Rebel Leader"] call fnc_usec_recordEventClient;
				
				waitUntil{!dialog};
				
				[_task] call mk_fTaskHint;
				while {_doMission} do {
					_status = _tracker getVariable["status",0];
					//_task setSimpleTaskDestination (position _tracker);
					if (_status != 0) then {
						switch (_status) do {
							case 1: {
								//Failed: He got away
								//hint "failed: got away";
								_task settaskstate "FAILED";
								["MIS002",0,"Rebel Leader escaped"] call fnc_usec_recordEventClient;
								[_task] call mk_fTaskHint;
								_strTime = call fnc_usec_getTimeStr;
								_first = ["Target Escaped",_strTime] spawn BIS_fnc_infoText;
								_doMission = false;
							};
							case 2: {
								//Win: He was captured
								//hint "killed";
								_task settaskstate "SUCCEEDED";
								["MIS003",0,"Rebel Leader Killed"] call fnc_usec_recordEventClient;
								[_task] call mk_fTaskHint;
								_strTime = call fnc_usec_getTimeStr;
								_first = ["Target Killed",_strTime] spawn BIS_fnc_infoText;
								_doMission = false;
							};
							default {};
						};
					};
					sleep 1;
				};
				sleep 10;
				{player removeSimpleTask _x} forEach [_task];
			};
			case 3: {
				_town = _tracker;
				_caches = _this select 3;
				_type = typeOf (_caches select 0);
				_name = getText (configfile >> "CfgVehicles" >> _type >> "displayName");
				
				_TextTitle ctrlSetStructuredText parseText format["Dear Sir<br/><br/>   Recent events have seen a disturbing increase in the operations of local insurgents. We have strong intelligence from our local sources that insurgents are operating a base in your area, centered in <t underline='true'>%1</t>.<br/><br/>We are requested your assistance in dealing with this matter, and ask if you could spare some forces to destroy all the <t underline='true'>%2s</t> that are located within the town.<br/><br/>Warm Regards,",(text _town),_name];
				_TextPicture2 ctrlSetText format["\usec_lha\ui\targets\%1_CA.paa",_type];
				_taskSml = format["Clear %1 of %2s",(text _town),_name];
				_taskDesc = format["Insurgents have been reported as operating with the local town of %1. Proceed to %1 and clear it of of %2. You will need to destroy the %2s within the next hour.",(text _town),_name];
				_taskTiny = format["Clear %1",(text _town)];
				_task = player createSimpleTask[_taskSml];
				_task setSimpleTaskDescription[_taskDesc, _taskSml, _taskTiny];
				_task setSimpleTaskDestination (position _tracker);
				
				["MIS001",0,_taskSml] call fnc_usec_recordEventClient;
				
				waitUntil{!dialog};
				
				[_task] call mk_fTaskHint;
				
				//Wait for complete
				_missionGo = true;
				_stime = time;
				while {_missionGo} do {
					_stillAlive = {alive _x} count _caches;
					_ctime = ((time - _stime) /60);
					if (_stillAlive == 0) then {
						//Win: Destroyed
						_task settaskstate "SUCCEEDED";
						_taskSml = format["%1 successfully cleared of %2s",(text _town),_name];
						["MIS003",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;	
						_msg1 = format["%1 cleared",(text _town)];
						_strTime = call fnc_usec_getTimeStr;
						_first = [_msg1,_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
					if (_ctime > 60) then {
						_missionGo = false;
						//Failed: Time
						_task settaskstate "FAILED";
						_taskSml = format["Failed to clear %1 of %2s within time",(text _town),_name];
						["MIS002",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;
						_strTime = call fnc_usec_getTimeStr;
						_first = ["Out of time",_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};		
					sleep 2;
				};
				sleep 10;
				{player removeSimpleTask _x} forEach [_task];
			};
			case 4: {
				_town = _tracker;
				_pilot = _this select 3;
				_wreck = _this select 4;
				
				//player setpos [((position _wreck select 0) + 5),(position _wreck select 1),0];
				
				_TextTitle ctrlSetStructuredText parseText format["Dear Sir<br/><br/>   As discussed, we require an urgent rescue mission in order to recover the crew of one of our helicopters that was shot down.<br/><br/>  The helicopter crashed in <t underline='true'>%1</t> and reports are that the crew were found alive by local insurgents and are being held hostage. You must locate the downed crew and rescue them before they are be moved. Be careful of civilians in the area.<br/><br/>Warm Regards,",(text _town)];
				_TextPicture ctrlSetText"\usec_lha\ui\targets\downedpilot_CA.paa";
				_taskSml = format["Rescue Crew in %1",(text _town)];
				//_video = ["\usec_lha\ui\videos\video_helocrash.ogv",[(0.1 * safezoneW + safezoneX), (0.1 * safezoneH + safezoneY), (0.275 * safezoneW), (0.275 * safezoneH)]] spawn bis_fnc_playVideo;
				_taskDesc = format["A helicopter has been shot down in %1. Proceed there and rescue those crew that are still alive before are moved. Be careful of civilians.",(text _town),_name];
				_taskTiny ="Rescue Crew";
				_task = player createSimpleTask[_taskSml];
				_task setSimpleTaskDescription[_taskDesc, _taskSml, _taskTiny];
				_task setSimpleTaskDestination (position _tracker);
				[_wreck] spawn usec_mission_wreckSmoke;
				
				["MIS001",0,_taskSml] call fnc_usec_recordEventClient;
				
				waitUntil{!dialog};
				
				[_task] call mk_fTaskHint;
				
				//Animate Pilot
				_pilot switchMove "CivilSitting";
				
				//Wait for complete
				_missionGo = true;
				_stime = time;
				while {_missionGo} do {
					_stillAlive = alive _pilot;
					_ctime = ((time - _stime) /60);
					if (!_stillAlive) then {
						//Failed: Killed
						_task settaskstate "FAILED";
						_taskSml = "Failed as the Pilot was killed";
						["MIS002",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;
						_strTime = call fnc_usec_getTimeStr;
						_first = ["Pilot Killed",_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
					if (_ctime > 60) then {
						//Failed: Time
						_task settaskstate "FAILED";
						_taskSml = "Failed to rescue pilot before he was moved";
						["MIS002",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;
						_strTime = call fnc_usec_getTimeStr;
						_first = ["Pilot Moved",_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
					if ((_pilot distance _wreck) > 2000) then {
						//Win: Destroyed
						_task settaskstate "SUCCEEDED";
						_taskSml = format["Successfully rescued pilot from %1",(text _town)];
						["MIS003",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;
						_strTime = call fnc_usec_getTimeStr;
						_first = ["Pilot Rescued",_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
					sleep 2;
				};
				sleep 10;
				{player removeSimpleTask _x} forEach [_task];
			};
			case 5: {
				_town = _tracker;
				_cache = _this select 3;
				_type = typeOf (_cache);
				_name = getText (configfile >> "CfgVehicles" >> _type >> "displayName");
				_TextTitle ctrlSetStructuredText parseText format["Dear Sir<br/><br/>   We have been tracking a target who has recently moved into your Area of Operations. He has in his possestion an item which would provide us information regarding another high-value target.<br/><br/>   We request your assistance in infiltrating the targets compound in <t underline='true'>%1</t> and collecting the <t underline='true'>%2</t> without being detected by the local insurgents in the area.<br/><br/>Warm Regards,",(text _town),_name];
				_TextPicture2 ctrlSetText format["\usec_lha\ui\targets\%1_CA.paa",_type];
				_taskSml = format["Locate %2 in %1",(text _town),_name];
				_taskDesc = format["Infiltrate %1 and locate the %2 without being detected by enemy forces. You have one hour to complete this mission.",(text _town),_name];
				_taskTiny = format["Infiltrate %1",(text _town)];
				_task = player createSimpleTask[_taskSml];
				_task setSimpleTaskDescription[_taskDesc, _taskSml, _taskTiny];
				_task setSimpleTaskDestination (position _cache);
				_task2="";				

				["MIS001",0,_taskSml] call fnc_usec_recordEventClient;
				
				waitUntil{!dialog};
				
				[_task] call mk_fTaskHint;
				_cache addAction [format["Collect %1",_name], "missions\collect.sqf", [_cache], 1, false, true, "", ""];
				player reveal _cache;
				
				//Wait for complete
				_missionGo = true;
				_task1Done = false;
				_stime = time;
				while {_missionGo} do {
					_status = _cache getVariable ["status",0];
					_ctime = ((time - _stime) /60);
					_itemList = items player;
					_isInLocation = getPos player in LHA_Location;
					if (_status == 1) then {
						//Fail: Detected
						_task settaskstate "FAILED";
						_taskSml = format["Enemy detected team in %1",(text _town),_name];
						["MIS002",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;	
						_strTime = call fnc_usec_getTimeStr;
						_first = ["Detected",_strTime] spawn BIS_fnc_infoText;
						deleteVehicle _trg;
						_missionGo = false;
					};
					if ((_type in _itemList) and !_task1Done) then {
						//has item
						_cache setVariable["status",2,true];
					};
					if ((_status == 2) and !_task1Done) then {
						//Win: Item Found
						_cache hideObject true;
						_task settaskstate "SUCCEEDED";
						_taskSml = format["Collected %2 in %1",(text _town),_name];
						["MIS003",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;	
						_strTime = call fnc_usec_getTimeStr;
						_msg1 = format["Collected %1",_name];
						_first = [_msg1,_strTime] spawn BIS_fnc_infoText;
						sleep 2;
						_task2 = player createSimpleTask["Return to Base"];
						_task2 setSimpleTaskDescription[format["Return the %1 to base. You must not be detected during this phase.",_type], "Return to base", "Return to Base"];
						_task2 setSimpleTaskDestination (position lhd);
						[_task2] call mk_fTaskHint;
						_task1Done = true;
					};
					if (_status == 3) then {
						//Win: Item Returned
						player removeWeapon _item;
						_task2 settaskstate "SUCCEEDED";
						_taskSml = format["Returned with %2",(text _town),_name];
						["MIS003",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;	
						_strTime = call fnc_usec_getTimeStr;
						_msg1 = format["Returned %1",_name];
						_first = [_msg1,_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
					if ((_ctime > 60) and !(_status > 1)) then {
						//Failed: Time
						_task settaskstate "FAILED";
						_taskSml = format["Failed to clear %1 of %2s within time",(text _town),_name];
						["MIS002",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;
						_strTime = call fnc_usec_getTimeStr;
						_first = ["Out of time",_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
					if ((_type in _itemList) and (_status == 2) and _isInLocation) then {
						//has item
						_cache setVariable["status",3,true];
					};
					sleep 2;
				};
				sleep 1;
				player removeSimpleTask _task;
				player removeSimpleTask _task2;
			};
			case 6: {
				_location = _tracker;
				_object = _this select 3;
				_type = typeOf _object;
				_name = getText (configfile >> "CfgVehicles" >> _type >> "displayName");
				_totalTime = 20;
				
				_TextTitle ctrlSetStructuredText parseText format["Dear Sir<br/><br/>   The 2nd Armoured Division is conducting an attack in your area and we request your assistance in protecting a <t underline='true'>%1</t> that is in direct support of this operation.<br/><br/>   Head immediately to the location and defend the area from all enemies. We have reports that local insurgents will try and rush the position, it is vital that the position is protected for the 20 minutes required for the operation.<br/><br/>Warm Regards,",_name];
				_TextPicture2 ctrlSetText format["\usec_lha\ui\targets\%1_CA.paa",_type];
				_taskSml = format["Defend %1",_name];
				_taskDesc = format["Defend a %1 that is support of an allied attack",_name];
				_taskTiny = format["Defend %1",_name];
				_task = player createSimpleTask[_taskSml];
				_task setSimpleTaskDescription[_taskDesc, _taskSml, _taskTiny];
				_task setSimpleTaskDestination (position _object);
				
				["MIS001",0,_taskSml] call fnc_usec_recordEventClient;
				
				waitUntil{!dialog};
				
				[_task] call mk_fTaskHint;
				
				//Wait for complete
				_missionGo = true;
				_stime = time;
				_msg1 = false;
				_msg2 = false;
				_msg3 = false;
				while {_missionGo} do {
					_stillAlive = alive _object;
					if (_object getVariable["status",0] == 0) then {
						_stime = time;
					};
					_ctime = ((time - _stime) /60);
					if (!_stillAlive) then {
						//Failed: Killed
						_task settaskstate "FAILED";
						_taskSml = format["Failed as the %1 was destroyed",_name];
						["MIS002",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;
						_strTime = call fnc_usec_getTimeStr;
						_first = [format["%1 Destroyed",_name],_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
					if ((_ctime > (_totalTime - 15)) and !_msg3) then {
						_strTime = call fnc_usec_getTimeStr;
						_first = ["15 minutes left",_strTime] spawn BIS_fnc_infoText;
						_msg3 = true;
					};
					if ((_ctime > (_totalTime - 10)) and !_msg1) then {
						_strTime = call fnc_usec_getTimeStr;
						_first = ["10 minutes left",_strTime] spawn BIS_fnc_infoText;
						_msg1 = true;
					};
					if ((_ctime > (_totalTime - 5)) and !_msg2) then {
						_strTime = call fnc_usec_getTimeStr;
						_first = ["5 minutes left",_strTime] spawn BIS_fnc_infoText;
						_msg2 = true;
					};
					if (_ctime > _totalTime) then {
						//Win: Destroyed
						_task settaskstate "SUCCEEDED";
						_taskSml = format["Successfully defended the %1",_name];
						["MIS003",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;
						_strTime = call fnc_usec_getTimeStr;
						_first = [format["%1 Defended",_name],_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
					sleep 2;
				};
				sleep 10;
				{player removeSimpleTask _x} forEach [_task];
			};
			case 7: {
				_town = _tracker;
				_object = _this select 3;
				_totalTime = _this select 4;
				_TextTitle ctrlSetStructuredText  parseText format["Dear Sir\n\n   Our office has received information regarding the local of a local rebel leader. He is currently located his headquarters in <t underline='true'>%1</t> and we believe it is heavily fortified.<br/><br/>   You should expect a difficult entry and multiple lines of defence, including patrols.<br/><br/>    We have received reports he will be leaving the complex in <t underline='true'>%2 minutes time</t>.",(text _town),_totalTime];
				_TextPicture ctrlSetText format["\usec_lha\ui\targets\%1_CA.paa",(TypeOf _object)];
				
				_task = player createSimpleTask[_missName];
				_task setSimpleTaskDescription[format["A Rebel leader has established an HQ in your area. You must assault his complex and eleminate him. Expect his complex to be heavily guarded. You must eliminate him within %1 minutes",_totalTime], "Kill Rebel Leader", "Kill"];
				_task setSimpleTaskDestination (position _tracker);
				
				["MIS001",0,_missName] call fnc_usec_recordEventClient;
				
				waitUntil{!dialog};
				
				[_task] call mk_fTaskHint;

				_missionGo = true;
				_stime = time;
				_msg1 = false;
				_msg2 = false;
				_msg3 = false;
				_msg4 = false;
				
				while {_missionGo} do {
					_stillAlive = alive _object;
					_ctime = ((time - _stime) /60);
					if ((_ctime > (_totalTime - 30)) and !_msg4) then {
						_strTime = call fnc_usec_getTimeStr;
						_first = ["30 minutes left",_strTime] spawn BIS_fnc_infoText;
						_msg4 = true;
					};
					if ((_ctime > (_totalTime - 15)) and !_msg3) then {
						_strTime = call fnc_usec_getTimeStr;
						_first = ["15 minutes left",_strTime] spawn BIS_fnc_infoText;
						_msg3 = true;
					};
					if ((_ctime > (_totalTime - 10)) and !_msg1) then {
						_strTime = call fnc_usec_getTimeStr;
						_first = ["10 minutes left",_strTime] spawn BIS_fnc_infoText;
						_msg1 = true;
					};
					if ((_ctime > (_totalTime - 5)) and !_msg2) then {
						_strTime = call fnc_usec_getTimeStr;
						_first = ["5 minutes left",_strTime] spawn BIS_fnc_infoText;
						_msg2 = true;
					};
					if (_ctime > _totalTime) then {
						//Fail: Time
						_task settaskstate "FAILED";
						_taskSml = format["Rebel Leader escaped in %1",_name];
						["MIS002",0,_taskSml] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;
						_strTime = call fnc_usec_getTimeStr;
						_first = ["Target Escaped",_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
					if (!_stillAlive) then {
						//Win: He was killed
						_task settaskstate "SUCCEEDED";
						["MIS003",0,"Rebel Leader Killed"] call fnc_usec_recordEventClient;
						[_task] call mk_fTaskHint;
						_strTime = call fnc_usec_getTimeStr;
						_first = ["Target Killed",_strTime] spawn BIS_fnc_infoText;
						_missionGo = false;
					};
				};
				sleep 10;
				{player removeSimpleTask _x} forEach [_task];
			};
		};
		CurrentMissions = CurrentMissions + [_number];
		USEC_MissionPublisher = [];
		publicVariable "USEC_MissionPublisher";
	};