public abstract class BaseTerrain : InterfaceTerrain
{
    public TerrainName TerrainName { get => terrainName; set => terrainName = value; }
    public TerrainType TerrainType { get => terrainType; set => terrainType = value; }

    private TerrainName terrainName { get; set; }
    private TerrainType terrainType { get; set; }

    public bool isModdedTerrain { get; set; }


    public void WriteAndUpdateTerrainFiles(DirectoryInfo _dir, string _easaFileString, string _commonBalanceFileString)
    {
        UpdateFilesForModdedTerrain(_dir);
        WriteToTerrainFiles(_dir, _easaFileString, _commonBalanceFileString);
        Console.WriteLine("-------" + terrainName + " DONE! ---------");
    }

    private void WriteToTerrainFiles(DirectoryInfo _dir, string _easaFileString, string _commonBalanceFileString)
    {
        if (!isModdedTerrain)
        {
            Console.WriteLine(_easaFileString);
            Console.WriteLine(_commonBalanceFileString);
        }

        WriteToFile(_dir, _easaFileString, @"Client\Module\EASA\EASA_Init.sqf");
        WriteToFile(_dir, _commonBalanceFileString, @"\Common\Functions\Common_BalanceInit.sqf");
    }

    private void WriteToFile(DirectoryInfo _dir, string _content, string _targetScriptPath)
    {
        // Append the relative path of the file
        string targetFile = Path.Combine(
            _dir.FullName, DetermineMissionPathIfItsModdedOrNot() + 
            @"\[" + DetermineMissionTypeIfItsForestOrDesert() + "-2hc]warfarev2_073v48co." +
            EnumExtensions.GetEnumMemberAttrValue(terrainName) + @"\" + _targetScriptPath);

        // Ensure the directory exists
        string directoryName = Path.GetDirectoryName(targetFile);
        if (!Directory.Exists(directoryName))
        {
            Directory.CreateDirectory(directoryName);
        }

        // Write to the file
        File.WriteAllText(targetFile, _content);
    }

    private string DetermineMissionPathIfItsModdedOrNot()
    {
        if (isModdedTerrain)
        {
            return "Modded_Missions";
        }

        return "Missions";
    }

    private string DetermineMissionTypeIfItsForestOrDesert()
    {
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