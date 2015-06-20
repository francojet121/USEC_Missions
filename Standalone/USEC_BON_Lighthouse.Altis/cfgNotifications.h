class CfgNotifications
{
	class AwayMission
	{
		title = "NEW AWAY MISSION";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		description = "%1";
		priority = 9;
	};
	
	
	class WaveStart
	{
		title = "WAVE STARTED";
		iconText = "%1";
		description = "Prepare for the onslaught";
		color[] = {1,1,1,1};
		priority = 10;
	};
	
	class WaveComplete
	{
		title = "WAVE COMPLETED";
		iconText = "%1";
		description = "<t size='0.75'>Take a breather <br />LOL JK, Go loot like it's a riot</t>";
		color[] = {1,1,1,1};
		priority = 10;
	};
};