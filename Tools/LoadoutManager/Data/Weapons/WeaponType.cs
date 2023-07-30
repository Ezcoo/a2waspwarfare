using System.Runtime.Serialization;

public enum WeaponType
{
    [EnumMember(Value = "R73Launcher_2")]
    R73_WEAPON,

    [EnumMember(Value = "AirBombLauncher")]
    AIRBOMBLAUNCHER,

    [EnumMember(Value = "Ch29Launcher_Su34")]
    CH29LAUNCHER,

    [EnumMember(Value = "80mmLauncher")]
    S8LAUNCHER,

    [EnumMember(Value = "57mmLauncher")]
    S5LAUNCHER,

    [EnumMember(Value = "AT9Launcher")]
    ATAKALAUNCHER,
}