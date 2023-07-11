using Newtonsoft.Json.Converters;
using Newtonsoft.Json;
using System.Runtime.Serialization;

[JsonConverter(typeof(StringEnumConverter))]
public enum EmojiName
{
    [EnumMember(Value = ":test_emoji:")]
    TESTEMOJI = 0,
}