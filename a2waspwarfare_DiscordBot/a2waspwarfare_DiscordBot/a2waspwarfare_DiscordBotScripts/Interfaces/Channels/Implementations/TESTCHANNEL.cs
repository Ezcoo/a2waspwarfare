using Discord;
using System.Data;
using System;
using System.Runtime.Serialization;
using Discord.WebSocket;
using Discord.Commands;
using System.Collections.Concurrent;

[DataContract]
public class TESTCHANNEL : BaseChannel
{
    public TESTCHANNEL()
    {
        thisInterfaceChannel.ChannelType = ChannelType.TESTCHANNEL;

        thisInterfaceChannel.ChannelMessages = new ConcurrentDictionary<MessageName, bool>(
            new ConcurrentBag<KeyValuePair<MessageName, bool>>()
            {
                new KeyValuePair<MessageName, bool>(MessageName.TESTINGMESSAGE, false),
            });
    }

    public override List<Overwrite> GetGuildPermissions(SocketRole _role, params ulong[] _allowedUsersIdsArray)
    {
        var guild = BotReference.GetGuildRef();
        return new List<Overwrite>
        {
            new Overwrite(
                guild.EveryoneRole.Id, PermissionTarget.Role,
                new OverwritePermissions(viewChannel: PermValue.Deny, sendMessages: PermValue.Deny)),
            new Overwrite(RoleManager.CheckIfRoleExistsByNameAndCreateItIfItDoesntElseReturnIt(
                "Member").Result.Id, PermissionTarget.Role,
                new OverwritePermissions(viewChannel: PermValue.Allow)),
        };
    }
}