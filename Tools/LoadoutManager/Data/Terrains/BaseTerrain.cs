public abstract class BaseTerrain : InterfaceTerrain
{
    public TerrainName TerrainName { get => terrainName; set => terrainName = value; }
    public TerrainType TerrainType { get => terrainType; set => terrainType = value; }

    private TerrainName terrainName { get; set; }
    private TerrainType terrainType { get; set; }
}