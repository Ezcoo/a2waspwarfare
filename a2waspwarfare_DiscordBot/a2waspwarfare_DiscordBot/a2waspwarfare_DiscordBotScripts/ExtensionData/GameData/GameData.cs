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

    public string GetGameMapAndPlayerCount()
    {
        string worldName = GetWorldNameAsCapitalFirstLetter();
        string playerCount = GameData.Instance.exportedArgs[4];
        string maxPlayerCount = GetMaxPlayerCountByWorldName(worldName);

        // worldName as the title (add player count here)
        return "[" + playerCount + "/" + maxPlayerCount + "] " + worldName;
    }

    // Add array here of custom maps later
    private string GetMaxPlayerCountByWorldName(string _worldName)
    {
        if (_worldName == "Chernarus")
        {
            return "55";
        }

        // Takistan/desert maps
        return "61";
    }

    public string GenerateGameStatusMessage()
    {
        string message = string.Empty;

        message += EnumExtensions.GetEnumMemberAttrValue(EmojiName.BLUFORICON) + exportedArgs[0] +
            " vs " + EnumExtensions.GetEnumMemberAttrValue(EmojiName.OPFORICON) + exportedArgs[1];
        message += "\nUptime: " + ConvertUpTimeToSecondsAsString();

        message += "\n\nPlease balance the teams accordingly!";
        return message;
    }

    private string ConvertUpTimeToSecondsAsString()
    {
        return TimeService.ReturnTimeLeftAsStringFromTheTimeTheActionWillTakePlaceWithTimeLeft(
            ulong.Parse(exportedArgs[3]));
    }

    // Get the world name and capitalize the first letter
    public string GetWorldNameAsCapitalFirstLetter()
    {
        string worldName = exportedArgs[2];
        return worldName.Substring(0, 1).ToUpper() + worldName.Substring(1);
    }
}