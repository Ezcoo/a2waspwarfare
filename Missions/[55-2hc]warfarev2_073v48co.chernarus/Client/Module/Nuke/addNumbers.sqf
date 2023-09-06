// Fonction qui calcule la somme de deux nombres

    private["_result","_param1","_param2"];
    //_result = _this select 0 + _this select 1;
    _param1 = _this select 0 ;
    ["DEBUG", Format ["ICMB_Message.sqf: Debug info [_param1] = %1 | type is %2", _param1, typeName _param1]] Call WFBE_CO_FNC_LogContent;
    
    _param2 = _this select 1 ;
    ["DEBUG", Format ["ICMB_Message.sqf: Debug info [_param1] = %1 | type is %2", _param1, typeName _param1]] Call WFBE_CO_FNC_LogContent;
    
    _result= _param1 + _param1;

    _result
