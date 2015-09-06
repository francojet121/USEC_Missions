//////////////////////////////////////////////////////////////////
//                 How to use. 
// 1. Place a popup target and name it to pt1 
// 2. copy it 8 times and it will auto name the targets
// 3. place this line in a trigger or init  nul=[] execVM "popup.sqf" 
 
_inc     = 0;
_count   = 0;
_targets = [t1,t2,t3,t4,t5,t6,t7,t8,t9,t10,t11,t12,t13,t14,t15,t16];
_fronts  = [f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12];
_many    =  count _targets;
nopop=true;
{_x  animate["terc",1]} forEach _targets;

hint "Setting up the Range";
{_x animate["terc",1]} forEach _fronts;
sleep 5;
hint "Standby";
sleep 2;
hint "Begin";

while {_inc<20} do 
{
_rnumber = floor(random _many);
_rtarget = _targets select _rnumber;
_rtarget animate["terc", 0];
sleep 3;
 if (_rtarget animationPhase "terc" > 0.1) then
{
		_count = _count+1;
		    };
   hint format ["Targets :%1 Hit :%2",_inc+1,_count];
_rtarget animate["terc", 1];
_inc = _inc + 1;
};
sleep 8;
hint "Session Complete";
{_x animate["terc",0]} forEach _fronts;