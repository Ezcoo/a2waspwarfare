using Discord;
using System.Data;
using System;
using System.Runtime.Serialization;
using Discord.WebSocket;

[DataContract]
public class EXAMPLEGREENBUTTON : BaseButton
{
    public EXAMPLEGREENBUTTON()
    {
        buttonName = ButtonName.EXAMPLEGREENBUTTON;
        thisInterfaceButton.ButtonLabel = "Accept";
        buttonStyle = ButtonStyle.Success;
        ephemeralResponse = true;
    }

    protected override string GenerateCustomButtonProperties(int _buttonIndex, ulong _leagueCategoryId)
    {
        return "";
    }

    public override Task<Response> ActivateButtonFunction(
        SocketMessageComponent _component, InterfaceMessage _interfaceMessage)
    {
        return Task.FromResult(new Response("Success", true));
    }
}