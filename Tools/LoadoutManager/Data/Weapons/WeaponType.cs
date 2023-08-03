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

    [EnumMember(Value = "BombLauncherF35")]
    GBU12BOMBLAUNCHER,
    [EnumMember(Value = "BombLauncherA10")]
    GBU12BOMBLAUNCHER_A10,

    [EnumMember(Value = "Igla_twice")]
    IGLALAUNCHER,

    [EnumMember(Value = "SidewinderLaucher_F35")]
    SIDEWINDERLAUNCHER,

    [EnumMember(Value = "SidewinderLaucher_AH1Z")]
    SIDEWINDERLAUNCHER_AH1Z,

    [EnumMember(Value = "MaverickLauncher")]
    MAVERICKLAUNCHER,

    [EnumMember(Value = "Mk82BombLauncher_6")]
    MK82BOMBLAUNCHER,

    [EnumMember(Value = "VikhrLauncher")]
    VIKHRLAUNCHER,

    [EnumMember(Value = "FFARLauncher")]
    HYDRALAUNCHER,

    [EnumMember(Value = "HellfireLauncher")]
    HELLFIRELAUNCHER,

    [EnumMember(Value = "GAU12")]
    GAU12,

    [EnumMember(Value = "StingerLauncher_twice")]
    STINGERLAUNCHER,

    [EnumMember(Value = "GSh301")]
    GSHGUNPOD,

    [EnumMember(Value = "TOWLauncherSingle")]
    TOWLAUNCHERSINGLE,

    [EnumMember(Value = "SpikeLauncher_ACR")]
    SPIKELAUNCHER,

    [EnumMember(Value = "CTWS")]
    CTWS,

    [EnumMember(Value = "CRV7_HEPD")]
    CRV7HEPD,
}