seconds=0;
minutes=0;
mintext = "minute";
sectext = "second";
runStopwatch = true;

while {runStopwatch} do
{
        if (minutes > 0) then {broadcast = format["%1 %2 %3 %4",minutes,mintext,seconds,sectext]} else {broadcast = format["%1 %2",seconds,sectext]};
        publicVariable "broadcast";
        sleep 0.1;
        if (seconds > 59.9) then {minutes = minutes + 1; seconds = 0;} else {seconds = seconds + 0.1};
        if (minutes > 1) then {mintext = "minutes"};
        if (seconds > 1) then {sectext = "seconds"} else {sectext ="second"};
};