// The BaseTerrain class serves as the foundation for managing different types of terrains in the game.
// It implements the InterfaceTerrain to ensure certain properties and methods are present in derived classes.
// The class provides functionality for:
// - Determining mission paths and types based on whether the terrain is modded or not.
// - Writing specific content to terrain files.
// - Updating existing files, particularly for modded terrains.
// - Handling the source and destination directories for file operations.
// It utilizes helper methods for these operations, making it a comprehensive solution for terrain management.

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

    // Method to update files for modded terrains
    private void UpdateFilesForModdedTerrain(DirectoryInfo _dir)
    {
        // Exit the method if the terrain is not modded
        if (!isModdedTerrain)
        {
            return;
        }

        // Determine the source and destination directories for file operations
        string sourceDirectory = DetermineSourceDirectory(_dir);
        string destinationDirectory = DetermineDestinationDirectory(_dir);

        // Copy files from the source to the destination directory
        FileManager.CopyFilesFromSourceToDestination(sourceDirectory, destinationDirectory);

        // Update the Guerilla Barracks file in the destination directory
        UpdateGuerillaBarracksFile(destinationDirectory);
    }

    // Method to determine the source directory path based on terrain type and mission type
    private string DetermineSourceDirectory(DirectoryInfo _dir)
    {
        // Determine the name of the source terrain based on the terrain type
        string sourceTerrainName = TerrainType == TerrainType.FOREST ? "chernarus" : "takistan";

        // Determine the player count for the mission based on the terrain type
        string sourceTerrainPlayerCount = DetermineMissionTypeIfItsForestOrDesert();

        // Construct and return the full source directory path
        return Path.Combine(_dir.FullName, @"Missions\[" + sourceTerrainPlayerCount + "-2hc]warfarev2_073v48co." + sourceTerrainName);
    }

    // Method to determine the destination directory based on mission type and terrain name
    private string DetermineDestinationDirectory(DirectoryInfo _dir)
    {
        // Determine the player count for the mission based on the terrain type
        string sourceTerrainPlayerCount = DetermineMissionTypeIfItsForestOrDesert();

        // Construct and return the full destination directory path
        return Path.Combine(_dir.FullName, @"Modded_Missions\[" + sourceTerrainPlayerCount +
            "-2hc]warfarev2_073v48co." + EnumExtensions.GetEnumMemberAttrValue(TerrainName));
    }

    // Method to update the Guerilla Barracks file at a specific destination directory
    private static void UpdateGuerillaBarracksFile(string _destinationDirectory)
    {
        // Construct the full path of the file that needs to be updated
        string filePathForDeletingGuerillaBarracks = _destinationDirectory + @"\Server\Init\Init_Server.sqf";

        // Check if the file exists
        if (File.Exists(filePathForDeletingGuerillaBarracks))
        {
            // Read the content of the file
            string content = File.ReadAllText(filePathForDeletingGuerillaBarracks);

            // Check if the file contains the specific string to be replaced
            if (content.Contains("_barrack_amount = 2;"))
            {
                // Replace the string and update the file
                content = content.Replace("_barrack_amount = 2;", "_barrack_amount = 0;");
                File.WriteAllText(filePathForDeletingGuerillaBarracks, content);
            }
            else
            {
                // Log a message if the specific content was not found
                Console.WriteLine("The specified content was not found in the file.");
            }
        }
        else
        {
            // Log a message if the file was not found
            Console.WriteLine("File not found!");
        }
    }
}