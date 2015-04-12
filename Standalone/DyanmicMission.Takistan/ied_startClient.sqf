if (!isServer) then {
	_iedarray=["Land_IED_v1_PMC","Land_IED_v2_PMC","Land_IED_v3_PMC","Land_IED_v4_PMC"];
	while {alive player} do {
		_nearest=nearestObjects [(vehicle player),_iedarray,20];
		if ((count _nearest)>0) then {
			_thisied=(_nearest select 0);
			if (_thisied getVariable ["IEDStatus",0]==1) then {// This is a bomb that can detonate
				_vel=velocity (vehicle player);
				_speed=abs(sqrt ((_vel select 0)^2+(_vel select 1)^2)*3.6);
				if (_speed>5.5) then {
					//BANG!
					sleep ((random 10)/_speed);
					[_thisied] spawn fnc_iedDetonate;
				};
			};
		};
		sleep 1;
	};
};