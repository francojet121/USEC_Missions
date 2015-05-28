/*--------------------------------------------------------------------
  Author: Unity Security Force

  description_info.hpp
  Part of description.ext - Mission description and information
--------------------------------------------------------------------*/

// Author
author = "K.Krause";

// Mission name
briefingName = "USEC - Betelgeuse"; // in mission select menu
onLoadName = "USEC - Betelgeuse"; // on load screen

// Picture shown
overviewPicture = "usec_resources\images\USEC\preview_orbat.paa"; // in mission select menu
loadScreen = "usec_resources\images\USEC\preview_orbat.paa"; // on load screen

// Mission description
overviewText = "USEC forces mount a rescue."; // in mission select menu
onLoadMission = "USEC forces mount a rescue."; // on load screen

/////////////////////////////////////////////////////////////////////////////////////////
// NUKE RELATED STUFF
/////////////////////////////////////////////////////////////////////////////////////////
class CfgMusic {
    tracks[] = {nuke};
    class nuke {
        name = "";
        sound[] = {"nuke\nuke.ogg", db+0, 1.0};
    };	
};
/////////////////////////////////////////////////////////////////////////////////////////
