using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        Console.WriteLine(GenerateTheEasaFile());
        Console.WriteLine("\n\n");
        GenerateCommonBalanceInitSQF();
        WaitForExitCommand();
    }

    static List<string> testingStrings = new List<string>
    {
        "F35B",
        "SU34",
    };

    private static void GenerateCommonBalanceInitSQF()
    {
        foreach (var item in testingStrings)
        {
            var _interfaceVehicle = (InterfaceVehicle)EnumExtensions.GetInstance(item);
            _interfaceVehicle.StartGeneratingCommonBalanceInitForTheVehicle();
        }
    }

    /// <summary>
    /// MOVE TO OWN CLASS
    /// </summary>
    private static void WaitForExitCommand()
    {
        string userInput;
        do
        {
            userInput = Console.ReadLine();
        } while (userInput?.ToLower() != "exit");
    }

    /// <summary>
    /// MOVE TO OWN CLASS
    /// </summary>
    private static string GenerateStartOfTheEasaFile()
    {
        string startOfTheEasaFile = string.Empty;

        startOfTheEasaFile += "Private [\"_ammo\",\"_easaDefault\",\"_easaLoadout\",\"_easaVehi\",\"_is_AAMissile\",\"_loadout\",\"_loadout_line\",\"_vehicle\"];";
        startOfTheEasaFile += "\n";
        startOfTheEasaFile += "EASA_Equip = Compile preprocessFileLineNumbers 'Client\\Module\\EASA\\EASA_Equip.sqf';";
        startOfTheEasaFile += "EASA_RemoveLoadout = Compile preprocessFileLineNumbers 'Client\\Module\\EASA\\EASA_RemoveLoadout.sqf';";
        startOfTheEasaFile += "\n";
        startOfTheEasaFile += "\n_easaDefault = [];";
        startOfTheEasaFile += "\n_easaLoadout = [];";
        startOfTheEasaFile += "\n_easaVehi = [];";
        startOfTheEasaFile += "\n\n";
        startOfTheEasaFile += "/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */";
        return startOfTheEasaFile;
    }


    private static string GenerateTheEasaFile()
    {
        string easaFileString = string.Empty;

        easaFileString += GenerateStartOfTheEasaFile();
        easaFileString += "\n" + GenerateAllAircraftLoadouts();
        easaFileString += GenerateEndOfTheEasaFile();

        return easaFileString;
    }

    private static string GenerateAllAircraftLoadouts()
    {
        string aircraftLoadouts = string.Empty;

        foreach (VehicleType aircraftType in Enum.GetValues(typeof(VehicleType)))
        {
            var _interfaceAircraft = (InterfaceAircraft)EnumExtensions.GetInstance(aircraftType.ToString());
            aircraftLoadouts += "\n" + _interfaceAircraft.GenerateLoadoutsForTheAircraft() + "\n";
        }

        return aircraftLoadouts;
    }

    private static string GenerateEndOfTheEasaFile()
    {
        string endOfTheEasaFile = string.Empty;

        endOfTheEasaFile += "//--- Now we check for AA-based loadouts.";
        endOfTheEasaFile += "for '_i' from 0 to count(_easaVehi)-1 do {";
        endOfTheEasaFile += "\t_loadout = _easaLoadout select _i;";
        endOfTheEasaFile += "\t";
        endOfTheEasaFile += "\tfor '_j' from 0 to count(_loadout)-1 do {";
        endOfTheEasaFile += "\t\t_loadout_line = _loadout select _j;";
        endOfTheEasaFile += "\t\t_is_AAMissile = false;";
        endOfTheEasaFile += "\t\t";
        endOfTheEasaFile += "\t\t//--- Browse each EASA magazines and check the ammunition kind.";
        endOfTheEasaFile += "\t\t{";
        endOfTheEasaFile += "\t\t\t_ammo = getText(configFile >> \"CfgMagazines\" >> _x >> \"ammo\"); //--- We grab the ammo used by the magazine.";
        endOfTheEasaFile += "\t\t\t";
        endOfTheEasaFile += "\t\t\tif (_ammo != \"\") then {";
        endOfTheEasaFile += "\t\t\t\t//--- We check if the ammo is air-lock based and that in inherits from the missile class.";
        endOfTheEasaFile += "\t\t\t\tif (getNumber(configFile >> \"CfgAmmo\" >> _ammo >> \"airLock\") == 1 && configName(inheritsFrom(configFile >> \"CfgAmmo\" >> _ammo)) == \"MissileBase\") exitWith {_is_AAMissile = true};";
        endOfTheEasaFile += "\t\t\t};";
        endOfTheEasaFile += "\t\t} forEach ((_loadout_line select 2) select 1);";
        endOfTheEasaFile += "\t\t";
        endOfTheEasaFile += "\t\t_loadout_line set [3, if (_is_AAMissile) then {true} else {false}];";
        endOfTheEasaFile += "\t};";
        endOfTheEasaFile += "};";
        endOfTheEasaFile += "\n";
        endOfTheEasaFile += "missionNamespace setVariable ['WFBE_EASA_Vehicles',_easaVehi];";
        endOfTheEasaFile += "missionNamespace setVariable ['WFBE_EASA_Loadouts',_easaLoadout];";
        endOfTheEasaFile += "missionNamespace setVariable ['WFBE_EASA_Default',_easaDefault];";

        return endOfTheEasaFile;
    }
}