public abstract class BaseTerrain : InterfaceTerrain
{
    public TerrainName TerrainName { get => terrainName; set => terrainName = value; }
    public TerrainType TerrainType { get => terrainType; set => terrainType = value; }

    private TerrainName terrainName { get; set; }
    private TerrainType terrainType { get; set; }

    public bool isModdedTerrain { get; set; }

    public void WriteToFile(DirectoryInfo _dir, string _content, string _targetScriptPath)
    {
        // Append the relative path of the file
        string targetFile = Path.Combine(
            _dir.FullName, DetermineMissionPathIfItsModdedOrNot() +
            @"\[" + DetermineMissionTypeIfItsForestOrDesertAndGetThePlayerCount() + "-2hc]warfarev2_073v48co." +
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

    public string DetermineMissionTypeIfItsForestOrDesertAndGetThePlayerCount()
    {
        if (TerrainType == TerrainType.FOREST)
        {
            return "55";
        }

        return "61";
    }
}