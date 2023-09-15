Private ['_side','_u'];

_side = _this;

_u			= ['Ins_Soldier_1'];
_u = _u		+ ['Ins_Soldier_2'];
_u = _u		+ ['Ins_Soldier_GL'];
_u = _u		+ ['Ins_Soldier_CO'];
_u = _u		+ ['Ins_Commander'];
_u = _u		+ ['Ins_Soldier_Medic'];
_u = _u		+ ['Ins_Soldier_AR'];
_u = _u		+ ['Ins_Soldier_MG'];
_u = _u		+ ['Ins_Soldier_AT'];
_u = _u		+ ['Ins_Soldier_AA'];
_u = _u		+ ['Ins_Soldier_Sniper'];
_u = _u		+ ['Ins_Soldier_Sapper'];
_u = _u		+ ['Ins_Soldier_Sab'];
_u = _u		+ ['Ins_Soldier_Pilot'];
_u = _u		+ ['Ins_Soldier_Crew'];

missionNamespace setVariable [Format ["WFBE_%1BARRACKSUNITS", _side], _u];
if (local player) then {['BARRACKS', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

if (IS_chernarus_map_dependent) then {
    _u			= ['UAZ_INS'];
    _u = _u		+ ['Ural_INS'];
    _u = _u		+ ['WarfareSalvageTruck_INS'];
    _u = _u		+ ['UralRepair_INS'];
    _u = _u		+ ['UralReammo_INS'];
    _u = _u		+ ['UralRefuel_INS'];
    if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['WarfareSupplyTruck_INS']};
    _u = _u		+ ['UAZ_MG_INS'];
    _u = _u		+ ['UAZ_AGS30_INS'];
    _u = _u		+ ['UAZ_SPG9_INS'];
    _u = _u		+ ['BRDM2_INS'];
    _u = _u		+ ['BRDM2_ATGM_INS'];
    _u = _u		+ ['Ural_ZU23_INS'];
    _u = _u		+ ['GRAD_INS'];
} else {
    _u			= ['UAZ_INS'];
    _u = _u		+ ['Ural_INS'];
    _u = _u		+ ['WarfareSalvageTruck_INS'];
    _u = _u		+ ['UralRepair_INS'];
    _u = _u		+ ['UralReammo_INS'];
    _u = _u		+ ['UralRefuel_INS'];
    if ((missionNamespace getVariable "WFBE_C_ECONOMY_SUPPLY_SYSTEM") == 0) then {_u = _u		+ ['WarfareSupplyTruck_INS']};
    _u = _u		+ ['UAZ_MG_INS'];
    _u = _u		+ ['UAZ_AGS30_INS'];
    _u = _u		+ ['UAZ_SPG9_INS'];
    _u = _u		+ ['BRDM2_INS'];
    _u = _u		+ ['BRDM2_ATGM_INS'];
    _u = _u		+ ['BRDM2_ATGM_TK_EP1'];
    _u = _u		+ ['Ural_ZU23_INS'];
    _u = _u		+ ['GRAD_INS'];
};

missionNamespace setVariable [Format ["WFBE_%1LIGHTUNITS", _side], _u];
if (local player) then {['LIGHT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ['BMP2_Ambul_INS'];
_u = _u		+ ['ZSU_INS'];
_u = _u		+ ['BMP2_INS'];
_u = _u		+ ['T72_INS'];

missionNamespace setVariable [Format ["WFBE_%1HEAVYUNITS", _side], _u];
if (local player) then {['HEAVY', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ['Mi17_Ins'];
_u = _u		+ ['Mi17_medevac_Ins'];
_u = _u		+ ['Mi24_V'];
_u = _u		+ ['Su25_Ins'];

missionNamespace setVariable [Format ["WFBE_%1AIRCRAFTUNITS", _side], _u];
if (local player) then {['AIRCRAFT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u = [];
_u = _u		+ ['Su25_Ins'];

missionNamespace setVariable [Format ["WFBE_%1AIRPORTUNITS", _side], _u];
if (local player) then {['AIRPORT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};

_u			= ["MMT_Civ"];
_u = _u		+ ["TT650_Civ"];
_u = _u		+ ["Lada2"];
_u = _u		+ ["LadaLM"];
_u = _u		+ ["SkodaRed"];
_u = _u		+ ["datsun1_civil_2_covered"];
_u = _u		+ ["UralCivil"];
if ((missionNamespace getVariable "WFBE_C_UNITS_TOWN_PURCHASE") > 0) then {
	_u = _u		+ [missionNamespace getVariable "WFBE_EASTSOLDIER"];
};

missionNamespace setVariable [Format ["WFBE_%1DEPOTUNITS", _side], _u];
if (local player) then {['DEPOT', _side, _u] Call Compile preProcessFile 'Client\Init\Init_Faction.sqf'};