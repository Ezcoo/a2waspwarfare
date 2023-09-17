Private ['_c','_get','_i','_p','_z'];
_c = [];
_i = [];
_c = _c + ['ibrPRACS_MiG21mol'];
_i = _i + [['MiG-21MF Fishbed','',49999,50,-2,5,3,3,0,'Molatian Air Force',[]]];

for '_z' from 0 to (count _c)-1 do {
    if (isClass (configFile >> 'CfgVehicles' >> (_c select _z))) then {
        missionNamespace getVariable (_c select _z);
            if (isNil '_get') then {
                if ((_i select _z) select 0 == '') then {(_i select _z) set [0, [_c select _z,'displayName'] Call GetConfigInfo]};
                if (typeName((_i select _z) select 4) == 'SCALAR') then {
                                        if (((_i select _z) select 4) == -2) then {
                                    _ret = (_c select _z) Call Compile preprocessFile "Common\Functions\Common_GetConfigVehicleCrewSlot.sqf";
                                    (_i select _z) set[4, _ret select 0];
                                    (_i select _z) set[9, _ret select 1];
                                };
                            };
                            if (WF_Debug) then { (_i select _z) set[3, 1]};
                            _p = if ((_c select _z) isKindOf 'Man') then { 'portrait'} else { 'picture'};
                            (_i select _z) set[1, [_c select _z, _p] Call GetConfigInfo];
                            missionNamespace setVariable[_c select _z, _i select _z];
                       } else {
		                            diag_log Format["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_MOD: Duplicated Element found '%1'", (_c select _z), diag_frameno, diag_tickTime];
                    };
                            } else
                   {
                       diag_log Format["[WFBE (ERROR)][frameno:%2 | ticktime:%3] Core_MOD: Element '%1' is not a valid class.", (_c select _z),diag_frameno,diag_tickTime] ;
                  };
                        };
                    diag_log Format["[WFBE (INIT)][frameno:%2 | ticktime:%3] Core_MOD: Initialization (%1 Elements) - [Done]", count _c, diag_frameno, diag_tickTime] ;
