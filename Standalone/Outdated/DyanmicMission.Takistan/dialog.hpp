// Control types
#define CT_STATIC	0

// Static styles
#define ST_LEFT	0
#define ST_RIGHT	1
#define ST_CENTER	2
#define ST_UP		3
#define ST_DOWN	4
#define ST_VCENTER	5

#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_PICTURE	48
#define ST_FRAME	64

#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144
#define ST_WITH_RECT 160
#define ST_LINE	176

#define ST_SHADOW	256
#define ST_NO_RECT	512

#define FontM "TahomaB"
#define ST_LEFT      0
#define ST_RIGHT     1
#define ST_CENTER    2
#define CT_STATIC    0

class RscText
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {0.8784,0.8471,0.651,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = 0;
	shadow = 2;
	font = "Zeppelin32";
	SizeEx = 0.03921;
};
class RscStructuredText
{
	access = 0;
	type = 13;
	idc = -1;
	style = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	class Attributes
	{
		font = "Zeppelin32";
		color = "#e0d8a6";
		align = "center";
		shadow = 1;
	};
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.1;
	text = "";
	size = 0.03921;
	shadow = 2;
};
class RscPicture {
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	x = 0.1;
	y = 0.1;
	w = 0.4;
	h = 0.2;
	sizeEx = 0.04;
	colorBackground[] = {0, 0, 0, 0};
	colorText[] = {1, 1, 1, 1};
	font = FontM;
	text = "";
};
class RscEdit
{
	access = 0;
	type = 2;
	x = 0;
	y = 0;
	h = 0.04;
	w = 0.2;
	colorBackground[] = {0,0,0,1};
	colorText[] = {0.95,0.95,0.95,1};
	colorSelection[] = {0.8784,0.8471,0.651,1};
	autocomplete = "";
	text = "";
	size = 0.2;
	style = "0x00 + 0x40";
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.03921;
};
class RscCombo
{
	access = 0;
	type = 4;
	style = 0;
	colorSelect[] = {0.023529,0,0.0313725,1};
	colorText[] = {0.023529,0,0.0313725,1};
	colorBackground[] = {0.95,0.95,0.95,1};
	colorScrollbar[] = {0.023529,0,0.0313725,1};
	soundSelect[] = {"",0.1,1};
	soundExpand[] = {"",0.1,1};
	soundCollapse[] = {"",0.1,1};
	maxHistoryDelay = 1;
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	x = 0;
	y = 0;
	w = 0.12;
	h = 0.035;
	shadow = 0;
	colorSelectBackground[] = {0.8784,0.8471,0.651,1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0,0,0,0.6};
	colorActive[] = {0,0,0,1};
	colorDisabled[] = {0,0,0,0.3};
	font = "Zeppelin32";
	sizeEx = 0.03921;
};
class RscListBox
{
	access = 0;
	type = 5;
	w = 0.4;
	h = 0.4;
	rowHeight = 0;
	colorText[] = {0.8784,0.8471,0.651,1};
	colorScrollbar[] = {0.95,0.95,0.95,1};
	colorSelect[] = {0.95,0.95,0.95,1};
	colorSelect2[] = {0.95,0.95,0.95,1};
	colorSelectBackground[] = {0,0,0,1};
	colorSelectBackground2[] = {0.8784,0.8471,0.651,1};
	colorBackground[] = {0,0,0,1};
	soundSelect[] = {"",0.1,1};
	arrowEmpty = "#(argb,8,8,3)color(1,1,1,1)";
	arrowFull = "#(argb,8,8,3)color(1,1,1,1)";
	class ScrollBar
	{
		color[] = {1,1,1,0.6};
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {1,1,1,0.3};
		shadow = 0;
		thumb = "\ca\ui\data\ui_scrollbar_thumb_ca.paa";
		arrowFull = "\ca\ui\data\ui_arrow_top_active_ca.paa";
		arrowEmpty = "\ca\ui\data\ui_arrow_top_ca.paa";
		border = "\ca\ui\data\ui_border_scroll_ca.paa";
	};
	style = 16;
	font = "Zeppelin32";
	shadow = 2;
	sizeEx = 0.03921;
	color[] = {1,1,1,1};
	period = 1.2;
	maxHistoryDelay = 1;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
};
class RscButton
{
	access = 0;
	type = 1;
	text = "";
	colorText[] = {0.8784,0.8471,0.651,1};
	colorDisabled[] = {0.4,0.4,0.4,1};
	colorBackground[] = {1,0.537,0,0.5};
	colorBackgroundDisabled[] = {0.95,0.95,0.95,1};
	colorBackgroundActive[] = {1,0.537,0,1};
	colorFocused[] = {1,0.537,0,1};
	colorShadow[] = {0.023529,0,0.0313725,1};
	colorBorder[] = {0.023529,0,0.0313725,1};
	soundEnter[] = {"\ca\ui\data\sound\onover",0.09,1};
	soundPush[] = {"\ca\ui\data\sound\new1",0,0};
	soundClick[] = {"\ca\ui\data\sound\onclick",0.07,1};
	soundEscape[] = {"\ca\ui\data\sound\onescape",0.09,1};
	style = 2;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	shadow = 2;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	offsetX = 0.003;
	offsetY = 0.003;
	offsetPressedX = 0.002;
	offsetPressedY = 0.002;
	borderSize = 0;
};
class RscActiveText
{
	access = 0;
	type = 11;
	style = 2;
	color[] = { 0, 0, 0, 1 };
	colorActive[] = { 0.3, 0.4, 0, 1 };
	soundEnter[] = { "", 0.1, 1 };
	soundPush[] = { "", 0.1, 1 };
	soundClick[] = { "", 0.1, 1 };
	soundEscape[] = { "", 0.1, 1 };
	text = "";
	default = 0;
	idc = -1;
	x = 0;
	y = 0;
	h = 0.035;
	w = 0.035;
	font = "Zeppelin32";
	sizeEx = 0.03921;
	colortext[] = { 0, 0, 0, 1 };
};

class RscStandardDisplay;	// External class reference

class USEC_PromoNotice : RscStandardDisplay
{
	idd = 10010;
	movingenable = 0;

	class Controls
	{
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "\usec_lha\ui\ui_promo_ca.paa";
			x = 0.235511;
			y = 0.124242;
			w = 0.521591;
			h = 0.698485;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0;
			y = 0.764395;
			w = 1;
			h = 0.127273;
			colorBackground[] = {-1,-1,-1,0};
		};
		class RscPicture_1201: RscPicture
		{
			idc = 1201;
			text = "";
			x = 0.294319;
			y = 0.306818;
			w = 0.402273;
			h = 0.402273;
		};
	};
};

class USEC_MissionTask : RscStandardDisplay
{
	idd = 10010;
	movingenable = 0;
	class controlsBackground {
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "\usec_lha\ui\missionTasking_CA.paa";
			x = 0.263542 * safezoneW + safezoneX;
			y = 0.13 * safezoneH + safezoneY;
			w = 0.471874 * safezoneW;
			h = 0.764583 * safezoneH;
		};
	};
	class Controls
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "This is some test text/nThis is more text/nAnd more/nThis is more text/nAnd more/nThis is more text\nAnd more";
			x = 0.381251 * safezoneW + safezoneX;
			y = 0.335833 * safezoneH + safezoneY;
			w = 0.225 * safezoneW;
			h = 0.3525 * safezoneH;
			colorText[] = {0.1,0.1,0.1,1};
			class Attributes
			{
				color = "#000000";
				align = "left";
				shadow = 0;
			};
			size = 0.03921;
			shadow = 0;
		};
		class RscPicture_1201: RscPicture
		{	//Top Left
			idc = 1201;
			text = "";
			x = 0.289583 * safezoneW + safezoneX;
			y = 0.094167 * safezoneH + safezoneY;
			w = 0.252084 * safezoneW;
			h = 0.39625 * safezoneH;
		};
		class RscPicture_1202: RscPicture
		{	//Bottom Right
			idc = 1202;
			text = "";
			x = 0.453125 * safezoneW + safezoneX;
			y = 0.561667 * safezoneH + safezoneY;
			w = 0.252084 * safezoneW;
			h = 0.39625 * safezoneH;
		};
	};
};

class USEC_KillBoxEditor : RscStandardDisplay
{
	idd = 50063;
	movingenable = 0;
	class controlsBackground
	{
		class MouseCheck : RscActiveText  {
			idc = -1;
			style = 48;
			x = SafeZoneX;
			y = SafeZoneY;
			w = safezoneW;
			h = safezoneH;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {0, 0, 0, 0};
			colorActive[] = {0, 0, 0, 0};
			onMouseMoving = "USEC_MousePos = [(_this select 1),(_this select 2)];";
			onMouseZChanged = "USEC_MouseWheel = _this select 1;";
			onMouseButtonDown = "USEC_MouseButtonDown = true; USEC_MouseButton = _this;";
			onMouseButtonUp = "USEC_MouseButtonDown = false;";
		};
	};
	class Controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "KillBox Editor";
			x = 0.245703 * safezoneW + safezoneX;
			y = 0.1675 * safezoneH + safezoneY;
			w = 0.508594 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,0,1};
			colorBackground[] = {0,0,0,0.5};
			SizeEx = 0.05;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit";
			x = 0.655859 * safezoneW + safezoneX;
			y = 0.7975 * safezoneH + safezoneY;
			w = 0.0902344 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.155859 * safezoneW;
			h = 0.21 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
			onLBSelChanged = "USEC_Selection = false;USEC_SCRIPT_BuildSelectVM = [] execVM '\usec_code\scripts\ui_killBoxEditor_update.sqf';";
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Switch View";
			x = 0.655859 * safezoneW + safezoneX;
			y = 0.5175 * safezoneH + safezoneY;
			w = 0.0902344 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "USEC_ChangeView = true; if(USEC_isometricView) then {USEC_isometricView = false} else {USEC_isometricView = true};";
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Select Type";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.0175 * safezoneH;
			colorText[] = {1,1,0,1};
			SizeEx = 0.03;
		};
	};
};

class USEC_EnemyEditor : RscStandardDisplay
{
	idd = 50163;
	movingenable = 0;
	class controlsBackground
	{
		class MouseCheck : RscActiveText  {
			idc = -1;
			style = 48;
			x = SafeZoneX;
			y = SafeZoneY;
			w = safezoneW;
			h = safezoneH;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {0, 0, 0, 0};
			colorActive[] = {0, 0, 0, 0};
			onMouseMoving = "USEC_MousePos = [(_this select 1),(_this select 2)];";
			onMouseZChanged = "USEC_MouseWheel = _this select 1;";
			onMouseButtonDown = "USEC_MouseButtonDown = true; USEC_MouseButton = _this;";
			onMouseButtonUp = "USEC_MouseButtonDown = false;";
		};
	};
	class Controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Enemy Editor";
			x = 0.245703 * safezoneW + safezoneX;
			y = 0.1675 * safezoneH + safezoneY;
			w = 0.508594 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,0,1};
			colorBackground[] = {0,0,0,0.5};
			SizeEx = 0.05;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit";
			x = 0.655859 * safezoneW + safezoneX;
			y = 0.7975 * safezoneH + safezoneY;
			w = 0.0902344 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			text = "";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.155859 * safezoneW;
			h = 0.21 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
			onLBSelChanged = "USEC_Selection = false;USEC_SCRIPT_BuildSelectVM = [] execVM '\usec_code\scripts\ui_enemyBuild_updateLB.sqf';";
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Switch View";
			x = 0.655859 * safezoneW + safezoneX;
			y = 0.5175 * safezoneH + safezoneY;
			w = 0.0902344 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "USEC_ChangeView = true; if(USEC_isometricView) then {USEC_isometricView = false} else {USEC_isometricView = true};";
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Select Type";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.0175 * safezoneH;
			colorText[] = {1,1,0,1};
			SizeEx = 0.03;
		};
	};
};

class USEC_BaseHQ : RscStandardDisplay
{
	idd = 50002;
	movingenable = 0;

	class Controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.3425 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.2625 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			SizeEx = 0.05;
			text = "Base Alpha";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.270703 * safezoneW;
			h = 0.0525 * safezoneH;
			colorText[] = {1,1,0,1};
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "Fuel";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.4825 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Supplies";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			text = "Personnel";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.535 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			text = "1000";
			x = 0.458984 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "500";
			x = 0.458984 * safezoneW + safezoneX;
			y = 0.4825 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1007: RscText
		{
			idc = 1007;
			text = "100";
			x = 0.458984 * safezoneW + safezoneX;
			y = 0.535 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "Defences";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2; USEC_SCRIPT_BuildMenuVM = [USEC_CurrentBase,'BaseDefences'] execVM '\usec_code\scripts\ui_baseBuild.sqf';";
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = "Fences";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2; USEC_SCRIPT_FenceMenuVM = [USEC_CurrentBase,'BaseFences'] execVM '\usec_code\scripts\ui_baseBuild.sqf';";
		};
		class RscButton_1604: RscButton
		{
			idc = 1604;
			text = "Buildings";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.40 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2; USEC_SCRIPT_BuildMenuVM = [USEC_CurrentBase,'BaseFacilities'] execVM '\usec_code\scripts\ui_baseBuild.sqf';";
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;
			text = "Remove";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.35 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2; USEC_SCRIPT_BuildMenuVM = [USEC_CurrentBase,'Remove'] execVM '\usec_code\scripts\ui_baseBuild.sqf';";
		};
	};
};

class USEC_LHAPlayerMenu : RscStandardDisplay
{
	idd = 50100;
	movingenable = 0;

	class Controls
	{
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit Menu";
			x = 0.428385 * safezoneW + safezoneX;
			y = 0.34875 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "LHA PLAYER MENU";
			x = 0.406901 * safezoneW + safezoneX;
			y = 0.3075 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		// Redundant button
		// class RscButton_1601: RscButton
		// {
		//	idc = 1601;
		//	text = "Report In";
		//	x = 0.428385 * safezoneW + safezoneX;
		//	y = 0.40375 * safezoneH + safezoneY; // + 0.055
		//	w = 0.128906 * safezoneW;
		//	h = 0.04125 * safezoneH;
		//	onButtonClick = "[[0,0,0],0] call fnc_USEC_PERS_ReportIn;";
		// };
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = "Set Time";
			x = 0.428385 * safezoneW + safezoneX; // + 0.055 + 0.080
			y = 0.40375 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2;createDialog 'USEC_TimeChange';";
		};

		//REMOVE IF NOT DESIRED MATT
/*		class RscButton_1604: RscButton
		{
			idc = 1604;
			text = "Disable Grass";
			x = 0.428385 * safezoneW + safezoneX;
			y = (0.40375 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "setTerrainGrid 50;";
		};
*/
		
		class RscButton_1606: RscButton
		{
			idc = 1606;
			text = "Kill Target";
			x = 0.428385 * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "missionStarter = 'mis_killInConvoy.sqf';publicVariable 'missionStarter';(ctrlParent (_this select 0)) closeDisplay 2;";
		};		
		
		class RscButton_1611: RscButton
		{
			idc = 1611;
			text = "Direct Action";
			x = 0.428385 * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "missionStarter = 'mis_directAction.fsm';publicVariable 'missionStarter';(ctrlParent (_this select 0)) closeDisplay 2;";
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;
			text = "Capture Target";
			x = 0.428385 * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "missionStarter = 'mis_captureInConvoy.sqf';publicVariable 'missionStarter';(ctrlParent (_this select 0)) closeDisplay 2;";
		};
		
/*		class RscButton_1606: RscButton
		{
			idc = 1606;
			text = "Kill Target";
			x = (0.428385  + 0.055 + 0.080) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "missionStarter = 'mis_killInConvoy.sqf';publicVariable 'missionStarter';(ctrlParent (_this select 0)) closeDisplay 2;";
		};
*/

		class RscButton_1607: RscButton
		{
			idc = 1607;
			text = "Clear Town";
			x = 0.428385 * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "missionStarter = 'mis_destroyCache.sqf';publicVariable 'missionStarter';(ctrlParent (_this select 0)) closeDisplay 2;";
		};

/*		class RscButton_1611: RscButton
		{
			idc = 1611;
			text = "Direct Action";
			x = (0.428385 + 0.055 + 0.080) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "missionStarter = 'mis_directAction.fsm';publicVariable 'missionStarter';(ctrlParent (_this select 0)) closeDisplay 2;";
		};
*/

		class RscButton_1608: RscButton
		{
			idc = 1608;
			text = "Rescue Pilot";
			x = 0.428385 * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "missionStarter = 'mis_rescuePilot.sqf';publicVariable 'missionStarter';(ctrlParent (_this select 0)) closeDisplay 2;";
		};
		class RscButton_1609: RscButton
		{
			idc = 1609;
			text = "Infiltrate Mission";
			x = 0.428385 * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "missionStarter = 'mis_infiltrateTown.sqf';publicVariable 'missionStarter';(ctrlParent (_this select 0)) closeDisplay 2;";
		};
		class RscButton_1610: RscButton
		{
			idc = 1610;
			text = "Defend Location";
			x = 0.428385 * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.128906 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "missionStarter = 'mis_defendHill.sqf';publicVariable 'missionStarter';(ctrlParent (_this select 0)) closeDisplay 2;";
		};
	};
};

class USEC_TrainingMenu : RscStandardDisplay
{
	idd = 50101;
	movingenable = 0;

	class Controls
	{
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit Menu";
			x = 0.406901 * safezoneW + safezoneX;
			y = 0.34875 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "TRAINING COURSE MENU";
			x = 0.406901 * safezoneW + safezoneX;
			y = 0.3075 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Basic Driving Crouse";
			x = 0.406901 * safezoneW + safezoneX;
			y = 0.40375 * safezoneH + safezoneY; // + 0.055
			w = 0.171875 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2;null = [] execVM '\usec_code\training\driving_assessment.sqf';";
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "Basic Navigation Course";
			x = 0.406901 * safezoneW + safezoneX;
			y = (0.40375 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.171875 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2;null = [] execVM '\usec_code\training\nav_assessment.sqf';";
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = "Basic Parachute Course";
			x = 0.406901 * safezoneW + safezoneX;
			y = (0.40375 + (0.055 * 2)) * safezoneH + safezoneY; // + 0.055
			w = 0.171875 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2;null = [] execVM '\usec_code\training\parachute_assessment.sqf';";
		};

		class RscButton_1604: RscButton
		{
			idc = RscButton_1604;
			text = "Basic Helicopter Flight Exam";
			x = 0.406901 * safezoneW + safezoneX;
			y = (0.40375 + (0.055 * 3)) * safezoneH + safezoneY; // + 0.055
			w = 0.171875 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2;null = [] execVM '\usec_code\training\heli_assessment.sqf';";
		};
	};
};

class USEC_TrainingResult : RscStandardDisplay
{
	idd = 50018;
	movingenable = 0;

	class Controls
	{
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "TITLE";
			x = 0.285156 * safezoneW + safezoneX;
			y = 0.2525 * safezoneH + safezoneY;
			w = 0.415365 * safezoneW;
			h = 0.04125 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Score";
			x = 0.299479 * safezoneW + safezoneX;
			y = 0.3075 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.0275 * safezoneH;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Result";
			x = 0.299479 * safezoneW + safezoneX;
			y = 0.34875 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.0275 * safezoneH;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "x / x";
			x = 0.363932 * safezoneW + safezoneX;
			y = 0.3075 * safezoneH + safezoneY;
			w = 0.0844531 * safezoneW;
			h = 0.0275 * safezoneH;
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "PASS";
			x = 0.363932 * safezoneW + safezoneX;
			y = 0.34875 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.0275 * safezoneH;
		};
		class RscStructuredText_1101: RscStructuredText
		{
			idc = 1101;
			text = "The USEC Basic Marksman Shoot measures your ability at firing your weapon.  Make sure you listen to the instructions carefully.  Do not leave the firing area or your result will not count.\n\nFor more information view the appropriate tutorials or post your questions in the forums.\n\nYou must hit 75% of the targets to pass.  If you hit 100% of the targets you receive a superior pass and a Bronze Star.";
			x = 0.478516 * safezoneW + safezoneX;
			y = 0.3075 * safezoneH + safezoneY;
			w = 0.236328 * safezoneW;
			h = 0.4125 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
			class Attributes
			{
				font = "Zeppelin32";
				color = "#e0d8a6";
				align = "left";
				shadow = 1;
			};
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Close";
			x = 0.636068 * safezoneW + safezoneX;
			y = 0.72 * safezoneH + safezoneY;
			w = 0.078776 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
	};
};

class USEC_BarracksHQ : RscStandardDisplay
{
	idd = 50002;
	movingenable = 0;

	class Controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			x = 0.303125 * safezoneW + safezoneX;
			y = 0.3425 * safezoneH + safezoneY;
			w = 0.39375 * safezoneW;
			h = 0.2625 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			SizeEx = 0.05;
			text = "Base Alpha";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.270703 * safezoneW;
			h = 0.0525 * safezoneH;
			colorText[] = {1,1,0,1};
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Personnel";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			text = "Capacity";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.4825 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			text = "0";
			x = 0.458984 * safezoneW + safezoneX;
			y = 0.43 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscText_1006: RscText
		{
			idc = 1006;
			text = "0";
			x = 0.458984 * safezoneW + safezoneX;
			y = 0.4825 * safezoneH + safezoneY;
			w = 0.123047 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,1,1};
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class RscButton_1602: RscButton
		{
			idc = 1603;
			text = "Assign";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.5 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[(group player),USEC_CurrentBase] call fnc_USEC_PERS_AddSoldier;";
		};
		class RscButton_1603: RscButton
		{
			idc = 1604;
			text = "Return";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = ";";
		};
		class RscButton_1604: RscButton
		{
			idc = 1605;
			text = "Report In";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.45 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "[(position player),USEC_RegionID] call fnc_USEC_PERS_ReportIn;";
		};
	};
};

class USEC_LogisticsEquip : RscStandardDisplay
{
	idd = 50015;
	movingenable = 0;
	class controlsBackground {
	};
	class Controls
	{
		class RscListbox_1500: RscListbox // Personal Inventory Box (From Gear)
		{
			idc = 1500;
			x = 0.121 * safezoneW + safezoneX; // New alignment for Personal Inventory
			// x = 0.277995 * safezoneW + safezoneX; // Old alignment for Personal Inventory
			y = 0.3025 * safezoneH + safezoneY;
			w = 0.25 * safezoneW; // New size for Personal Inventory
			// w = 0.143229 * safezoneW; // Old Size for Personal Inventory
			h = 0.5065 * safezoneH;
			colorBackground[] = {0.2,0.2,0.2,1};
			onLBSelChanged = "[1500] spawn fnc_usec_ui_logistics_lbSelect;";
		};
		class RscListbox_1501: RscListbox // Pool Inventory Box (From Mother)
		{
			idc = 1501;
			x = 0.628776 * safezoneW + safezoneX;
			y = 0.3025 * safezoneH + safezoneY;
			w = 0.25 * safezoneW; // New size for Pool Inventory
			// w = 0.143229 * safezoneW; // Old size for Pool Inventory
			h = 0.5065 * safezoneH;
			onLBSelChanged = "[1501] spawn fnc_usec_ui_logistics_lbSelect;";
		};
		class RscText_1000: RscText // Equipment Text and background box
		{
			idc = 1000;
			text = "Equipment Name";
			x = 0.378385 * safezoneW + safezoneX;
			y = 0.26125 * safezoneH + safezoneY;
			w = 0.243229 * safezoneW;
			h = 0.0275 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscText_10000: RscText // Bottom Line
		{
			idc = 10000;
			text = "";
			x = 0.121 * safezoneW + safezoneX;
			y = 0.82 * safezoneH + safezoneY;
			w = 0.757776 * safezoneW;
			h = 0.01 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscPicture_1200: RscPicture // unknown picture
		{
			idc = 1200;
			text = "";
			x = 0.428385 * safezoneW + safezoneX;
			y = 0.3025 * safezoneH + safezoneY;
			w = 0.143229 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "";
			x = 0.378385 * safezoneW + safezoneX;
			y = 0.44625 * safezoneH + safezoneY;
			w = 0.243229 * safezoneW;
			h = 0.11 * safezoneH;
			class Attributes
			{
				font = "Zeppelin32";
				color = "#e0d8a6";
				align = "left";
				shadow = 1;
			};
		};
		class RscButton_1600: RscButton // Add to Player button
		{
			idc = 1600;
			text = "<<<";
			x = 0.428385 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1501] spawn fnc_usec_ui_logistics_issue;";
		};
		class RscButton_12006: RscButton // Add Ammo to Player
		{
			idc = 12006;
			text = "Take Selected Ammo";
			x = 0.428385 * safezoneW + safezoneX;
			y = 0.781 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.030 * safezoneH;
			onButtonClick = "[12005] spawn fnc_usec_ui_logistics_issue;";
		};
		class RscButton_1601: RscButton // Remove from Player button
		{
			idc = 1601;
			text = ">>>";
			x = 0.507161 * safezoneW + safezoneX;
			y = 0.55 * safezoneH + safezoneY;
			w = 0.0644531 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[player] call fnc_usec_ui_logistics_return;";
		};
		class RscButton_13000: RscButton // Rearm Button
		{
			idc = 13000;
			text = "Rearm Held Magazines";
			x = 0.155 * safezoneW + safezoneX;
			y = 0.835 * safezoneH + safezoneY;
			w = 0.18 * safezoneW;
			h = 0.030 * safezoneH;
			onButtonClick = "[] call fnc_usec_inv_reloadMags;";
		};
		class RscText_1001: RscText // Logistics text and background box
		{
			idc = 1001;
			text = "Logistics Menu";
			x = 0.414063 * safezoneW + safezoneX;
			y = 0.12 * safezoneH + safezoneY;
			w = 0.171875 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscPicture_1201: RscPicture // Unknown picture
		{
			idc = 1201;
			text = "";
			x = 0.464193 * safezoneW + safezoneX;
			y = 0.3025 * safezoneH + safezoneY;
			w = 0.0716146 * safezoneW;
			h = 0.11 * safezoneH;
		};
		class RscButton_11000: RscButton // Pistol Button
		{
			idc = 11000;
			text = "Pistols";
			x = 0.298 * safezoneW + safezoneX;
			y = 0.1925 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1501,'Pistol','new'] spawn fnc_usec_ui_logistics_lbBase";
		};
		class RscButton_11001: RscButton // Rifles Button
		{
			idc = 11001;
			text = "Rifles";
			x = 0.381 * safezoneW + safezoneX;
			y = 0.1925 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1501,'Rifle','new'] spawn fnc_usec_ui_logistics_lbBase";
		};
		class RscButton_11002: RscButton
		{
			idc = 11002;
			text = "Launchers";
			x = 0.464 * safezoneW + safezoneX; // Centered button. For further buttons, with spacing -0.083 to go left, +0.083 to go right.
			y = 0.1925 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1501,'Launcher','new'] spawn fnc_usec_ui_logistics_lbBase";
		};
		class RscButton_11003: RscButton
		{
			idc = 11003;
			text = "Misc";
			x = 0.547 * safezoneW + safezoneX;
			y = 0.1925 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1501,'Misc','new'] spawn fnc_usec_ui_logistics_lbBase";
		};
		class RscButton_11004: RscButton
		{
			idc = 11004;
			text = "Ammo";
			x = 0.63 * safezoneW + safezoneX;
			y = 0.1925 * safezoneH + safezoneY;
			w = 0.073 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "[1501,'Mags','new'] spawn fnc_usec_ui_logistics_lbBase";
		};
		class RscListbox_12005: RscListbox // Ammo Display
		{
			idc = 12005;
			text = "";
			x = 0.378385 * safezoneW + safezoneX;
			y = 0.615 * safezoneH + safezoneY;
			w = 0.243229 * safezoneW;
			h = 0.15 * safezoneH;
			onLBSelChanged = "[12005] spawn fnc_usec_ui_logistics_lbSelect;";
		};
		class RscButton_1602: RscButton // Close Button
		{
			idc = 1602;
			text = "Close";
			x = 0.822 * safezoneW + safezoneX;
			y = 0.1925 * safezoneH + safezoneY;
			w = 0.055 * safezoneW;
			h = 0.055 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class RscText_1002: RscText // Personal Inventory text and background
		{
			idc = 1002;
			text = "Personal Inventory";
			x = 0.121 *safezoneW + safezoneX; // New alignment for Personal Inventory text
			// x = 0.277995 * safezoneW + safezoneX; // Old alignment for Personal Inventory text
			y = 0.26125 * safezoneH + safezoneY;
			w = 0.25 * safezoneW; // New size for Personal Inventory text
			// w = 0.143229 * safezoneW; // Old size for Personal Inventory text
			h = 0.0275 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
		class RscText_1003: RscText // Pool Inventory text and background
		{
			idc = 1003;
			text = "Pool Inventory";
			x = 0.628776 * safezoneW + safezoneX;
			y = 0.26125 * safezoneH + safezoneY;
			w = 0.25 * safezoneW; // New size for Pool Inventory text
			// w = 0.143229 * safezoneW; // Old size for Pool Inventory text
			h = 0.0275 * safezoneH;
			colorBackground[] = {0,0,0,1};
		};
	};
};

class USEC_BaseBuild : RscStandardDisplay
{
	idd = 50003;
	movingenable = 0;
	class controlsBackground
	{
		class MouseCheck : RscActiveText  {
			idc = -1;
			style = 48;
			x = SafeZoneX;
			y = SafeZoneY;
			w = safezoneW;
			h = safezoneH;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {0, 0, 0, 0};
			colorActive[] = {0, 0, 0, 0};
			onMouseMoving = "USEC_MousePos = [(_this select 1),(_this select 2)];";
			onMouseZChanged = "USEC_MouseWheel = _this select 1;";
			onMouseButtonDown = "USEC_MouseButtonDown = true; USEC_MouseButton = _this;";
			onMouseButtonUp = "USEC_MouseButtonDown = false;";
		};
	};
	class Controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Base Alpha Building Construction";
			x = 0.245703 * safezoneW + safezoneX;
			y = 0.1675 * safezoneH + safezoneY;
			w = 0.508594 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,0,1};
			colorBackground[] = {0,0,0,0.5};
			SizeEx = 0.05;
		};
		class RscText_2001: RscText
		{
			idc = 2001;
			text = "Supplies: 0";
			x = 0.245703 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.508594 * safezoneW;
			h = 0.035 * safezoneH;
			SizeEx = 0.03;
		};
		class RscText_2002: RscText
		{
			idc = 2002;
			text = "Personnel: 0";
			x = 0.245703 * safezoneW + safezoneX + 0.2;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.508594 * safezoneW;
			h = 0.035 * safezoneH;
			SizeEx = 0.03;
		};
		class RscText_2003: RscText
		{
			idc = 2003;
			text = "Fuel: 0";
			x = 0.245703 * safezoneW + safezoneX + 0.4;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.508594 * safezoneW;
			h = 0.035 * safezoneH;
			SizeEx = 0.03;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit";
			x = 0.655859 * safezoneW + safezoneX;
			y = 0.7975 * safezoneH + safezoneY;
			w = 0.0902344 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			text = "asdas";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.155859 * safezoneW;
			h = 0.21 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
			onLBSelChanged = "USEC_Selection = false;USEC_SCRIPT_BuildSelectVM = [] execVM '\usec_code\scripts\ui_baseBuild_updateLB.sqf';";
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.573828 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.2975 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Switch View";
			x = 0.655859 * safezoneW + safezoneX;
			y = 0.5175 * safezoneH + safezoneY;
			w = 0.0902344 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "USEC_ChangeView = true; if(USEC_isometricView) then {USEC_isometricView = false} else {USEC_isometricView = true};";
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Supplies: 200";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.0175 * safezoneH;
			SizeEx = 0.03;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Select Type";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.0175 * safezoneH;
			colorText[] = {1,1,0,1};
			SizeEx = 0.03;
		};
		class RscText_1003: RscText
		{
			idc = 1003;
			text = "Fuel: 100";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.0175 * safezoneH;
			SizeEx = 0.03;
		};
		class RscText_1004: RscText
		{
			idc = 1004;
			text = "Personnel: 50";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.325 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.0175 * safezoneH;
			SizeEx = 0.03;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "Please select an item to construct from the list below.";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.36 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.138056 * safezoneH;
			Size = 0.03;
			class Attributes
			{
				font = "Zeppelin32";
				color = "#e0d8a6";
				align = "left";
				shadow = 1;
			};
		};
	};
};

class USEC_TimeChange : RscStandardDisplay
{
	idd = 50014;
	movingenable = 0;
	class Controls
	{
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Enter new time of day";
			x = 0.423437 * safezoneW + safezoneX;
			y = 0.399167 * safezoneH + safezoneY;
			w = 0.130209 * safezoneW;
			h = 0.03875 * safezoneH;
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = "1245";
			x = 0.451041 * safezoneW + safezoneX;
			y = 0.456666 * safezoneH + safezoneY;
			w = 0.0682295 * safezoneW;
			h = 0.0508334 * safezoneH;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Set";
			x = 0.434896 * safezoneW + safezoneX;
			y = 0.533333 * safezoneH + safezoneY;
			w = 0.105729 * safezoneW;
			h = 0.0416667 * safezoneH;
			onButtonClick = "[] call fnc_usec_setTime;";
		};
	};
};

class USEC_FieldRepair : RscStandardDisplay
{
	idd = 50016;
	movingenable = 0;
	class controlsBackground
	{
	};
	class Controls
	{
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Repair Vehicle Component";
			x = 0.385417 * safezoneW + safezoneX;
			y = 0.3625 * safezoneH + safezoneY;
			w = 0.24349 * safezoneW;
			h = 0.0275 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			x = 0.385417 * safezoneW + safezoneX;
			y = 0.40375 * safezoneH + safezoneY;
			w = 0.0859375 * safezoneW;
			h = 0.1375 * safezoneH;
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			x = 0.485677 * safezoneW + safezoneX;
			y = 0.40375 * safezoneH + safezoneY;
			w = 0.136068 * safezoneW;
			h = 0.1375 * safezoneH;
			onLBSelChanged = "call fnc_usec_ui_fieldRepairLb;";
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Cancel";
			x = 0.385417 * safezoneW + safezoneX;
			y = 0.56875 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0275 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2;";
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Repair";
			x = 0.514323 * safezoneW + safezoneX;
			y = 0.56875 * safezoneH + safezoneY;
			w = 0.114583 * safezoneW;
			h = 0.0275 * safezoneH;
			onButtonClick = "[] spawn code_usec_ui_fieldRepairAction;";
		};
	};
};

class USEC_BaseFence : RscStandardDisplay
{
	idd = 50004;
	movingenable = 0;
	class controlsBackground
	{
		class MouseCheck : RscActiveText  {
			idc = -1;
			style = 48;
			x = SafeZoneX;
			y = SafeZoneY;
			w = safezoneW;
			h = safezoneH;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			color[] = {0, 0, 0, 0};
			colorActive[] = {0, 0, 0, 0};
			onMouseMoving = "USEC_MousePos = [(_this select 1),(_this select 2)];";
			onMouseZChanged = "USEC_MouseWheel = _this select 1;";
			onMouseButtonDown = "USEC_MouseButtonDown = true; USEC_MouseButton = _this;";
			onMouseButtonUp = "USEC_MouseButtonDown = false;";
		};
	};
	class Controls
	{

		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Base Alpha Fence Construction";
			x = 0.245703 * safezoneW + safezoneX;
			y = 0.1675 * safezoneH + safezoneY;
			w = 0.508594 * safezoneW;
			h = 0.035 * safezoneH;
			colorText[] = {1,1,0,1};
			colorBackground[] = {0,0,0,0.5};
			SizeEx = 0.05;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit";
			x = 0.655859 * safezoneW + safezoneX;
			y = 0.7975 * safezoneH + safezoneY;
			w = 0.0902344 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};
		class RscListbox_1500: RscListbox
		{
			idc = 1500;
			text = "asdas";
			x = 0.590234 * safezoneW + safezoneX;
			y = 0.57 * safezoneH + safezoneY;
			w = 0.155859 * safezoneW;
			h = 0.21 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.5};
			onLBSelChanged = "USEC_Selection = false;USEC_SCRIPT_BuildSelectVM = [] execVM '\usec_code\scripts\ui_baseFence_updateLB.sqf';";
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(0,0,0,0.5)";
			x = 0.573828 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.065625 * safezoneW;
			h = 0.2975 * safezoneH;
		};
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Switch View";
			x = 0.655859 * safezoneW + safezoneX;
			y = 0.5175 * safezoneH + safezoneY;
			w = 0.0902344 * safezoneW;
			h = 0.035 * safezoneH;
			onButtonClick = "USEC_ChangeView = true; if(USEC_isometricView) then {USEC_isometricView = false} else {USEC_isometricView = true};";
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Supplies: 200";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.255 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.0175 * safezoneH;
			SizeEx = 0.03;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Select Type";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.22 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = 0.0175 * safezoneH;
			colorText[] = {1,1,0,1};
			SizeEx = 0.03;
		};
		class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "Please select an item to construct from the list below.";
			x = 0.647656 * safezoneW + safezoneX;
			y = 0.29 * safezoneH + safezoneY;
			w = 0.106641 * safezoneW;
			h = ((0.138056 * 2) + 0.0175) * safezoneH;
			Size = 0.03;
			class Attributes
			{
				font = "Zeppelin32";
				color = "#e0d8a6";
				align = "left";
				shadow = 1;
			};
		};
	};
};

class USEC_WeatherControl : RscStandardDisplay
{
	idd = 70010;
	movingenable = 0;
	class Controls
	{
	class RscStructuredText_1100: RscStructuredText
		{
			idc = 1100;
			text = "Weather Menu";
			x = (0.428385 + 0.0010)  * safezoneW + safezoneX;
			y = 0.3075 * safezoneH + safezoneY;
			w = 0.135 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {-1,-1,-1,0};
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Exit Menu";
			x = 0.428385 * safezoneW + safezoneX;
			y = 0.34875 * safezoneH + safezoneY;
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "(ctrlParent (_this select 0)) closeDisplay 2";
		};		
		class RscButton_1601: RscButton
		{
			idc = 1601;
			text = "Clear";
			x = (0.428385 - 0.070) * safezoneW + safezoneX;
			y = 0.40375 * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[1] spawn fnc_usec_weather;";
		};
		class RscButton_1602: RscButton
		{
			idc = 1602;
			text = "Dynamic";
			x = (0.428385 + 0.070) * safezoneW + safezoneX;
			y = 0.40375 * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[0] spawn fnc_usec_weather;";
		};
		class RscButton_1603: RscButton
		{
			idc = 1603;
			text = "Light Cloud";
			x = (0.428385 - 0.070 - 0.070 - 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[2] spawn fnc_usec_weather;";
		};
		class RscButton_1604: RscButton
		{
			idc = 1604;
			text = "Medium Cloud";
			x = (0.428385 - 0.070 - 0.070 - 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[3] spawn fnc_usec_weather;";
		};
		class RscButton_1605: RscButton
		{
			idc = 1605;
			text = "Heavy Cloud";
			x = (0.428385 - 0.070 - 0.070 - 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[4] spawn fnc_usec_weather;";
		};
		class RscButton_1606: RscButton
		{
			idc = 1606;
			text = "Light Rain";
			x = (0.428385 - 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[5] spawn fnc_usec_weather;";
		};
		class RscButton_1607: RscButton
		{
			idc = 1607;
			text = "Medium Rain";
			x = (0.428385 - 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[6] spawn fnc_usec_weather;";
		};
		class RscButton_1608: RscButton
		{
			idc = 1607;
			text = "Heavy Rain";
			x = (0.428385 - 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[7] spawn fnc_usec_weather;";
		};
		class RscButton_1609: RscButton
		{
			idc = 1609;
			text = "Med Rain/Poor Vis";
			x = (0.428385 + 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[8] spawn fnc_usec_weather;";
		};
		class RscButton_1610: RscButton
		{
			idc = 1610;
			text = "Hvy Rain/Low Vis";
			x = (0.428385 + 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[9] spawn fnc_usec_weather;";
		};
		class RscButton_1611: RscButton
		{
			idc = 1611;
			text = "Hvy Rain/V.Low Vis";
			x = (0.428385 + 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[10] spawn fnc_usec_weather;";
		};
		class RscButton_1612: RscButton
		{
			idc = 1612;
			text = "Light Fog";
			x = (0.428385 + 0.070 + 0.070 + 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[11] spawn fnc_usec_weather;";
		};
		class RscButton_1613: RscButton
		{
			idc = 1613;
			text = "Medium Fog";
			x = (0.428385 + 0.070 + 0.070 + 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[12] spawn fnc_usec_weather;";
		};
		class RscButton_1614: RscButton
		{
			idc = 1614;
			text = "Heavy Fog";
			x = (0.428385 + 0.070 + 0.070 + 0.070) * safezoneW + safezoneX;
			y = (0.40375 + 0.055 + 0.055 + 0.055 + 0.055) * safezoneH + safezoneY; // + 0.055
			w = 0.135 * safezoneW;
			h = 0.04125 * safezoneH;
			onButtonClick = "[13] spawn fnc_usec_weather;";
		};
	};
};
