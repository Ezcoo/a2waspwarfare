using System.Runtime.Serialization;

public enum AircraftType
{
    // Su-34

    [EnumMember(Value = "Su34")]
    SU34,

    // Su-25 variants
    [EnumMember(Value = "Su25_Ins")]
    SU25INS,
    [EnumMember(Value = "Su25_TK_EP1")]
    SU25TKEP1,
    [EnumMember(Value = "Su39")]
    SU39,

    // L-39
    [EnumMember(Value = "L39_TK_EP1")]
    L39TKEP1,
}