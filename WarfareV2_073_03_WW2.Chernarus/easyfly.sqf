//EasyFly script by Celery, SQF conversion by i0n0s
//Used to simplify fixed wing flight models
//
//Smaller _inertiaxy and _inertiaz values decrease inertia
//_stall is speed in km/h: script stops working at lower speeds

while {true} do {
   private ["_inertiaxy", "_inertiaz", "_stall", "_plane", "_velms"];
   waituntil {sleep 1;(vehicle player iskindof "Plane") and (alive player)};

   _plane = vehicle player;
   _inertiaxy = 7;
   _inertiaz = 4;
   if (_plane iskindof "Camel") then {_stall = 40} else {_stall = 150};

   while {(player == driver _plane) and (damage _plane < 1)} do {
       sleep 0.04;
       if (speed _plane >= _stall) then {
           _velms = (speed _plane) / 3.6;
           _plane setvelocity [
               (((vectordir _plane select 0) * _velms) + ((velocity _plane select 0) * _inertiaxy)) / (_inertiaxy + 1),
               (((vectordir _plane select 1) * _velms) + ((velocity _plane select 1) * _inertiaxy)) / (_inertiaxy + 1),
               (((vectordir _plane select 2) * _velms) + ((velocity _plane select 2) * _inertiaz)) / (_inertiaz + 1)
           ];
       };
   };
};