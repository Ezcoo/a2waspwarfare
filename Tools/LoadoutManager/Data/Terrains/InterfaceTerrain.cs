public interface InterfaceTerrain
{
    public TerrainName TerrainName { get; set; }
    public TerrainType TerrainType { get; set; }
    public bool isModdedTerrain { get; set; }
    public void WriteAndUpdateTerrainFiles(DirectoryInfo _dir, string _easaFileString, string _commonBalanceFileString);
}