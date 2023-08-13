using System.Runtime.Serialization;

public enum FactoryType
{
    [EnumMember(Value = "LF")]
    LIGHTFACTORY,

    [EnumMember(Value = "HF")]
    HEAVYFACTORY,

    [EnumMember(Value = "AF")]
    AIRCRAFTFACTORY,
}