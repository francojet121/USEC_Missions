#define USEC_DebarkationControl_IDD 50001
#define HomeBtnPic 4201
#define HomeBtnButton 4301
#define ActivityBtnPic 4202
#define ActivityBtnButton 4302
#define InventoryBtnPic 4203
#define InventoryBtnButton 4303
#define StoreBtnPic 4204
#define StoreButton 4304

#define HomePage 4500
#define ActivityLog 4600
#define LHAPicture 4700
#define StorageVehicleList 4701

#define StoreVehicleList 4900




class USEC_DebarkationControl {
	name=USEC_DebarkationControl;
	idd = USEC_DebarkationControl_IDD;
	enableSimulation = 1;
	onLoad = "[] spawn LHD_Garage_fnc_mainDisplay;";

	class controlsBackground {

		class Mainback: RscPicture {
			idc = 1001;
			x = -0.2;
			y = -0.7;
			h = 2.3;
			w = 1.5;
			text = "usec_resources\images\LHD\LHDEmbarkBG.paa";

			};
	};
	class controls {

		//MENU
		//0.170 between buttons
		//0.14255 between activatable
		
		class BayButton {
			idc = -1;
			type = 1;
			style = 2;
			default = 0;
			font = "EtelkaNarrowMediumPro";
			sizeEx = 0.025000;
			colorText[] = {0, 0, 0, 0};
			colorFocused[] = {0, 0, 0, 0};
			colorDisabled[] = {0, 0, 0, 0};
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundDisabled[] = {0, 0, 0, 0};
			colorBackgroundActive[] = {0, 0, 0, 0};
			offsetX = 0;
			offsetY = 0;
			offsetPressedX = 0;
			offsetPressedY = 0;
			colorShadow[] = {0, 0, 0, 0};
			colorBorder[] = {0, 0, 0, 0};
			borderSize = 0;
			soundEnter[] = {"\ca\ui\data\sound\mouse2", 0.090000, 1};
			soundPush[] = {"\ca\ui\data\sound\new1", 0.090000, 1};
			soundClick[] = {"\ca\ui\data\sound\mouse3", 0.070000, 1};
			soundEscape[] = {"\ca\ui\data\sound\mouse1", 0.090000, 1};
			x = 0.237;
			y = 0.658;
			w = 0.083000;
			h = 0.111000;
			text = "";
			action = "";
		};
		
		
		class HomeBtn: RscPicture {
			idc = HomeBtnPic;
			x = -0.15;
			y = -0.15;
			w = 0.34;
			h = 0.4;
			text = "usec_resources\images\LHD\HomeBtn.paa";
		};

		class HomeBtnPic: RscPicture {
			x = -0.1;
			y = -0.0255;
			w = 0.24;
			h = 0.15;
			text = "";
		};
		

		class HomeBtnButton: BayButton {
			idc = HomeBtnButton;
			x = -0.1;
			y = -0.0255;
			w = 0.24;
			h = 0.15;
			action = "[1] call LHD_Garage_fnc_NavHomeFunction;";
			onMouseEnter = "[4201,true] call LHD_Garage_fnc_NavBtnOver";
			onMouseExit = "[4201,false] call LHD_Garage_fnc_NavBtnOver";
		};

		
		class ActivityBtn: RscPicture {
			idc = ActivityBtnPic;
			x = -0.15;
			y = 0.015;
			w = 0.34;
			h = 0.4;
			text = "usec_resources\images\LHD\ActivityBtn.paa";
		};

		class ActivitBtnPic: RscPicture {
			x = -0.1;
			y = 0.14;
			w = 0.24;
			h = 0.15;
			text = "";
		};

		class ActivitBtnButton: BayButton {
			idc = ActivityBtnButton;
			x = -0.1;
			y = 0.14;
			w = 0.24;
			h = 0.15;
			action = "[1] call LHD_Garage_fnc_NavActivityLogFunction;";
			onMouseEnter = "[4202,true] call LHD_Garage_fnc_NavBtnOver";
			onMouseExit = "[4202,false] call LHD_Garage_fnc_NavBtnOver";
		};		
		

		class InventoryBtn: RscPicture {
			idc = InventoryBtnPic;
			x = -0.15;
			y = 0.180;
			w = 0.34;
			h = 0.4;
			text = "usec_resources\images\LHD\InventoryBtn.paa";
		};

		class InventoryBtnPic: RscPicture {
			x = -0.1;
			y = 0.2855;
			w = 0.24;
			h = 0.15;
			text = "";
		};
		

		class InventoryBtnButton: BayButton {
			idc = InventoryBtnButton;
			x = -0.1;
			y = 0.28255;
			w = 0.24;
			h = 0.15;
			action = "[1] call LHD_Garage_fnc_NavInventorystatusFunction;";
			onMouseEnter = "[4203,true] call LHD_Garage_fnc_NavBtnOver";
			onMouseExit = "[4203,false] call LHD_Garage_fnc_NavBtnOver";
		};				

		
		class StoreBtn: RscPicture {
			idc = StoreBtnPic;
			x = -0.15;
			y = 0.350;
			w = 0.34;
			h = 0.4;
			text = "usec_resources\images\LHD\StoreVehicleBtn.paa";
		};

		class StoreBtnPic: RscPicture {
			x = -0.1;
			y = 0.4251;
			w = 0.24;
			h = 0.15;
			text = "";
		};
		

		class StoreBtnButton: BayButton {
			idc = StoreButton;
			x = -0.1;
			y = 0.4251;
			w = 0.24;
			h = 0.15;
			action = "[1] call LHD_Garage_fnc_NavStoreVehicleFunction;";
			onMouseEnter = "[4204,true] call LHD_Garage_fnc_NavBtnOver";
			onMouseExit = "[4204,false] call LHD_Garage_fnc_NavBtnOver";
		};				
		
		//HOME TAB
	
		//END OF MENU
		
		
		//HOME TEXT
			class HomeMenu { 
				idc = HomePage;
				type = 0;
				style = 16;
				x = 0.189; 
				y = 0.01;
				w = 0.96;
				h = 0.89;
				font = "EtelkaNarrowMediumPro";
				sizeEx = 0.07;
				colorBackground[] = {0,0,0,0};
				colorText[] = {1,1,1,1};
				text = "You really shouldnt be reading this";
				linespacing = 1;
			};
	
		//Activity Log
		class activityLog : RscListNBox
		{
			idc = ActivityLog;
			text = "";
			sizeEx = 0.04;
			columns[] = {0,0.105,0.5,0.8};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
				x = 0.189; 
				y = 0.01;
				w = 0.96;
				h = 0.89;
		};
			

		//InventoryStatus
		class LHAPicture: RscPicture {
			idc = LHAPicture;
			x = 0.175; 
			y = 0.46;
			w = 0.990000;
			h = 0.659000;
			shown = 0;
			text = "usec_resources\images\LHD\picture_lha_ca.paa";
		};
		
		
		class vehicleList : RscListNBox
		{
			idc = StorageVehicleList;
			text = "";
			sizeEx = 0.04;
			columns[] = {0, 0.15 , 0.8};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
				x = 0.189; 
				y = 0.01;
				w = 0.48;
				h = 0.44;
			onMouseButtonClick = "[] call LHD_Garage_fnc_spawnVehicleSelected";
		};		
		
		
		//0.05 between y rows
		
		class SelectedVehicle: SelectionInfo {
			idc = 4800;
			text = "Selected Vehicle:";
		};

		class SelectedID: SelectionInfo {
			idc = 4801;
			text = "Vehicle ID:";
			y = 0.06;
		};		
		
		class SelectedLastUsed: SelectionInfo {
			idc = 4802;
			text = "Stored Date:";
			y = 0.11;
		};		
		
		class SelectLastUsedBy: SelectionInfo {
			idc = 4803;
			text = "Stored By:";
			y = 0.16;
		};						
		
		
		class SelectedBay: SelectionInfo {
			idc = 4804;
			text = "Selected Bay:";
			y = 0.21;
		};				
		
		class SelectedHealth: SelectionInfo {
			idc = 4811;
			text = "Repair Status:";
			y = 0.26;
		};
		
		
		class SelectedVehicleText: SelectionInfo {
			idc = 4805;
			x = 0.9;
			text = "N/A";
		};
		
		class SelectedIDText: SelectionInfo {
			idc = 4806;
			x = 0.9;
			y = 0.06;
			text = "N/A";
		};
		
		class SelectedLastUsedText: SelectionInfo {
			idc = 4807;
			x = 0.9;
			y = 0.11;
			text = "N/A";
		};
		
		class SelectedLastUsedByText: SelectionInfo {
			idc = 4808;
			x = 0.9;
			y = 0.16;
			text = "N/A";
		};
		
		class SelectedBayText: SelectionInfo {
			idc = 4809;
			x = 0.9;
			y = 0.21;
			text = "None Selected";
		};		
		
		
		
		class ButtonSettings : RscButtonMenu 
		{
			idc = 4810;
			text = "Retrieve vehicle";
			onButtonClick = "[] call LHD_Garage_fnc_spawnVehicle";
			x = 0.679;
			y = 0.4;
			w = 0.455;
			h = 0.045;
		};

		class SelectedHealthText: SelectionInfo {
			idc = 4812;
			x = 0.9;
			y = 0.26;
			text = "N/A";
		};		
		
		
		class Bay1PicBorder: RscPicture {
			idc = 1201;
			x = 0.23;
			y = 0.70000;
			w = 0.083000;
			h = 0.111000;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.700000};
			text = "usec_resources\images\LHD\button_icon_default_ca.paa";
		};

		class Bay1Pic: RscPicture {
			idc = 1101;
			x = 0.23;
			y = 0.70000;
			w = 0.083000;
			h = 0.111000;
			colorBackground[] = {0, 0, 0, 0};
			colorText[] = {1, 1, 1, 0.700000};
			text = "";
		};

		class Bay1Button: BayButton {
			idc = 1301;
			x = 0.23;
			y = 0.70000;
			action = "[1] call LHD_Garage_fnc_BaySelect;";
			onMouseEnter = "[1201,true] call LHD_Garage_fnc_BayOver";
			onMouseExit = "[1201,false] call LHD_Garage_fnc_BayOver";
		};
		
		
		
		class Bay2PicBorder: Bay1PicBorder {
			idc = 1202;
			x = 0.23;
			y = 0.567000;
		};

		class Bay2Pic: Bay1Pic {
			idc = 1102;
			x = 0.23;
			y = 0.567000;
		};

		class Bay2Button: BayButton {
			idc = 1302;
			x = 0.23;
			y = 0.567000;
			action = "[2] call LHD_Garage_fnc_BaySelect;";
			onMouseEnter = "[1202,true] call LHD_Garage_fnc_BayOver";
			onMouseExit = "[1202,false] call LHD_Garage_fnc_BayOver";
		};
		
		
		class Bay3PicBorder: Bay1PicBorder {
			idc = 1203;
			x = 0.36;
			y = 0.567000;
		};

		class Bay3Pic: Bay1Pic {
			idc = 1103;
			x = 0.36;
			y = 0.567000;
		};

		class Bay3Button: BayButton {
			idc = 1303;
			x = 0.36;
			y = 0.567000;
			action = "[3] call LHD_Garage_fnc_BaySelect;";
			onMouseEnter = "[1203,true] call LHD_Garage_fnc_BayOver";
			onMouseExit = "[1203,false] call LHD_Garage_fnc_BayOver";
		};

		class Bay4PicBorder: Bay1PicBorder {
			idc = 1204;
			x = 0.4;
			y = 0.70000;
		};

		class Bay4Pic: Bay1Pic {
			idc = 1104;
			x = 0.4;
			y = 0.70000;
		};

		class Bay4Button: BayButton {
			idc = 1304;
			x = 0.4;
			y = 0.70000;
			action = "[4] call LHD_Garage_fnc_BaySelect;";
			onMouseEnter = "[1204,true] call LHD_Garage_fnc_BayOver";
			onMouseExit = "[1204,false] call LHD_Garage_fnc_BayOver";
		};
		
		
		class Bay5PicBorder: Bay1PicBorder {
			idc = 1205;
			x = 0.55;
			y = 0.70000;
		};

		class Bay5Pic: Bay1Pic {
			idc = 1105;
			x = 0.55;
			y = 0.70000;
		};

		class Bay5Button: BayButton {
			idc = 1305;
			x = 0.55;
			y = 0.7000;
			action = "[5] call LHD_Garage_fnc_BaySelect;";
			onMouseEnter = "[1205,true] call LHD_Garage_fnc_BayOver";
			onMouseExit = "[1205,false] call LHD_Garage_fnc_BayOver";
		};

		class Bay6PicBorder: Bay1PicBorder {
			idc = 1206;
			x = 0.69;
			y = 0.70000;
		};

		class Bay6Pic: Bay1Pic {
			idc = 1106;
			x = 0.69;
			y = 0.70000;
		};

		class Bay6Button: BayButton {
			idc = 1306;
			x = 0.69;
			y = 0.7000;
			action = "[6] call LHD_Garage_fnc_BaySelect;";
			onMouseEnter = "[1206,true] call LHD_Garage_fnc_BayOver";
			onMouseExit = "[1206,false] call LHD_Garage_fnc_BayOver";
		};
		
			class Bay7PicBorder: Bay1PicBorder {
			idc = 1207;
			x = 0.85;
			y = 0.70000;
		};

		class Bay7Pic: Bay1Pic {
			idc = 1107;
			x = 0.85;
			y = 0.70000;
		};

		class Bay7Button: BayButton {
			idc = 1307;
			x = 0.85;
			y = 0.70000;
			action = "[7] call LHD_Garage_fnc_BaySelect;";
			onMouseEnter = "[1207,true] call LHD_Garage_fnc_BayOver";
			onMouseExit = "[1207,false] call LHD_Garage_fnc_BayOver";
		};
		
		
		class Bay8PicBorder: Bay1PicBorder {
			idc = 1208;
			x = 0.89;
			y = 0.567000;
		};

		class Bay8Pic: Bay1Pic {
			idc = 1108;
			x = 0.89;
			y = 0.567000;
		};

		class Bay8Button: BayButton {
			idc = 1308;
			x = 0.89;
			y = 0.567000;
			action = "[8] call LHD_Garage_fnc_BaySelect;";
			onMouseEnter = "[1208,true] call LHD_Garage_fnc_BayOver";
			onMouseExit = "[1208,false] call LHD_Garage_fnc_BayOver";
		};

		class Bay9PicBorder: Bay1PicBorder {
			idc = 1209;
			x = 0.99;
			y = 0.70000;
		};

		class Bay9Pic: Bay1Pic {
			idc = 1109;
			x = 0.99;
			y = 0.70000;
		};

		class Bay9Button: BayButton {
			idc = 1309;
			x = 0.99;
			y = 0.70000;
			action = "[9] call LHD_Garage_fnc_BaySelect;";
			onMouseEnter = "[1209,true] call LHD_Garage_fnc_BayOver";
			onMouseExit = "[1209,false] call LHD_Garage_fnc_BayOver";
		};
		
		
		
		
		
		//Store Vehicle Options
		
		class NearByVehicleList : RscListNBox
		{
			idc = StoreVehicleList;
			text = "";
			sizeEx = 0.04;
			columns[] = {0, 0.15 , 0.8};
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			rowHeight = 0.050;
				x = 0.189; 
				y = 0.06;
				w = 0.48;
				h = 0.85;
			onMouseButtonClick = "[] call LHD_Garage_fnc_displayStoredVehicle";				
		};		
		
		
		
		class VehiclesNearbyTitle: SelectionInfo {
			idc = 4901;
			text = "Storable Vehicles:";
			x = 0.189; 
			y = 0.01;
			w = 1;
			font = "EtelkaNarrowMediumPro";
			sizeEx = 0.05;
		};		
		
		//0.05 between y rows
		
		class SelectedVehicleNearby: SelectionInfo {
			idc = 4902;
			text = "Selected Vehicle:";
			y = 0.06;
		};

		class SelectedVehicleNearbyID: SelectionInfo {
			idc = 4903;
			text = "Vehicle ID:";
			y = 0.11;
		};

		class SelectedVehicleNearbyRepairStatus: SelectionInfo {
			idc = 4904;
			text = "Repair Status:";
			y = 0.16;
		};		
		
		class SelectedVehicleOccupantsNearby: SelectionInfo {
			idc = 4905;
			text = "Current Occupants:";
			y = 0.21;
		};		
		
		class SelectedVehicleTextNearby: SelectionInfo {
			idc = 4906;
			x = 0.9;
			text = "N/A";
			y = 0.06;
		};
		
		class SelectedRepairStatusNearby: SelectionInfo {
			idc = 4907;
			x = 0.9;
			y = 0.16;
			text = "N/A";
		};
		
		class SelectedIDTextNearby: SelectionInfo {
			idc = 4908;
			x = 0.9;
			y = 0.11;
			text = "N/A";
		};
		
		class SelectedVehicleOccupantsNearbyText: SelectionInfo {
			idc = 4909;
			x = 0.9;
			y = 0.21;
			text = "N/A";
		};		
		
		class SelectedVehicleEngineRunning: SelectionInfo {
			idc = 4910;
			text = "Engine Running:";
			y = 0.26;
		};
		
		class SelectedVehicleEngineRunningText: SelectionInfo {
			idc = 4911;
			x = 0.9;
			y = 0.26;
			text = "N/A";
		};		
		
		
		class ButtonSettingsNearby : RscButtonMenu 
		{
			idc = 4912;
			text = "Store Selected Vehicle";
			onButtonClick = "[] call LHD_Garage_fnc_storeVehicle";
			x = 0.679;
			y = 0.85;
			w = 0.455;
			h = 0.045;
		};
		
		
		
		
	};

};