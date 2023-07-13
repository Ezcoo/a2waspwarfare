using Newtonsoft.Json.Converters;
using Newtonsoft.Json;
using System.Runtime.Serialization;

[JsonConverter(typeof(StringEnumConverter))]
public enum EmojiName
{
    [EnumMember(Value = "<:blufor_icon:1079531790873673819>")]
    BLUFORICON = 0,

    [EnumMember(Value = "<:opfor_icon:1079531788319330304>")]
    OPFORICON = 1,
}