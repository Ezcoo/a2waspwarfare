using System.Runtime.Serialization;

public enum AmmunitionType
{
    [EnumMember(Value = "2Rnd_R73")]
    TWOROUNDR73,
    [EnumMember(Value = "4Rnd_R73")]
    FOURROUNDR73,

    [EnumMember(Value = "4Rnd_FAB_250")]
    FOURROUNDFAB250,

    [EnumMember(Value = "6Rnd_Ch29")]
    SIXROUNDCH29,
}