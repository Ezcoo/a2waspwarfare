//--- Author [ICE]
player createDiaryRecord["Diary", ["Upgrades", "<br/>To be able to purchase higher levels of equipment or units, the factories need to be upgraded by the commander. The commander will need both cash and supply points to do this. He may ask for contributions from other team players to help out. Each factory has 3 levels."]];
player createDiaryRecord["Diary", ["Supplies", "<br/>Each captured town has an Actual and Potential Value. On the map you will see this represented as 2 numbers seperated by a / for example; Zelenogorsk, once captured will start as 30/120. This means that the current supplies to each player from this town is $30 per minute. Each time a supply truck arrives at the town depot its value will increase by 10. Remember though, the supply truck must be either fully loaded from the HQ or a Supply point or, have come from a town with a higher actual value. you will also receive 4 x the actual value as cash if you or one of your squad drives the truck. Supply runs should be the responsibility of all. The best way to win Warfare is to work together capping and then supping up the town before moving to another."]];
player createDiaryRecord["Diary", ["Building", "<br/>The commander builds a base. Each side starts with one Mobile Headqarters (MHQ). This is a vehicle the commander can use to build th headquarters (HQ) anywhere on the map. After the HQ is built, other buildings can be constructed. Only the commander can build factories and defenses around the base using the HQ. The HQ can also be packed up back as MHQ again and moved to another location."]];
player createDiaryRecord["Diary", ["Team", "<br/>All players and AI soldiers can buy subordinates, equipment and vehicles from the main base as well as some vehicles from the captured town forts. You can access all available facilities through the Purchase interface from inside the main base perimeter or anywhere on the map once a Command Center has been erected. Accessible supply factories are indicated by icons on right edge of the screen. If a Barracks has been built, select the Purchase Gear button to purchase weapons and ammunition. The equipment you purchase here will also be your starting kit when you respawn. In Purchase Units button, you will find a list of unit type icons along the top. Here you can buy empty or manned units from soldiers to aircraft."]];
player createDiaryRecord["Diary", ["Commander", "<br/>The Commander can be controlled either by player or by AI. He has access to extra resources and abilities: developing the base, setting objectives for teams, and defining the strategy of your side."]];
player createDiaryRecord["Diary", ["Voting", "<br/>After starting the warfare mission, you are confronted with the Vote Commander screen. Click on any name in the player list to cast your vote. If you join a game that has already started, you will not see the Vote Commander screen. A new vote for a new Commander can be started anytime using the Vote option in the Options interface. The commander assigns a mission and a role to a team leader, whether it be AI or human player. The role can include the type of equipment and vehicles the AI teams will use. Players have control of what they will use in their team. Mission is the task for the team to perform. You may disable the Commander Vote Pop-up in the Team Menu."]];
player createDiaryRecord["Diary", ["Summary", "<br/>Warfare is a blend of a team-based multiplayer mission and realtime strategy, where BLUFOR and OPFOR fight for the island control. Key objectives are to capture towns, defend your base and destroy the base of enemy. Both sides are lead by a commander, who influences his side's strategy. There are two kinds of resources: Supply points are used by the commander for building factories. Money is used to purchase weapons, units and vehicles."]];
player createDiaryRecord["Diary", ["Changelog", "<br/>
- Bountry for factories added and depending on kind of fac and way it got destroyed<br />
- ASR AI for server side and player's AIs.<br />
- New income encouraging players that are active on the map ! commander can change tax if he needs money.<br />
- Kill bounties raised and depending on the unit killed (high for infantry, low for aircraft).<br />
- Camp/town capture bounty raised.<br />
- Missile Range Limitation is the same for all vehicles.<br />
- Tank prices adjusted to their abitilities and HF levels line ups are reiewed.<br />
- Representative air prices according to their abilities and utility.<br />
- An-2 got WW1 MG and is compatible with EASA.<br />
- EASA setups reviewed for more balance.<br />
- Default params reviewed to match the mission's logic and context.<br />
- Kill bounties for human players now depend on their score.<br />
- Reviewed some camps positions to fix terrain bugs.<br />
- Service point can be dropped by repair truck now for 10 000 $.<br />
- MLRS can shoot now 8 rockets and has 36 rockets in total to match GRADs firepower.<br />
- Thanks to WASP team,we included some of theuir mission' features.
- Tunguska rearming at service point fixed.<br />
- Airlifting wrecks is possible now (you can't airlift ennemy HQ wreck).<br />
- AIs can't take camps easily now.<br />
- AIs get same bounties as players depending on their position in towns (no need for them to be near main camps to get bounty).<br />
- 'Hit' eventhandler from 073 added (ex: when you disable a tank then it explodes you get bounty).<br />
- AI will no longer disembark from disabled tanks.<br />
- New Missiles behaviour based on realistic values and accelerations<br />
- New rocket ranges<br />
- Bombs (MK and FAB) are free fall bombs and will be affected by the missile range<br />
- New upgrades levels to change the gameplay structure<br />
- Town capturing bounties are related to the town SV <br />
- Building walls inside factories is restricted <br />
- Swimming with gear is now possible <br />
- HQ now can be repaired at captured town depots for 225000$.(+5% every repair). All friendly townes will be set back to 10SV. <br />
- AI will no longer stop while player is respawning. <br />

V42: <br />
- Hellfire and KH29 Top mode. <br />
- Added refuel truck to main depot in towns.<br />
- Respawning at ennemy occupated towns is disabled <br />
- Proper units for takistan (crewmen,soldiers,pilots) <br />
- Autodefenses reduced to 30. <br />
- Air vehicles will not triger towns unless they fly under 50 m !!!. <br />
- Increased all AI skills to 100 %.<br />
- Airlift position lowered to avoid the 'Vehicle over heli' bug.<br />
- Stationary defences cost 2 times more.<br />
- Arty bursts reduced.<br />
- Upgrade prices adjusted <br />
- New base walls added <br />
- Base defences don't get auto-manned anymore <br />
- Commander can buy +20 AI <br />
- Novy Sobor is back! <br />
- Mortar range 2,2km, other arty 3km <br />
- Soldier prices adapted to make gear-farming ineffective. <br />
- Aircraft cannot rearm / repair at town depots anymore. Emergency service (fuel truck, engineer) only. <br />
- Salvage time raised to 6min. <br />
- Artillery prices lowered. <br />
- Kill bounties raised. <br />
- Capture bounties raised. <br />
- Pustoshka was replaced by Myshkino. <br />
- Maximum commander tax reduced to 30%. <br /> 
- Reduced Top attack effect for Hellfire and KH29. <br /> 
- Increased tunguska's accuracy. <br /> 
V43: <br />
- Construction menu tweaks:selling ennemy structures is not anymore possible. <br /> 
- Reworked players / factory bounties and also messages related to them. <br /> 
- RPG18/M136 and NLAW are disposable launchers now. <br /> 
- Anti Stacking script. <br /> 
- Modified fast time : disabled is default. <br /> 
- GEAR now has 5 upgrade levels and adapted costs. <br />
- BLUFOR can save resistance gear now (just take the weapon and press buy). <br />
- Lasermarker can be bought to the glasses slots. <br />
- Construction menu tweaks:building walls while a factory is building is not anymore possible. <br /> 
- Automanned AIs will join commander's group. <br /> 
- Laserbatteries,Mines will fit in the handgun magazines pool. <br /> 
- Now player can ask his crewmen to engine off the vehicle,and when it's done the vehicle switches to stealth mod until you use Start engine. <br /> 
- Construction menu fixes. <br /> 
- Base defenses and walls will be removed after base destruction. <br /> 
- Su-25 Easa bug fixed <br />
- Rules updated. <br />
- Tunguska/Linebaker price reduced.<br /> 
- Medics and Squad leaders/Officers are now able to repair camps.<br /> 
- lockpicking success chance increased from 20% to 50 %.<br /> 
- HQ deploy cost increase to 500 S / reduced deployed HQ  health points (8 SMAW HEAA can kill it) /Deploy range reduced from 200 to 140 m.<br /> 
- Some missiles behaviour has been reviewed/ Hellfire TOP attack reloaded with better accuracy (Hopefully this time ,it will work properly).
<br />
- Command center/service point are not anymore spawnable structures and therefore ,do not count as a base area when built alone.<br /> 
- NLAW moved to gear level 2 and barracks 1 can be upgraded after Gear level 2.<br /> 
- Some construction menu exploits fixed (needs to be tested).<br />
- Construction inside ennemy towns is not possible.<br />
- HQ first repair cost reduced to 250000 $.<br />
- HQ repair using cash will be only possible once in a game.<br />
- Some upgrades on both sides will cost some amount of cash (26000$ in total).<br />
 *** 21122013 V43 Changes ***<br /> 
- Each base area will have a limited number of structures and defenses that can be built inside (choose carefully your walls and defenses).<br /> 
- You can't build a factory if you have  0 items available.<br />
- If an item gets destroyed you will lose it forever for that base area.<br />
- If an item is sold you will not lose it.<br />
- Command center range is not unlimited anymore.<br />
- Bases cannot be built near ennemy ones,and indication will be given inside construction menu,but it's not enough to reveal the exact position of the ennemy base.<br />
- Maximum camps per town is 2 now instead of 3.<br />
- Occupation and resistance reviewed,but needs testing.<br />
- Konkurs reloading times reduced,and the M242 rate of fire increased to 500 rpm to match the real life value.<br />
- minor fixes (like refueling while being in stealth mode).<br />
 *** 06032014 V43 Changes ***<br /> 
- Removed many parameters to keep mission (oriented).<br />
- Added a garbage collector for dropped objects on the ground.<br />
- General reduction of all bounties.<br />
- Added 3 town templates to town amount parameter.<br />
- both camps are required to capture a town.<br />
- Ambulance lifespan is double the normal vehicle's ones.<br />
- Removed cargo walls ,concrete walls have double height now.<br />
- Light factory levels are now 4 (the balance is not symetric between sides).<br />
- Fixed :rearming air in towns is impossible.<br />
- CC range : 5500.<br />
- MIBA : 260.<br />
- Minor fixes and exploits dealt with.<br />
 *** 07122014 V45 Changes ***<br /> 
- added low gear for tanks.<br />
- removed towers from the construction menu. <br />
- optimised fsm scripts. <br />
- konkurs missile has 30 seconds of reload time. <br />
- improved armor for t-72 and t-90. <br />
- added tracer effect for AT launchers (second level of gear upgrade). <br />
- Hinds have apropriate textire on taki and cherno maps. <br />
- Fixed some prices for AT launchers. <br />
- Improved ammo for t-34. <br />
- opfor can buy mortars on 2-nd level like it does blifor team.<br />
- Improved armor for hinds choppers.<br />
- Improved EASA for Mi-24.<br />
<br />
V47: <br />
- Added item's cleaners and their settings in parameter list (GLOBAL section). <br/>
- Added a message of what upgrade was started in team of player. <br/>
- Added a restriction to build structures, statics and fortifications on base of an enemy team is around (250m radius). <br/>
- Removed Artillery Computer from parameter list.<br/>
"]];

player createDiaryRecord["Diary", ["Server Rules", "<br/>

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
 <br />
Some bugs became a part of pubic gameplay and are tolerated: <br />
1)gear-selling (you earn so few anyway.. ), 2)selling enemy structures as commander, 3)building objects at the mobile HQ <br />
Please report bugs you find, so they get fixed or added to this list.<br />
 <br />
Getting two timebans in less than 2 months may lead to a ban. <br />
Disrespecting the rules as admin makes you loose your admin rights. <br />

"]];






