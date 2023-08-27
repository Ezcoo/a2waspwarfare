using System.Runtime.Serialization;

[DataContract]
public class GameData
{
    // File paths
    public static string dbPath = @"C:\a2waspwarfare\Data";
    public static string dbFileName = "database.json";
    public static string dbPathWithFileName = dbPath + @"\" + dbFileName;

    public static GameData Instance
    {
        get
        {
            lock (padlock)
            {
                if (instance == null)
                {
                    instance = new GameData();
                }
                return instance;
            }
        }
        set
        {
            instance = value;
        }
    }

    // Singleton stuff
    private static GameData instance;
    private static readonly object padlock = new object();

    [DataMember] private string[] exportedArgs = new string[4];

    public string GetGameMapAndPlayerCountWithEmoji()
    {
        var terrainInstance = GetInterfaceTerrainFromWorldName();
        string playerCount = GameData.Instance.exportedArgs[4];
        string maxPlayerCount = terrainInstance.DetermineMissionTypeIfItsForestOrDesertAndGetThePlayerCount();

        string terrainEmoji = EnumExtensions.GetEnumMemberAttrValue(EmojiName.EVERGREENTREE);

        if (terrainInstance.TerrainType == TerrainType.DESERT)
        {
            terrainEmoji = EnumExtensions.GetEnumMemberAttrValue(EmojiName.DESERT);
        }

        return terrainEmoji + " [" + playerCount + "/" + maxPlayerCount + "] " + terrainInstance.TerrainDisplayName;
    }

    public string GetGameMapAndPlayerCountWithEmojiForChannelName()
    {
        var terrainInstance = GetInterfaceTerrainFromWorldName();
        string playerCount = GameData.Instance.exportedArgs[4];
        string maxPlayerCount = terrainInstance.DetermineMissionTypeIfItsForestOrDesertAndGetThePlayerCount();

        string terrainEmoji = EnumExtensions.GetEnumMemberAttrValue(EmojiName.EVERGREENTREE);

        if (terrainInstance.TerrainType == TerrainType.DESERT)
        {
            terrainEmoji = EnumExtensions.GetEnumMemberAttrValue(EmojiName.DESERT);
        }

        return terrainEmoji + "  " + playerCount + "︱" + maxPlayerCount + "  " + terrainInstance.TerrainDisplayName;
    }

    //public string GetGameMapAndPlayerCount()
    //{
    //    var terrainInstance = GetInterfaceTerrainFromWorldName();
    //    string playerCount = GameData.Instance.exportedArgs[4];
    //    string maxPlayerCount = terrainInstance.DetermineMissionTypeIfItsForestOrDesertAndGetThePlayerCount();

    //    return "[" + playerCount + "/" + maxPlayerCount + "] " + terrainInstance.TerrainDisplayName;
    //}

    public InterfaceTerrain GetInterfaceTerrainFromWorldName()
    {
        return (InterfaceTerrain)EnumExtensions.GetInstance(exportedArgs[2]);
    }

    public string GenerateGameStatusMessage()
    {
        string message = string.Empty;

        message += "Score: " + EnumExtensions.GetEnumMemberAttrValue(EmojiName.BLUFORICON) + exportedArgs[0] +
            " vs " + exportedArgs[1] + EnumExtensions.GetEnumMemberAttrValue(EmojiName.OPFORICON);
        message += "\nUptime: " + ConvertUpTimeToSecondsAsString();

        message += "\n\nPlease balance the teams accordingly!";
        return message;
    }

    private string ConvertUpTimeToSecondsAsString()
    {
        return TimeService.ReturnTimeLeftAsStringFromTheTimeTheActionWillTakePlaceWithTimeLeft(
            ulong.Parse(exportedArgs[3]));
    }
}