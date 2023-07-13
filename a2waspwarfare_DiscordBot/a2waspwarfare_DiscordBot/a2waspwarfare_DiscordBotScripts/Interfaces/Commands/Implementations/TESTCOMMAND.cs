using System.Runtime.Serialization;
using Discord.WebSocket;

[DataContract]
public class TESTCOMMAND : BaseCommand
{
    public TESTCOMMAND()
    {
        commandName = CommandName.TESTCOMMAND;
        commandDescription = "testing";
        commandOption = new("testingcommand", "Enter your command here.");
        isAdminCommand = false;
    }

    protected override async Task<Response> ActivateCommandFunction(SocketSlashCommand _command, string _firstOptionString)
    {
        return new Response("Testing command!", false);
    }
}