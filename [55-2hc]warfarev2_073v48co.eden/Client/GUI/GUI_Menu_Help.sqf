private ["_action"];
disableSerialization;
_action = _this select 0;

switch (_action) do {
	case "onLoad": {
		{((findDisplay 508000) displayCtrl 160001) lbAdd _x} forEach ["Introduction", "Respawn", "Towns", "Base Structures and Functions", "About the Mission","Server Rules"];
		((findDisplay 508000) displayCtrl 160001) lbSetCurSel 0;
	};
	case "onHelpLBSelChanged": {
		_changeTo = _this select 1;
_helps = [
//-------------------------------------Introductions
"<t size='1.4' color='#2394ef' underline='true'>Introduction</t><br />
<br />
<br />
<br />
<t><t color='#ffec1c'>CTI</t> (<t color='#ffec1c'>Conquer The Island</t>) is a gamemode where two sides, West and East fight for the control of an island.</t><br />
<br />
Each side are led by a <t color='#e8bd12'>Commander</t> which may construct a base thanks to the <t color='#e8bd12'>MHQ</t>.<br />
<br />
As soon as the base is available, you may decide to reinforce your team by purchasing additional units and vehicles.<br />
<br />
Keep in mind that the <t color='#e8bd12'>Commander</t> may assign assign different tasks to your team.<br />
<br />
According to mission parameters there are several conditions under which game can be won: standardparameter is 'towns', <br />
which means you have to capture a certain number of towns to win the game. <br />
<br />
<br />
For optional victory-conditions, check parameters <br />
(e.g: 'annihilation' = all enemy forces and structures have to be destroyed).<br />
<br />
",
//----------------------------------------RESPAWN
"<t size='1.4' color='#2394ef' underline='true'>Respawn</t><br />
<br />
<br />
<t size='1.2' color='#ffec1c' align='left'>Respawnpoints:</t><br />
<br />
<br />
Generally respawnpoints are displayed as yellow circles on the map, which you see during your respawntime.<br />
<br />
These locations can be chosen by clicking on the circle. There are certain objects which establish spawn-locations:<br />
<br />
MEVs (an ambulance-vehicle is included in the set of vehicles you have from beginning or several vehicles can be purchased for purpose of spawning in light factory, heavy factory or air factory).<br />
<br />
MEV-spawns are limited in range (max is 500m), where they provide 'spawnability', that means if you die more than 500m away from these objects, you have to spawn at an unlimited spawnpoint.<br />
<br />
Spawnpoints of unlimited range are any buildings of base, except servicepoint, command center and anti-airradar.<br />
<br />
Spawnbuldings: <br />
MHQ, Baracks [B],Light-Factory [LF], Heavy-Factory [HF], Air-Factory [AF]).<br />
You can spawn there, no matter where you die on map.<br />
<br />
<br />
<br />
<t size='1.4' color='#2394ef' underline='true'>So:</t><br /><br />
be careful when you die and where you die. Always be aware of your spawn-locations. <br />
It might save time, if you wait with the attack on a town untill spawn is established. <br />
An existing spawnpoint prevents players from having to travel all the way from base to town over and over again.<br />

",
//--------------------------------------------------Towns
"<t size='1.4' color='#2394ef' underline='true'>Towns</t><br />
<br />
<br />
<br />
As mentioned above it is goal of the game to capture a number of towns. Each of these towns is represented by a big circle (500m radius) on the map.<br />
<br />
There are several states a town can have, indicated by colour markings. Towns which can be captured have a blue or red marking in a 400m-radius around the center. These towns are adjacent to the territory already occupied by one side. <br />
<br />
Towns with a hatched yellow marking in a 600m radius are also not capturable, because enemy captured it recently and it is in so called 'peace-time' (details see below). When you start an attack on a town (with orange 400m-radius), notice that the defending units first spawn, when a friendly unit crosses the 600m-radius. So pay attention when crossing the line.<br />
<br />
<br />
The relevant buildings of a town are the depot (town-center) in the center of the circle, surrounded by a 50m-radius of slightly darker colour marking. More over a town can have one or more strongpoints (SPs, small cylinders on map).<br />
<br />
You have to capture these SPs (notice counter 'strongpoint'), before you advance to the towncenter and finally capture the town by creating numerical superiority within the 50m radius of towncenter (notice counter 'town').<br />
<br />
Once a town is captured it will switch its colour marking to hatched green 600m-radius. Next to towncenter, a supplyvalue (SV) is displayed, e.g. 10/70. This SV can be increased by sending supplytrucks between MHQ or servicepoint (for reload) and the 50m-radius of towncenter. <br />
<br />
A fully 'pushed' town creates a higher income of supplies and money for the <br />
commander and if town is attacked, there will spawn more and better units to defend it. <br />
<br />
<br />
Most of explanations refer to default parameters. If params are changed, some explanations are no longer valid. <br />
<br />
",
//------------------------------Base Structures
"<t size='1.4' color='#2394ef' underline='true'>Base Structures and Functions</t><br />
<br />
<br />
<br />
The Base Structures can be used for various purposes. <br />
As soon as the player is in range of a structure he may decide to purchase additional units or vehicles. <br />
<br />
<br />
<br />
<t size='1.2' color='#ffec1c' align='left'>Mobile-Headquarters [MHQ]</t><br />
<br />
Required to build base-structures.<br />
<br />
<t size='1.2' color='#ffec1c' align='left'>CommandCenter [CC]</t><br />
<br />
For players: >>WF-Menu Purchase Units (remote enabled)/ Tactical Center to order UAVs, Ammodrops,Arty, etc.<br />
for commander: >>WF-Menu Economy to sell Base-Structures and distribution income / Command Center to set Orders and Sqad-Respawn/ Upgrade-Menu to Make Upgrades for better equipment.<br />
<br />
<t size='1.2' color='#ffec1c' align='left'>Barracks [B]</t><br />
<br />
>>WF-Menu Purchase Gear (when player is in range of 120m)<br />
>>WF-Menu Purchase Units (normally in range of 120m - if Command Center exists, infantry can be purchased remote)<br />
- alternatively it is possible to purchase gear at the stairs of  captured towncenters.<br />
<br />
<t size='1.2' color='#ffec1c' align='left'>Light-Factory [LF]</t><br />
<br />
>>WF-Menu Purchase Units (normally in range of 120m - if Command Center exists, light vehicles can be purchased remote)<br />
- alternatively it is possible to purchase simple vehicles at the stairs of captured towncenters.<br />
<br />
<t size='1.2' color='#ffec1c' align='left'>Heavy-Factory [HF]</t><br />
<br />
>>WF-Menu Purchase Units (normally in range of 120m - if Command Center exists, Tanks can be purchased remote)<br />
<br />
<t size='1.2' color='#ffec1c' align='left'>Air-Factory [AF]</t><br />
<br />
>>WF-Menu Purchase Units (normally in range of 120m - if Command Center exists, helicopters can be purchased remote)<br />
notice: airplanes can be purchased at hangars (displayed with a green symbol at airfields on map), if airfactory exists.<br />
<br />
<t size='1.2' color='#ffec1c' align='left'>Anti-Air-Radar [AA]</t><br />
Displays Enemy aircraft which fly about 30 meters on the map. (Red diamond icon) <br />
<br />
<br />
<t size='1.2' color='#ffec1c' align='left'>Servicepoint</t><br />
<br />
Reload and Refuel Supplytrucks.<br />
>>WF-Menu Servicepoint to Rearm, Refuel, Repair your Vehicle and Heal yourself and your units.<br />
<br />
<br />
<br />
<br />
You may choose to buy a vehicle manned or empty (you may also buy a vehicle without a driver, gunner, commander or turrets and you can choose whether locked or  unlocked ).<br />
<br />
Usefull Fast Commands From Construction Menu:<br />
- Auto Wall Construction Mode -> custom action 14<br />
- Auto Manning Defence Mode -> custom action 16<br />
- Sell Fortification, Static Defence -> custom action 17<br />
<br />
",
//--------------------WarFare Info
"<br />
<t size='1.2' color='#2394ef' align='center'>Warfare WASP-AWESOME EDITION | v48 | - CO - Everon 1.01</t><br />
<t align='center'>
<br />
<br />
<br />
<img size='8' image='Textures\logo1.paa'/>
<br/>
<br/>
-The Everon is currently at version 48
<br/>
<br/>
-This is not the original version of Benny!
<br/>
-The original was created by Benny.
<br/>
-Big thanks to him!
<br/>
<br/>
<br/>
Changelog (48): <br/>
- Added max limit parameter in mission list of parameters (default 40000)
- Added an unique mark on map for salvage trucks <br/>
- Added yellow marks for friendly ambulance on map <br/>
- Fixed often calls to db with updating of current match round <br/>
- Fixed crew(in tanks, apcs) vulnerability from HE rounds <br/>
- Added nvg for opfor bots <br/>
- Added fast key description in help menu (Base Structures section) for construction menu <br/>
- Added small resistance bases (only barracks) that randomly appear on map <br/>
- Decreased amount of bots for player from 16 to 10 in parameter list <br/>
- Added HC support for static defence on bases and in res rowns <br/>
- Added dynamic defender resp in town according current upgrade level on team side <br/>
- Added Persistance DB support <br/>
- Added switcher to enable/disable auto wall construction around base structures (user/custom action 14)<br/>
- Enabled friendly ai tacking on map<br/>
Changelog (47): <br/>
- Added item's cleaners and their settings in parameter list (GLOBAL section); <br/>
- Added a message of what upgrade was started in team of player; <br/>
- Added a restriction to build structures, statics and fortifications on base of an enemy team is around (250m radius); <br/>
- Removed Artillery Computer from parameter list;<br/>
- Fixed rocket glitch of AT missiles; <br/>
- Added feature to assign a new commander without voting (works only for current commanders in teams); <br/>
- Fixed set of script errrors on server and client sides; <br/>
- Added logginf for money transfer, commander's voting; <br/>
- Fixed HE shells of the 30mm cannons <br/>
- Fixed Reflex for T90. Fast reloading time <br/>
- Fixed TOW from ERA-Bradley is too powerfull <br/>
- Fixed Players who leave stay at the map with their Icon <br/>
- Fixed Some Upgrades at Blufor costs money <br/>
- Fixed Selling factories gives 100% supplys back <br/>
- Max suppluy limit is 50000 <br/>
- Fixed mine bug <br/>
- Added camos for btr60 and opf t34 <br/>
- Removed tanks from start vehicles <br/>
- Decreased damage for structures by shilka and tunga <br/>
<br/>
<br/>
<br/>
",
//--------------------Server Rules
"<t size='1.4' color='#2394ef' underline='true'>SERVER RULES</t><br />
<br />
<br />
<br />
The following penalty scale represents the maximum penalty admins may give for breaching of rules: <br />
- Teamkilling, Stealing or destroying teammates property without compensation: 1) kick 2) !btk 1h ban 3) 2 weeks timeban <br />
- Intentional(attempted) HQ-Teamkill: 2 weeks timeban <br />
- Entering HQ without beeing commander: kick <br />
- Insults aiming at players real life: 1) warnings, 2) kick <br />
- Racism 1) kick 2) 2 weeks timeban <br />
- Bugusing*: 1) kick 2) 2 weeks timeban <br />
- Hacking: ban <br />
- Producing factories (B,LF,HF,AF) must have an entrance 1) warning 2) kick 3) 2 weeks timeban <br />
- You may not stack a WF-building (HQ,B,LF,HF,AF,S,C,AAR) inside enviroment objects to more than 50%.  1) warning 2) kick 3) 2 weeks timeban <br />
 <br/>
<br/>
<br/>"
];
		((findDisplay 508000) displayCtrl 160002) ctrlSetStructuredText parseText (_helps select _changeTo);
	};
};