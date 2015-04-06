
		//Run when a player selects a bay
		private["_bay","_ctrl","_pic","_control","_display","_baytext","_status","_r","_g","_b","_TextVehicle","_TextDriver","_baySelected","_bayStatus","_vehList","_type","_ctrlSpawn","_ctrlReturn","_ctrlService"];
		
		_bay = _this select 0;
		
		
		if ( ! (_bay == LHA_SelectedBay)) then {
		
		
		//if (LHA_SelectedBay > 0) then {
//			_status = (LHA_BayStatus select (LHA_SelectedBay - 1));
		//} else {
//			_status = false;
//		};
		
	//	if (_status) then {
		//	_r = 0.60;
		//	_g = 0.84;
		//	_b = 0.47;
		//} else {
		//	_r = 1;
		//	_g = 0;
		//	_b = 0;
		//};
		
		//Set New Control White
		_ctrl = 1200 + _bay;
		_pic = 1100 + _bay;
		
				
		_display=(findDisplay 50001);
		_control = (_display displayCtrl _ctrl);
		_picture = (_display displayCtrl _pic);
		_control ctrlSetTextColor [0.92,0.09,0,1];
		_picture ctrlSetTextColor [0.92,0.09,0,1];

		
		//_ctrlSpawn = (_display displayCtrl 1007);
		//_ctrlReturn = (_display displayCtrl 1008);
		//_ctrlService = (_display displayCtrl 1009);
		//_ctrlLoad = (_display displayCtrl 1010);
		

		if (LHA_SelectedBay > 0)  then {
		
				//Set Old Control Normal		
		_ctrl = 1200 + LHA_SelectedBay;
		_pic = 1100 + LHA_SelectedBay;
		_control = (_display displayCtrl _ctrl);
		_picture = (_display displayCtrl _pic);
		_control ctrlSetTextColor [1,1,1,0.7];
		_picture ctrlSetTextColor [1,1,1,0.7];
		};


		
		//Set Bay Selected
		LHA_SelectedBay = _bay;
		
		
		//_baytext = (_display displayCtrl 1003);
		//_baytext ctrlSetText format ["Bay #%1",_bay];
		//_TextVehicle = (_display displayCtrl 1004);
		//_TextDriver = (_display displayCtrl 1005);
		//_TextVehicle ctrlSetText "None";
		//_TextDriver ctrlSetText "None";	
		LHA_ActiveObject = player;
		
		_selectBayText = "None Selected";
		
		
		switch (_bay) do
		{
		   case 1:
		   {
			  _selectBayText = "Bay 1 (Upper Deck)";
		   };	
		   case 2:
		   {
			  _selectBayText = "Bay 2 (Upper Deck)";
		   };
		   case 3:
		   {
			  _selectBayText = "Bay 3 (Upper Deck)";
		   };
		   case 4:
		   {
			  _selectBayText = "Bay 4 (Upper Deck)";
		   };
		   case 5:
		   {
			  _selectBayText = "Bay 5 (Upper Deck)";
		   };   
		   case 6:
		   {
			  _selectBayText = "Bay 6 (Upper Deck)";
		   };  
		   case 7:
		   {
			  _selectBayText = "Bay 7 (Lower Deck)";
		   };  
		   case 8:
		   {
			  _selectBayText = "Bay 8 (Upper Deck)";
		   };  
		   case 9:
		   {
			  _selectBayText = "Bay 9 (Well Deck)";
		   };     
		};
		
		
		
		//Update the text
		_selectBayTextLabel = (_display displayCtrl 4809);
		_selectBayTextLabel ctrlSetText _selectBayText;
		
		};
		//Bay Select is 4809