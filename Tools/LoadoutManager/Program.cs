using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        //GenerateTheEasaFile();
        GenerateCommonBalanceInitSQF();
        //WaitForExitCommand();
    }


    private static void GenerateCommonBalanceInitSQF()
    {
        // Iterate through every aircraft (implement this later)
        //foreach (AircraftType aircraftType in Enum.GetValues(typeof(AircraftType)))
        //{

        var _interfaceAircraft = (InterfaceAircraft)EnumExtensions.GetInstance("F35B");
        _interfaceAircraft.GenerateCommonBalanceInitForTheAircraft();
        var _interfaceAircraftWithTurret = (InterfaceAircraft)EnumExtensions.GetInstance("SU34");
        _interfaceAircraftWithTurret.GenerateCommonBalanceInitForTheAircraft();
        //}
    }

    /// <summary>
    /// MOVE TO OWN CLASS
    /// </summary>
    private static void WaitForExitCommand()
    {
        string userInput;
        do
        {
            //Console.WriteLine("Type 'exit' to close the program...");
            userInput = Console.ReadLine();
        } while (userInput?.ToLower() != "exit");
    }



    /// <summary>
    /// MOVE TO OWN CLASS
    /// </summary>
    private static void GenerateStartOfTheEasaFile()
    {
        Console.WriteLine("Private [\"_ammo\",\"_easaDefault\",\"_easaLoadout\",\"_easaVehi\",\"_is_AAMissile\",\"_loadout\",\"_loadout_line\",\"_vehicle\"];");
        Console.WriteLine();
        Console.WriteLine("EASA_Equip = Compile preprocessFileLineNumbers 'Client\\Module\\EASA\\EASA_Equip.sqf';");
        Console.WriteLine("EASA_RemoveLoadout = Compile preprocessFileLineNumbers 'Client\\Module\\EASA\\EASA_RemoveLoadout.sqf';");
        Console.WriteLine();
        Console.WriteLine("_easaDefault = [];");
        Console.WriteLine("_easaLoadout = [];");
        Console.WriteLine("_easaVehi = [];");
        Console.WriteLine();
        Console.WriteLine("/* [[Price], [Description], [Weapon, Ammos], [Weapon, Ammos]...] */");
    }


    private static void GenerateTheEasaFile()
    {
        GenerateStartOfTheEasaFile();
        GenerateAllAircraftLoadouts();
        GenerateEndOfTheEasaFile();
    }

    private static void GenerateAllAircraftLoadouts()
    {
        foreach (AircraftType aircraftType in Enum.GetValues(typeof(AircraftType)))
        {
            var _interfaceAircraft = (InterfaceAircraft)EnumExtensions.GetInstance(aircraftType.ToString());
            _interfaceAircraft.GenerateLoadoutsForTheAircraft();

            Console.WriteLine("\n");
        }
    }

    private static void GenerateEndOfTheEasaFile()
    {
        Console.WriteLine("//--- Now we check for AA-based loadouts.");
        Console.WriteLine("for '_i' from 0 to count(_easaVehi)-1 do {");
        Console.WriteLine("\t_loadout = _easaLoadout select _i;");
        Console.WriteLine("\t");
        Console.WriteLine("\tfor '_j' from 0 to count(_loadout)-1 do {");
        Console.WriteLine("\t\t_loadout_line = _loadout select _j;");
        Console.WriteLine("\t\t_is_AAMissile = false;");
        Console.WriteLine("\t\t");
        Console.WriteLine("\t\t//--- Browse each EASA magazines and check the ammunition kind.");
        Console.WriteLine("\t\t{");
        Console.WriteLine("\t\t\t_ammo = getText(configFile >> \"CfgMagazines\" >> _x >> \"ammo\"); //--- We grab the ammo used by the magazine.");
        Console.WriteLine("\t\t\t");
        Console.WriteLine("\t\t\tif (_ammo != \"\") then {");
        Console.WriteLine("\t\t\t\t//--- We check if the ammo is air-lock based and that in inherits from the missile class.");
        Console.WriteLine("\t\t\t\tif (getNumber(configFile >> \"CfgAmmo\" >> _ammo >> \"airLock\") == 1 && configName(inheritsFrom(configFile >> \"CfgAmmo\" >> _ammo)) == \"MissileBase\") exitWith {_is_AAMissile = true};");
        Console.WriteLine("\t\t\t};");
        Console.WriteLine("\t\t} forEach ((_loadout_line select 2) select 1);");
        Console.WriteLine("\t\t");
        Console.WriteLine("\t\t_loadout_line set [3, if (_is_AAMissile) then {true} else {false}];");
        Console.WriteLine("\t};");
        Console.WriteLine("};");
        Console.WriteLine();
        Console.WriteLine("missionNamespace setVariable ['WFBE_EASA_Vehicles',_easaVehi];");
        Console.WriteLine("missionNamespace setVariable ['WFBE_EASA_Loadouts',_easaLoadout];");
        Console.WriteLine("missionNamespace setVariable ['WFBE_EASA_Default',_easaDefault];");
    }


}