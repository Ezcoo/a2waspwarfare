private['_position','_radius','_list','_flat','_u','_object','_meters','_allowedType','_ignoreVehicle','_vehicle','_isflat','_maxgrad','_mindist'];
_position=_this select 0;
_radius=_this select 1;
_ignoreVehicle=_this select 2;
_vehicle=if(count _this>3)then{_this select 3}
else{objNull};

_maxGrad='WFBE_COINMAXGRADIENT' Call GetNamespace;_minDist='WFBE_COINMINDISTANCE' Call GetNamespace;
_isFlat=_position isFlatEmpty[0.00001,0,24,10,0,false,_vehicle];
if(count _isFlat==0)exitWith{false};
_flat=true;_list=_position nearObjects _radius;
_u=count _list;while{_u!=0}do{_u=_u-1;_object=_list select _u;
_allowedType=if(_object==_vehicle)then{false}else{true};
if(!_ignoreVehicle)then{if((_object isKindOf "Man")||(_object isKindOf "Car")||(_object isKindOf "Tank")||(_object isKindOf "Air"))
then{_allowedType=false}};
if(_allowedType)then{_radius=(sizeof typeof _object)/2.35;
if(_radius>1)then{_meters=_object distance _position;
if(_meters<_radius)then{_flat=false;_u=0}}}};

if !(paramDefenseCollide) then {
                        if !(_itemcategory == 0) then {_flat = true};
                        if (surfaceIsWater(position _preview)) then {_color = _colorRed};
                        if (_color != _colorRed) then {
                            if (count((position _preview) nearEntities [['Man','Car','Motorcycle','Tank','Air','Ship'],10]) > 0) then {_color = _colorRed};
                        };
};
_flat;