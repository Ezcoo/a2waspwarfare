using Discord.Rest;
using System.Collections.Concurrent;
using System.Runtime.Serialization;

[DataContract]
public class GameDataUpdateEvent : ScheduledEvent
{
    public GameDataUpdateEvent() { }

    public GameDataUpdateEvent(
        ConcurrentBag<ScheduledEvent> _scheduledEvents)
    {
        SetupScheduledEvent(133333333333337, _scheduledEvents, 60);

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

    public override void CheckTheScheduledEventStatus()
    {
        try
        {
            GameDataDeSerialization.DeSerializeGameDataFromExtension();

            Database.Instance.Categories.FindInterfaceCategoryByCategoryName(
                CategoryType.GAMESTATUSCATEGORY).FindInterfaceChannelWithNameInTheCategory(
                    ChannelType.GAMESTATUSCHANNEL).FindInterfaceMessageWithNameInTheChannel(
                        MessageName.GAMESTATUSMESSAGE).GenerateAndModifyTheMessage();

            SetTheBotStatus();
        }
        catch (Exception ex)
        {
            Log.WriteLine(ex.Message, LogLevel.CRITICAL);
            return;
        }
    }

    // Changes the bot status message to: "Playing: Chernarus[35/55]" for example, and the status to online/away depending on the map
    private void SetTheBotStatus()
    {
        var client = BotReference.GetClientRef();
        var terrainInstance = GameData.Instance.GetInterfaceTerrainFromWorldName();

        client.SetGameAsync(GameData.Instance.GetGameMapAndPlayerCount());

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