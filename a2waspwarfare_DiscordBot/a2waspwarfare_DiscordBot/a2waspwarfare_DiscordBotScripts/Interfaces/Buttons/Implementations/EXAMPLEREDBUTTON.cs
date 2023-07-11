using Discord;
using System.Data;
using System;
using System.Runtime.Serialization;
using Discord.WebSocket;

[DataContract]
public class EXAMPLEREDBUTTON : BaseButton
{
    public EXAMPLEREDBUTTON()
    {
        buttonName = ButtonName.EXAMPLEREDBUTTON;
        thisInterfaceButton.ButtonLabel = "Reject";
        buttonStyle = ButtonStyle.Danger;
        ephemeralResponse = true;
    }

    protected override string GenerateCustomButtonProperties(int _buttonIndex, ulong _leagueCategoryId)
    {
        return "";
    }

    public override Task<Response> ActivateButtonFunction(
        SocketMessageComponent _component, InterfaceMessage _interfaceMessage)
    {
        return Task.FromResult(new Response("Fail", false));
    }
}