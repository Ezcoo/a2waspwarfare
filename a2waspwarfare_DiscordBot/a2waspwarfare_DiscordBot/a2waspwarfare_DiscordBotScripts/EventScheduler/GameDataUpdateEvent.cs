using Discord.Rest;
using Discord.WebSocket;
using System.Collections.Concurrent;
using System.Runtime.Serialization;
using System.Threading.Channels;

[DataContract]
public class GameDataUpdateEvent : ScheduledEvent
{
    public GameDataUpdateEvent() { }

    public GameDataUpdateEvent(
        ConcurrentBag<ScheduledEvent> _scheduledEvents)
    {
        SetupScheduledEvent(133333333333337, _scheduledEvents, 90);

        Log.WriteLine("Done creating event: " + nameof(GameDataUpdateEvent));
    }

    public override async Task ExecuteTheScheduledEvent(bool _serialize = true)
    {
        try
        {
            Log.WriteLine("This event should not be executed!", LogLevel.CRITICAL);
        }
        catch (Exception ex)
        {
            Log.WriteLine(ex.Message, LogLevel.CRITICAL);
            return;
        }
    }

    public async override void CheckTheScheduledEventStatus()
    {
        try
        {
            await GameDataDeSerialization.DeSerializeGameDataFromExtension();

            var interfaceChannel = Database.Instance.Categories.FindInterfaceCategoryByCategoryName(
                CategoryType.GAMESTATUSCATEGORY).FindInterfaceChannelWithNameInTheCategory(
                    ChannelType.GAMESTATUSCHANNEL);

            interfaceChannel.FindInterfaceMessageWithNameInTheChannel(
                        MessageName.GAMESTATUSMESSAGE).GenerateAndModifyTheMessage();

            SetTheBotStatus();

            var newChannelName = GameData.Instance.GetGameMapAndPlayerCountWithEmojiForChannelName();
            interfaceChannel.ChannelName = newChannelName;

            var guild = BotReference.GetGuildRef();

            // Find the channel by its ID
            var channel = guild.GetChannel(interfaceChannel.ChannelId);

            // Check if the channel exists
            if (channel == null)
            {
                return;
            }

            // Modify the channel name
            await channel.ModifyAsync(properties => properties.Name = newChannelName);
        }
        catch (Exception ex)
        {
            Log.WriteLine(ex.Message, LogLevel.CRITICAL);
            return;
        }
    }

    // Changes the bot status message to: "Playing: Chernarus[35/55]" for example,
    // and the status to online/away depending on the terrain type
    private void SetTheBotStatus()
    {
        var client = BotReference.GetClientRef();
        var terrainInstance = GameData.Instance.GetInterfaceTerrainFromWorldName();

        client.SetGameAsync(GameData.Instance.GetGameMapAndPlayerCountWithEmoji());

        if (terrainInstance.TerrainType == TerrainType.FOREST)
        {
            client.SetStatusAsync(status: Discord.UserStatus.Online);
        }
        else if (terrainInstance.TerrainType == TerrainType.DESERT)
        {
            client.SetStatusAsync(status: Discord.UserStatus.AFK);
        }
        else
        {
            client.SetStatusAsync(status: Discord.UserStatus.DoNotDisturb);
        }
    }
}