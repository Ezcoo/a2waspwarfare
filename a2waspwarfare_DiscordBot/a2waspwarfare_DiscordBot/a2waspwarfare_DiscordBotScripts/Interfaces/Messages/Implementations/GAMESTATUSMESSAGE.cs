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
        thisInterfaceMessage.MessageEmbedTitle = GameData.Instance.GetGameMapAndPlayerCount();
        thisInterfaceMessage.MessageDescription = GameData.Instance.GenerateGameStatusMessage();
        ChangeMessageColorDependingOnTheCurrentWorldName();

        return Task.FromResult(thisInterfaceMessage.MessageDescription);
    }

    public override string GenerateMessageFooter()
    {
        return "Last updated at: " + DateTime.UtcNow.ToLongTimeString() + " " + DateTime.UtcNow.ToLongDateString() + " (GMT+0)";
    }

    // Add array here of custom maps later
    private void ChangeMessageColorDependingOnTheCurrentWorldName()
    {
        if (GameData.Instance.GetInterfaceTerrainFromWorldName().TerrainType == TerrainType.FOREST)
        {
            thisInterfaceMessage.MessageEmbedColor = Color.DarkGreen;
            return;
        }

        // Takistan/desert maps
        thisInterfaceMessage.MessageEmbedColor = Color.Gold;
    }
}