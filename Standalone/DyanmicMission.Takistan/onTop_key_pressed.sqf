//onTop_key_press.sqf start
//© JUNE 2009 - norrin

If (!(local player)) exitWith{};

switch ((_this select 1)) do
{
		
		//DELETE key
		case 211:
		{	
			comment "Rotate unit anticlockwise";
			if (attached) then 
			{
				_dir = ((getDir player) - 0.1) - 1;
				player setDir _dir;
			};
		};
		//END key
		case 207:
		{	
			comment "Rotate unit clockwise";
			if (attached) then 
			{
				_dir = ((getDir player) + 0.1) + 1;
				player setDir _dir;
			}; 	
		};
		//INSERT key
		case 210:
		{	
			comment "Space - eject";
			if (attached) then 
			{	
				detach player;
				NORRN_notOnTOP = true;
				titleCut ["Disembarking APC","PLAIN DOWN", 0.2];
			};
		};

		//R key
		case 19:
		{	
			comment "R - reload";
			if (attached) then 
			{	
				reload player;
			};
		};
		
}; 

