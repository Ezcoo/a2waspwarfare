class CfgPatches
{

class YourJeep

{

units[] = {"YourJeep"};

weapons[] = {};

requiredVersion = 1.0;

requiredAddons[] = {};

};

};

class CfgVehicles
{

class All {};
class AllVehicles: All {};
class Land: AllVehicles {};
class LandVehicle: Land {};
class Car: LandVehicle {};
class HMMWV_Base: Car {};
class HMMWV_Ambulance: HMMWV_Base {};

class YourJeep : HMMWV_Ambulance

{
    displayName = "CJ6 Jeep";
}

}