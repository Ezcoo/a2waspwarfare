public interface InterfaceTerrain
{
    public TerrainName TerrainName { get; set; }
    public TerrainType TerrainType { get; set; }
    public bool isModdedTerrain { get; set; }
    public string inGameMapName { get; set; }
    public void WriteAndUpdateTerrainFiles(string _easaFileString, string _commonBalanceFileString, string _coreModFile = "");
}