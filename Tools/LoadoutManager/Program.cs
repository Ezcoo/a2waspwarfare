using System;
using System.Collections.Generic;

class Program
{
    static string aircraftEasaLoadoutsFile = string.Empty;
    static string commonBalanceInitFile = string.Empty;

    static void Main()
    {
        GenerateCommonBalanceInitAndTheEasaFileForEachTerrain();
    }

    /// <summary>
    /// MOVE TO OWN CLASS
    /// </summary>


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

        easaFileString += EasaFileGenerator.GenerateStartOfTheEasaFile();
        easaFileString += "\n" + aircraftEasaLoadoutsFile;
        easaFileString += EasaFileGenerator.GenerateEndOfTheEasaFile();

        commonBalanceFileString += @"Private[""_currentFactoryLevel""];" + "\n\n";
        commonBalanceFileString += "// After adding Pandur and BTR-90 to this script, it's necessary to exit on the server to prevent an occassional freeze\n";
        commonBalanceFileString += "if (isServer) exitWith {};\n\n";
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
            FileManager.CopyFilesFromSourceToDestination(sourceDirectory, destinationDirectory);

            string filePathForDeletingGuerillaBarracks = destinationDirectory + @"\Server\Init\Init_Server.sqf";

            if (File.Exists(filePathForDeletingGuerillaBarracks))
            {
                string content = File.ReadAllText(filePathForDeletingGuerillaBarracks);

                if (content.Contains("_barrack_amount = 2;"))
                {
                    content = content.Replace("_barrack_amount = 2;", "_barrack_amount = 0;");
                    File.WriteAllText(filePathForDeletingGuerillaBarracks, content);
                    Console.WriteLine("File updated successfully!");
                }
                else
                {
                    Console.WriteLine("The specified content was not found in the file.");
                }
            }
            else
            {
                Console.WriteLine("File not found!");
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
}