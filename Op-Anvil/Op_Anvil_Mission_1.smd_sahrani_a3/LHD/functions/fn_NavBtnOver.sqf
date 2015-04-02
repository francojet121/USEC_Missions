
		//Run when player moves mouse over or off a bay
		private["_ctrl","_pic","_isOver","_control","_display","_status","_r","_g","_b"];
		_ctrl = _this select 0;
		_pic = _ctrl - 100;
		
		if (LHA_SelectedBay != (_ctrl - 1200)) then {
			_isOver = _this select 1;
			//_display = (uiNamespace getVariable "USEC_DebarkationControl");
		
			_display= findDisplay 50001;
			
			_control = (_display displayCtrl _ctrl);
			_picture = (_display displayCtrl _pic);
			
			_imagePath = "usec_resources\images\LHD\HomeBtn.paa";
			_imagePathPressed  = "usec_resources\images\LHD\HomeBtnPressed.paa";
			
			if ( _ctrl == 4202 ) then {
				_imagePath = "usec_resources\images\LHD\ActivityBtn.paa";
				_imagePathPressed  = "usec_resources\images\LHD\ActivityBtnPressed.paa";
			};
			
			if ( _ctrl == 4203 ) then {
				_imagePath = "usec_resources\images\LHD\InventoryBtn.paa";
				_imagePathPressed  = "usec_resources\images\LHD\InventoryBtnPressed.paa";
			};
			
			if ( _ctrl == 4204 ) then {
				//hintsilent "Inventory Btn Over";
				_imagePath = "usec_resources\images\LHD\StoreVehicleBtn.paa";
				_imagePathPressed  = "usec_resources\images\LHD\StoreVehicleBtnPressed.paa";
			};			
			

			
				if (_isOver) then {
					//Mouse is over control
						_control ctrlSetText _imagePathPressed;
					} else {
						_control ctrlSetText _imagePath;
					};

		};