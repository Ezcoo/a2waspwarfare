Private ["_lock","_position","_side","_type","_vehicle"];
_vehicle = _this select 0;
_type = typeof _vehicle;

switch (_type) do {

	case "T72_RU":{
		_rearmor = {
   			_ammo = _this select 4;
   			_result = 0;
   			switch (_ammo) do {
				case "Sh_125_SABOT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
				case "Sh_120_SABOT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
				case "R_SMAW_HEAA" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_RPG18_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG9_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7V_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7VL_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_M136_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "M_47_AT_EP1" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_MEEWS_HEAT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_AT13_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW2_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_85_AP" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_100_HEAT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
                    case "B_20mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_23mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HEI" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "Sh_40_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};   
     			default {_result = _this select 2;};
    		};
   			_result
  		};
  		_vehicle addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
	};
	
	case "T72_CDF":{
		_rearmor = {
   			_ammo = _this select 4;
   			_result = 0;
   			switch (_ammo) do {
				case "Sh_125_SABOT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
				case "Sh_120_SABOT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
				case "R_SMAW_HEAA" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_RPG18_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG9_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7V_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7VL_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_M136_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "M_47_AT_EP1" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_MEEWS_HEAT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_AT13_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW2_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_85_AP" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_100_HEAT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
                    case "B_20mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_23mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HEI" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "Sh_40_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};   
     			default {_result = _this select 2;};
    		};
   			_result
  		};
  		_vehicle addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
	};
	
	case "T72_INS":{
		_rearmor = {
   			_ammo = _this select 4;
   			_result = 0;
   			switch (_ammo) do {
				case "Sh_125_SABOT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
				case "Sh_120_SABOT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
				case "R_SMAW_HEAA" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_RPG18_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG9_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7V_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7VL_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_M136_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "M_47_AT_EP1" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_MEEWS_HEAT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_AT13_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW2_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_85_AP" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_100_HEAT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
                    case "B_20mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_23mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HEI" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "Sh_40_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};   
     			default {_result = _this select 2;};
    		};
   			_result
  		};
  		_vehicle addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
	};

	case "T72_TK_EP1":{
	 	_rearmor = {
   			_ammo = _this select 4;
   			_result = 0;
   			switch (_ammo) do {
				case "Sh_125_SABOT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
				case "Sh_120_SABOT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
				case "R_SMAW_HEAA" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_RPG18_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG9_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7V_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7VL_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_M136_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "M_47_AT_EP1" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_MEEWS_HEAT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_AT13_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW2_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_85_AP" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_100_HEAT" :{_dam=_this select 2; _p=30; _result=(_dam/100)*(100-_p);};
				    case "B_20mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_23mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HEI" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "Sh_40_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
                   
     			default {_result = _this select 2;};
    		};
   			_result
  		};
  		_vehicle addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
	};
	
	case "T72_Gue":{
		_rearmor = {
   			_ammo = _this select 4;
   			_result = 0;
   			switch (_ammo) do {
				case "Sh_125_SABOT" :{_dam=_this select 2; _p=25; _result=(_dam/100)*(100-_p);};
				case "Sh_120_SABOT" :{_dam=_this select 2; _p=25; _result=(_dam/100)*(100-_p);};
				case "R_SMAW_HEAA" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_RPG18_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG9_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7V_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_PG7VL_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_M136_AT" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "M_47_AT_EP1" :{_dam=_this select 2; _p=20; _result=(_dam/100)*(100-_p);};
				case "R_MEEWS_HEAT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_AT13_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW2_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_85_AP" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_100_HEAT" :{_dam=_this select 2; _p=25; _result=(_dam/100)*(100-_p);};
                    case "B_20mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_23mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HEI" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "Sh_40_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};   
     			default {_result = _this select 2;};
    		};
   			_result
  		};
  		_vehicle addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
	};

	case "T90":{
		
	 	_rearmor = {

   			_ammo = _this select 4;
   			_result = 0;

   			switch (_ammo) do {
				case "Sh_125_SABOT" :{_dam=_this select 2; _p=35; _result=(_dam/100)*(100-_p);};
				case "Sh_120_SABOT" :{_dam=_this select 2; _p=35; _result=(_dam/100)*(100-_p);};
				case "R_SMAW_HEAA" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_RPG18_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_PG9_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_PG7V_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_PG7VL_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_M136_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_47_AT_EP1" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "R_MEEWS_HEAT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_AT13_AT" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "M_TOW_AT" :{_dam=_this select 2; _p=33; _result=(_dam/100)*(100-_p);};
				case "M_TOW2_AT" :{_dam=_this select 2; _p=33; _result=(_dam/100)*(100-_p);};
				case "Sh_85_AP" :{_dam=_this select 2; _p=23; _result=(_dam/100)*(100-_p);};
				case "Sh_100_HEAT" :{_dam=_this select 2; _p=35; _result=(_dam/100)*(100-_p);};
					case "B_20mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_23mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HEI" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "Sh_40_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
     			default {_result = _this select 2;};
    		};
   			_result
  		};

  		_vehicle addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
	};

	default{
	
			_rearmor = {
   				_ammo = _this select 4;
   				_result = 0;

   				switch (_ammo) do {
				    case "B_20mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_23mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_25mm_HEI" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_AA" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "B_30mm_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					case "Sh_40_HE" :{_dam=_this select 2; _p=12; _result=(_dam/100)*(100-_p);};
					
     				default {_result = _this select 2;};
    			};
   				_result
  			};
			_vehicle addeventhandler ["HandleDamage",format ["_this Call %1", _rearmor]];
		
	};

};
processinitcommands;
_vehicle