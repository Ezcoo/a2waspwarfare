using Newtonsoft.Json.Converters;
using Newtonsoft.Json;
using System.Runtime.Serialization;

[JsonConverter(typeof(StringEnumConverter))]
public enum CommandName
{
    [EnumMember(Value = "test")]
    TESTCOMMAND = 0,
}