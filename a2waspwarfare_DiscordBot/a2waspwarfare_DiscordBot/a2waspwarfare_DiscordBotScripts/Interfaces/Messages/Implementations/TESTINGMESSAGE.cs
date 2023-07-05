using Discord;
using System.Data;
using System;
using System.Runtime.Serialization;
using Discord.WebSocket;
using System.Threading.Channels;
using System.Reflection;
using System.Collections.Concurrent;

[DataContract]
public class TESTINGMESSAGE : BaseMessage
{
    public TESTINGMESSAGE()
    {
        thisInterfaceMessage.MessageName = MessageName.TESTINGMESSAGE;

        thisInterfaceMessage.MessageButtonNamesWithAmount = new ConcurrentDictionary<ButtonName, int>(
            new ConcurrentBag<KeyValuePair<ButtonName, int>>()
            {
                new KeyValuePair<ButtonName, int>(ButtonName.EXAMPLEGREENBUTTON, 1),
                new KeyValuePair<ButtonName, int>(ButtonName.EXAMPLEREDBUTTON, 1),
            });

        thisInterfaceMessage.MessageEmbedTitle = "Click these buttons to test the functionality!";
    }

    protected override void GenerateButtons(ComponentBuilder _component, ulong _leagueCategoryId)
    {
        base.GenerateRegularButtons(_component, _leagueCategoryId);
    }

    public override Task<string> GenerateMessage(ulong _leagueCategoryId = 0)
    {
        return Task.FromResult(thisInterfaceMessage.MessageDescription);
    }
}