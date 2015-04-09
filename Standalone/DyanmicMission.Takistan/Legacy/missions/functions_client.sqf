usec_mission_wreckSmoke = {
	//Add smoke to a wreck
	private["_obj","_position","_PS2"];
	_obj = _this select 0;
	_position = position _obj;
	
	//Add Smoke
	_PS2 = "#particlesource" createVehicleLocal _position;
	_PS2 setParticleCircle [0, [0, 0, 0]];
	_PS2 setParticleRandom [0, [0, 0, 0], [0.5, 0.5, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
	_PS2 setParticleParams [["\Ca\Data\ParticleEffects\Universal\Universal.p3d", 16, 8, 16], "", "Billboard", 1, 15, [0, 0, 0], [random 0.1, random 0.1,0.5 + random 0.5], 1, 1.275, 1, 0.066, [4, 5, 10, 10], [[0.1, 0.1, 0.1, 0.75], [0.4, 0.4, 0.4, 0.5], [1, 1, 1, 0.2]], [0], 1, 0, "", "", _obj];
	_PS2 setDropInterval 0.5;
	[_obj,_ps2] spawn {
		waitUntil{!(alive _obj)};
		deleteVehicle _ps2;
	};
};