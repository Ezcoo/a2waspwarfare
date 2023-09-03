public abstract class BaseTerrain : InterfaceTerrain
{
    // Properties that specifies the name/type of the terrain.
    public TerrainName TerrainName { get => terrainName; set => terrainName = value; }
    public TerrainType TerrainType { get => terrainType; set => terrainType = value; }
    private TerrainName terrainName { get; set; }
    private TerrainType terrainType { get; set; }

    // Boolean flag to check if the terrain is modded.
    public bool isModdedTerrain { get; set; }

    // Method that writes and updates the terrain files.
    public void WriteAndUpdateTerrainFiles(DirectoryInfo _dir, string _easaFileString, string _commonBalanceFileString)
    {
        UpdateFilesForModdedTerrain(_dir);
        WriteToTerrainFiles(_dir, _easaFileString, _commonBalanceFileString);
        Console.WriteLine("-------" + terrainName + " DONE! ---------");
    }

    // Method to write specific content to terrain files based on conditions
    private void WriteToTerrainFiles(DirectoryInfo _dir, string _easaFileString, string _commonBalanceFileString)
    {
        // Check if the terrain is not modded
        if (!isModdedTerrain)
        {
            // Log the content to the console for debugging
            Console.WriteLine(_easaFileString);
            Console.WriteLine(_commonBalanceFileString);
        }

        // Write the content to the specified files
        WriteToFile(_dir, _easaFileString, @"Client\Module\EASA\EASA_Init.sqf");
        WriteToFile(_dir, _commonBalanceFileString, @"\Common\Functions\Common_BalanceInit.sqf");
    }

    // Method to write content to a file at a specific path
    private void WriteToFile(DirectoryInfo _dir, string _content, string _targetScriptPath)
    {
        // Concatenate the directory and file path
        string targetFile = Path.Combine(
            _dir.FullName, DetermineMissionPathIfItsModdedOrNot() +
            @"\[" + DetermineMissionTypeIfItsForestOrDesert() + "-2hc]warfarev2_073v48co." +
            EnumExtensions.GetEnumMemberAttrValue(terrainName) + @"\" + _targetScriptPath);

        // Make sure the directory exists
        string directoryName = Path.GetDirectoryName(targetFile);
        if (!Directory.Exists(directoryName))
        {
            // Create the directory if it doesn't exist
            Directory.CreateDirectory(directoryName);
        }

        // Write the content to the target file
        File.WriteAllText(targetFile, _content);
    }

    // Method to determine the mission path based on whether the terrain is modded or not
    private string DetermineMissionPathIfItsModdedOrNot()
    {
        // Return "Modded_Missions" if the terrain is modded, otherwise return "Missions"
        return isModdedTerrain ? "Modded_Missions" : "Missions";
    }

    // Method to determine the mission type based on the terrain type (Forest or Desert)
    private string DetermineMissionTypeIfItsForestOrDesert()
    {
        // Return "55" if the terrain type is FOREST, otherwise return "61"
        return TerrainType == TerrainType.FOREST ? "55" : "61";
    }

    private void UpdateFilesForModdedTerrain(DirectoryInfo _dir)
    {
        if (!isModdedTerrain)
        {
            return;
        }

        string sourceDirectory = DetermineSourceDirectory(_dir);
        string destinationDirectory = DetermineDestinationDirectory(_dir);

        FileManager.CopyFilesFromSourceToDestination(sourceDirectory, destinationDirectory);
        UpdateGuerillaBarracksFile(destinationDirectory);
    }

    private string DetermineSourceDirectory(DirectoryInfo _dir)
    {
        string sourceTerrainName = TerrainType == TerrainType.FOREST ? "chernarus" : "takistan";
        string sourceTerrainPlayerCount = DetermineMissionTypeIfItsForestOrDesert();
        return Path.Combine(_dir.FullName, @"Missions\[" + sourceTerrainPlayerCount + "-2hc]warfarev2_073v48co." + sourceTerrainName);
    }

    private string DetermineDestinationDirectory(DirectoryInfo _dir)
    {
        string sourceTerrainPlayerCount = DetermineMissionTypeIfItsForestOrDesert();
        return Path.Combine(_dir.FullName, @"Modded_Missions\[" + sourceTerrainPlayerCount +
            "-2hc]warfarev2_073v48co." + EnumExtensions.GetEnumMemberAttrValue(TerrainName));
    }

    private static void UpdateGuerillaBarracksFile(string _destinationDirectory)
    {
        string filePathForDeletingGuerillaBarracks = _destinationDirectory + @"\Server\Init\Init_Server.sqf";

        if (File.Exists(filePathForDeletingGuerillaBarracks))
        {
            string content = File.ReadAllText(filePathForDeletingGuerillaBarracks);

            if (content.Contains("_barrack_amount = 2;"))
            {
                content = content.Replace("_barrack_amount = 2;", "_barrack_amount = 0;");
                File.WriteAllText(filePathForDeletingGuerillaBarracks, content);
                //Console.WriteLine("File updated successfully!");
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