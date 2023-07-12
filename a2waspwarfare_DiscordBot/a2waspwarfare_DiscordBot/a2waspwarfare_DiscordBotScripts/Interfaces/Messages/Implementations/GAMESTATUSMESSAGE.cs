using Discord;
using System.Data;
using System;
using System.Runtime.Serialization;
using Discord.WebSocket;
using System.Threading.Channels;
using System.Reflection;
using System.Collections.Concurrent;

[DataContract]
public class GAMESTATUSMESSAGE : BaseMessage
{
    public GAMESTATUSMESSAGE()
    {
        thisInterfaceMessage.MessageName = MessageName.GAMESTATUSMESSAGE;

        thisInterfaceMessage.MessageButtonNamesWithAmount = new ConcurrentDictionary<ButtonName, int>(
            new ConcurrentBag<KeyValuePair<ButtonName, int>>()
            {
            });

        thisInterfaceMessage.MessageEmbedTitle = "Game Status [insert map here]";
    }

    protected override void GenerateButtons(ComponentBuilder _component, ulong _leagueCategoryId)
    {
        base.GenerateRegularButtons(_component, _leagueCategoryId);
    }

    public override Task<string> GenerateMessage(ulong _leagueCategoryId = 0)
    {
        string message = string.Empty;

        // Get the world name and capitalize the first letter
        string worldName = GameData.Instance.exportedArgs[2];
        worldName = worldName.Substring(0, 1).ToUpper() + worldName.Substring(1);

        string uptimeConvertedToSeconds =
            TimeService.ReturnTimeLeftAsStringFromTheTimeTheActionWillTakePlaceWithTimeLeft(
                ulong.Parse(GameData.Instance.exportedArgs[3]));

        string playerCount = GameData.Instance.exportedArgs[4];
        string maxPlayerCount = GetMaxPlayerCountByWorldNameAndChangeMessageColor(worldName);

        // worldName as the title (add player count here)
        thisInterfaceMessage.MessageEmbedTitle = "[" + playerCount + "/" + maxPlayerCount + "] " + worldName; 

        message += "Uptime: " + uptimeConvertedToSeconds + "\n";

        message += "\n" + EnumExtensions.GetEnumMemberAttrValue(EmojiName.BLUFORICON) + " BLUFOR: " + GameData.Instance.exportedArgs[0] + "\n";
        message += EnumExtensions.GetEnumMemberAttrValue(EmojiName.OPFORICON) + " OPFOR: " + GameData.Instance.exportedArgs[1] + "\n" +
            "\nPlease balance the teams accordingly!";

        return Task.FromResult(message);
    }

    public override string GenerateMessageFooter()
    {
        return "Last updated at: " + DateTime.UtcNow.ToLongTimeString() + " " + DateTime.UtcNow.ToLongDateString() + " (GMT+0)";
    }

    // Add array here of custom maps later
    private string GetMaxPlayerCountByWorldNameAndChangeMessageColor(string _worldName)
    {
        if (_worldName == "Chernarus")
        {
            thisInterfaceMessage.MessageEmbedColor = Color.DarkGreen;
            return "55";
        }

        // Takistan/desert maps
        thisInterfaceMessage.MessageEmbedColor = Color.Gold;
        return "61";
    }
}