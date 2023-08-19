public interface InterfaceTerrain
{
    public TerrainName TerrainName { get; set; }
    public TerrainType TerrainType { get; set; }
    public bool isModdedTerrain { get; set; }
    public void WriteToFile(DirectoryInfo _dir, string _content, string _targetScriptPath);
}