using System.Runtime.Serialization;

public enum AircraftType
{
    [EnumMember(Value = "Su34")]
    SU34,

    // Su-25 variants
    [EnumMember(Value = "Su25_Ins")]
    SU25A,
    [EnumMember(Value = "Su25_TK_EP1")]
    SU25T,
    [EnumMember(Value = "Su39")]
    SU39,

    [EnumMember(Value = "L39_TK_EP1")]
    L39TKEP1,

    [EnumMember(Value = "F35B")]
    F35B,

    [EnumMember(Value = "L159_ACR")]
    L159ACR,

    // A-10 variants
    [EnumMember(Value = "A10")]
    A10A,
    [EnumMember(Value = "A10_US_EP1")]
    A10C,

    // AV8B variants
    [EnumMember(Value = "AV8B")]
    AV8BLGB,
    [EnumMember(Value = "AV8B2")]
    AV8B2,

    [EnumMember(Value = "Mi24_D_CZ_ACR")]
    MI24VCZ,

    [EnumMember(Value = "AH64D")]
    AH64A,
}