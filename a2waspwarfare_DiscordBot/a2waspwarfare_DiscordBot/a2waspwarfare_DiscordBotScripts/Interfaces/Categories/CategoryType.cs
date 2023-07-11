using Newtonsoft.Json.Converters;
using Newtonsoft.Json;
using System.Runtime.Serialization;

// REMEMBER TO SET THE VALUES CORRECTLY HERE !!!
[JsonConverter(typeof(StringEnumConverter))]
public enum CategoryType
{
    // Necessary for the operation of the bot, has the commands and the log channel
    // Maybe move this to seperate file
    [EnumMember(Value = "bot-stuff")]
    BOTSTUFF = 0,

    [EnumMember(Value = "game-status")]
    GAMESTATUSCATEGORY = 1,
}