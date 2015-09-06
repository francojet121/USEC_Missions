
Status: NOT ACTIVE

*** Stopwatch Script ***

(Web Address)
http://www.cartoongenerals.com/main/index.php?/topic/4545-arma-3-mission-creation-and-scripting-resources/


-Found this code for Arma 2, modified it to work for Arma 3 and added 
a bit (messages now include minutes when seconds lapse over 60). 
This will show a visible timer on the bottom center of the screen.

-You need to add the following to your player's INIT line: client = [] execVM "client.sqf";
Second the following to a trigger you want to activate the timer: timer = [] execVM "stopwatch.sqf";

-runStopwatch=false;
if (minutes > 0) then {broadcast=format["%1 took %2 %3 and %4 %5", this, minutes, mintext, seconds, sectext]} else {broadcast=format["%1 took %2 second(s)", this, seconds]};
publicVariable "broadcast";

