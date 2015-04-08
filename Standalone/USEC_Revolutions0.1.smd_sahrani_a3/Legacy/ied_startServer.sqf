bombtype=["ARTY_Sh_81_HE","ARTY_Sh_105_HE","ARTY_Sh_122_HE"];
if (isServer) then {
	_bomblist=[];
	null=[] spawn {
		_mapy=13000; _count=0; _bomblist=[];
		while {_count<15} do {
			_pos=[random _mapy,random _mapy,0];
			_road=_pos nearRoads 200;
			if (count _road >0) then {
				_near=false;
				_rpos=getPos (_road select 0);
				{
					if ((_rpos distance _x)<300) then {
						_near=true;
					};
				} forEach _bomblist;
				if (_rpos in LHA_Deck) then {
					_near=true;
				};
				if (!_near) then {
					_rpos=[
					(_rpos select 0)+floor(random 10),
					(_rpos select 1)+floor(random 10),
					(_rpos select 2)];
					
					_bomblist set [count _bomblist,_rpos];
					_ied=format["Land_IED_v%1_PMC",(floor(random 4))+1] createVehicle _rpos;
					_ied setVehicleInit format["this addAction['Disarm','ied_disarm.sqf',[%1]];",_count];
					processInitCommands;
					_randtype=format["%1",bombtype select (floor(random (count bombtype)))];
					_ied setVariable ["IEDType",_randtype,true];
					_ied setVariable ["IEDStatus",1,true];
					_eventHandler = _ied addEventHandler ["Hit",{[_this select 0] spawn fnc_iedDetonate}];
					_ied setVariable ["IEDHandler",_eventHandler,true];
					_count=_count+1;
				};
			};
			sleep 0.01;
		};
	};
};