using System;
using System.Collections.Generic;

class Program
{
    static string aircraftEasaLoadoutsFile = string.Empty;
    static string commonBalanceInitFile = string.Empty;

    static void Main()
    {
        GenerateCommonBalanceInitAndTheEasaFileForEachTerrain();

        //WaitForCommand("exit");
    }

    /// <summary>
    /// MOVE TO OWN CLASS
    /// </summary>
    private static void WaitForCommand(string _command)
    {
        string userInput;
        do
        {
            userInput = Console.ReadLine();
        } while (userInput?.ToLower() != _command);
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


    private static void GenerateCommonBalanceInitAndTheEasaFileForEachTerrain()
    {
        // Get the current executing directory
        string currentDirectory = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);

        // Navigate up until you find 'a2waspwarfare'
        DirectoryInfo dir = new DirectoryInfo(currentDirectory);
        while (dir.Name != "a2waspwarfare" && dir.Parent != null)
        {
            dir = dir.Parent;
        }

        if (dir.Name != "a2waspwarfare")
        {
            throw new Exception("Could not find the 'a2waspwarfare' directory.");
        }

        string easaFileString = string.Empty;
        string commonBalanceFileString = string.Empty;

        foreach (VehicleType vehicleType in Enum.GetValues(typeof(VehicleType)))
        {
            GenerateAircraftSpecificLoadouts(vehicleType);
        }

        easaFileString += GenerateStartOfTheEasaFile();
        easaFileString += "\n" + aircraftEasaLoadoutsFile;
        easaFileString += GenerateEndOfTheEasaFile();

        commonBalanceFileString += "switch (typeOf _this) do\n{\n";
        commonBalanceFileString += commonBalanceInitFile;
        commonBalanceFileString += "};";

        // Write Easa and common_balance Init to non modded maps, so they can be copied over later
        foreach (var terrainName in Enum.GetValues(typeof(TerrainName)))
        {
            var terrainInstance = (InterfaceTerrain)EnumExtensions.GetInstance(terrainName.ToString());

            Console.WriteLine("-------" + terrainName + "---------");

            Console.WriteLine(easaFileString);
            terrainInstance.WriteToFile(dir, easaFileString, @"Client\Module\EASA\EASA_Init.sqf");
            Console.WriteLine(commonBalanceFileString);
            terrainInstance.WriteToFile(dir, commonBalanceFileString, @"\Common\Functions\Common_BalanceInit.sqf");

            Console.WriteLine("------- end of " + terrainName + "---------");
        }

        // Now that the files are good to go, loop through modded terrains and copy the changes (excluding mission.sqm, version file)
        foreach (var terrainName in Enum.GetValues(typeof(TerrainName)))
        {
            var terrainInstance = (InterfaceTerrain)EnumExtensions.GetInstance(terrainName.ToString());

            // Skips non modded maps
            if (!terrainInstance.isModdedTerrain)
            {
                continue;
            }

            // Determine the source directory based on the terrain type of the current modded map
            string sourceTerrainName = terrainInstance.TerrainType == TerrainType.FOREST ? "chernarus" : "takistan";
            string sourceTerrainPlayerCount = terrainInstance.TerrainType == TerrainType.FOREST ? "55" : "61";
            string sourceDirectory = Path.Combine(dir.FullName, @"Missions\[" + sourceTerrainPlayerCount + "-2hc]warfarev2_073v48co." + sourceTerrainName);

            // Determine the destination directory for the current modded map
            string destinationDirectory = Path.Combine(dir.FullName, @"Modded_Missions\[" + sourceTerrainPlayerCount + "-2hc]warfarev2_073v48co." + EnumExtensions.GetEnumMemberAttrValue(terrainName));

            // Copy the files
            CopyFilesFromSourceToDestination(sourceDirectory, destinationDirectory);
        }
    }

    private static void CopyFilesFromSourceToDestination(string _source, string _destination)
    {
        // Get the list of files to copy
        var sourceFiles = Directory.GetFiles(_source).Where(file =>
            !file.EndsWith("mission.sqm", StringComparison.OrdinalIgnoreCase) &&
            !file.EndsWith("version.sqf", StringComparison.OrdinalIgnoreCase)).ToList();

        var destinationFiles = Directory.GetFiles(_destination);

        // Copy files from source to destination
        foreach (var file in sourceFiles)
        {
            string fileName = Path.GetFileName(file);
            string destFile = Path.Combine(_destination, fileName);
            File.Copy(file, destFile, true);  // true to overwrite existing files
        }

        // Delete extra files in destination that are not in source
        foreach (var destFile in destinationFiles)
        {
            string fileName = Path.GetFileName(destFile);
            if (fileName.EndsWith("mission.sqm") || fileName.EndsWith("version.sqf"))
            {
                continue;
            }

            string correspondingSourceFile = Path.Combine(_source, fileName);
            if (!sourceFiles.Contains(correspondingSourceFile))
            {
                File.Delete(destFile);
            }
        }
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

    private static string GenerateEndOfTheEasaFile()
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
}