using Newtonsoft.Json.Converters;
using Newtonsoft.Json;
using System.Runtime.Serialization;

[JsonConverter(typeof(StringEnumConverter))]
public enum MessageName
{
    // Move to FrameworkMessageName
    [EnumMember(Value = "RAW MESSAGE INPUT")]
    RAWMESSAGEINPUT,

    [EnumMember(Value = "GAME STATUS MESSAGE")]
    GAMESTATUSMESSAGE,
}