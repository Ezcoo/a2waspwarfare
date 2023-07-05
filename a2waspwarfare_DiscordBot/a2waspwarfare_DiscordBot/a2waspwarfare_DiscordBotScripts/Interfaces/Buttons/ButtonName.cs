using Newtonsoft.Json.Converters;
using Newtonsoft.Json;
using System.Runtime.Serialization;

[JsonConverter(typeof(StringEnumConverter))]
public enum ButtonName
{
    // Split to FrameworkButtonName
    [EnumMember(Value = "LINKBUTTON")]
    LINKBUTTON,

    [EnumMember(Value = "EXAMPLEREDBUTTON")]
    EXAMPLEREDBUTTON,

    [EnumMember(Value = "EXAMPLEGREENBUTTON")]
    EXAMPLEGREENBUTTON,
}