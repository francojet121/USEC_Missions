broadcast = "";

GlobalMsg =
{
        titleText [format ["%1",broadcast],"plain down",0.1];
        broadcast = "";
};

for [{_loop=0}, {_loop<1}, {_loop=_loop}] do
{       
        sleep 0.1;
        if (broadcast != "") then {[] call GlobalMsg};
};
