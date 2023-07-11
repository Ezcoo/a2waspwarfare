using Newtonsoft.Json.Converters;
using Newtonsoft.Json;
using System.Runtime.Serialization;

[JsonConverter(typeof(StringEnumConverter))]
public enum ChannelType
{
    // Bot-stuff category
    [EnumMember(Value = "bot-commands")]
    BOTCOMMANDS,
    [EnumMember(Value = "bot-log")]
    BOTLOG,
    
    // TEST CATEGORY
    [EnumMember(Value = "test-channel")]
    TESTCHANNEL,
}