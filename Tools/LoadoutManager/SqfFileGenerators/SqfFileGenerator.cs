using System;
using System.IO;

public class SqfFileGenerator
{
    private static string aircraftEasaLoadoutsFile;
    private static string commonBalanceInitFile;

    public static string GenerateStartOfTheEasaFile()
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

    public static string GenerateEndOfTheEasaFile()
    {
        string endOfTheEasaFile = string.Empty;

        endOfTheEasaFile += "for '_i' from 0 to count(_easaVehi)-1 do {";
        endOfTheEasaFile += "\t_loadout = _easaLoadout select _i;";
        endOfTheEasaFile += "\t";
        endOfTheEasaFile += "\tfor '_j' from 0 to count(_loadout)-1 do {";
        endOfTheEasaFile += "\t\t_loadout_line = _loadout select _j;";
        endOfTheEasaFile += "\t\t_is_AAMissile = false;";
        endOfTheEasaFile += "\t\t";
        endOfTheEasaFile += "\t\t{";
        endOfTheEasaFile += "\t\t\t_ammo = getText(configFile >> \"CfgMagazines\" >> _x >> \"ammo\");";
        endOfTheEasaFile += "\t\t\t";
        endOfTheEasaFile += "\t\t\tif (_ammo != \"\") then {";
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

    public static void GenerateCommonBalanceInitAndTheEasaFileForEachTerrain()
    {
        DirectoryInfo dir = FileManager.FindA2WaspWarfareDirectory();
        try
        {
            FileManager.FindA2WaspWarfareDirectory();
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message);
            return;
        }

        GenerateLoadoutsForAllVehicleTypes();
        string easaFileString = GenerateEasaFileString();
        string commonBalanceFileString = GenerateCommonBalanceFileString();

        WriteAndUpdateToFilesForTerrains(dir, easaFileString, commonBalanceFileString);
    }

    private static void GenerateLoadoutsForAllVehicleTypes()
    {
        foreach (VehicleType vehicleType in Enum.GetValues(typeof(VehicleType)))
        {
            GenerateAircraftSpecificLoadouts(vehicleType);
        }
    }

    private static string GenerateEasaFileString()
    {
        string easaFileString = SqfFileGenerator.GenerateStartOfTheEasaFile();
        easaFileString += "\n" + aircraftEasaLoadoutsFile;
        easaFileString += SqfFileGenerator.GenerateEndOfTheEasaFile();
        return easaFileString;
    }

    private static string GenerateCommonBalanceFileString()
    {
        string commonBalanceFileString = @"Private[""_currentFactoryLevel""];" + "\n\n";
        commonBalanceFileString += "// After adding Pandur and BTR-90 to this script, it's necessary to exit on the server to prevent an occassional freeze\n";
        commonBalanceFileString += "if (isServer) exitWith {};\n\n";
        commonBalanceFileString += "switch (typeOf _this) do\n{\n";
        commonBalanceFileString += commonBalanceInitFile;
        commonBalanceFileString += "};";
        return commonBalanceFileString;
    }

    private static void GenerateAircraftSpecificLoadouts(VehicleType _vehicleType)
    {
        var interfaceVehicle = (InterfaceVehicle)EnumExtensions.GetInstance(_vehicleType.ToString());
        commonBalanceInitFile += interfaceVehicle.StartGeneratingCommonBalanceInitForTheVehicle() + "\n\n";

        var baseAircraft = interfaceVehicle as BaseAircraft;

        // Skip non-aircraft for easa
        if (baseAircraft == null)
        {
            return;
        }

        string result = baseAircraft.GenerateLoadoutsForTheAircraft();

        if (result == "") { return; }

        aircraftEasaLoadoutsFile += "\n" + result + "\n";
    }

    private static void WriteAndUpdateToFilesForTerrains
        (DirectoryInfo _dir, string _easaFileString, string _commonBalanceFileString)
    {
        foreach (var terrainName in Enum.GetValues(typeof(TerrainName)))
        {
            var terrainInstance = (InterfaceTerrain)EnumExtensions.GetInstance(terrainName.ToString());
            Console.WriteLine("------- running" + terrainName + " ---------");
            Console.WriteLine(_easaFileString);
            terrainInstance.WriteToFile(_dir, _easaFileString, @"Client\Module\EASA\EASA_Init.sqf");
            Console.WriteLine(_commonBalanceFileString);
            terrainInstance.WriteToFile(_dir, _commonBalanceFileString, @"\Common\Functions\Common_BalanceInit.sqf");

            terrainInstance.UpdateFilesForModdedTerrain(_dir);
            Console.WriteLine("------- end of " + terrainName + " ---------");
        }
    }
}
