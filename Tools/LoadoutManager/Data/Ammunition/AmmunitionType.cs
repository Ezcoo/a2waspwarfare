using System.Runtime.Serialization;

public enum AmmunitionType
{
    [EnumMember(Value = "2Rnd_R73")]
    TWOROUNDR73,
    [EnumMember(Value = "4Rnd_R73")]
    FOURROUNDR73,

    // Combined in to 6rnd for better balance vs Mk-82
    [EnumMember(Value = "ERROR_UNDEFINED_VARIANT")]
    SIXROUNDFAB250,
    [EnumMember(Value = "4Rnd_FAB_250")]
    FOURROUNDFAB250,
    [EnumMember(Value = "2Rnd_FAB_250")]
    TWOROUNDFAB250,

    [EnumMember(Value = "ERROR_UNDEFINED_VARIANTS")]
    BASECH29,
    [EnumMember(Value = "4Rnd_Ch29")]
    FOURROUNDCH29,
    [EnumMember(Value = "6Rnd_Ch29")]
    SIXROUNDCH29,

    [EnumMember(Value = "40Rnd_S8T")]
    FOURTYROUNDS8,
    [EnumMember(Value = "40Rnd_S8T")]
    VANILLA_FOURTYROUNDS8,
    [EnumMember(Value = "80Rnd_S8T")]
    VANILLA_EIGHTYROUNDS8,

    [EnumMember(Value = "64Rnd_57mm")]
    SIXTYFOURROUNDS5,

    [EnumMember(Value = "4Rnd_AT9_Mi24P")]
    FOURROUNDATAKA,

    [EnumMember(Value = "2Rnd_GBU12")]
    TWOROUNDGBU12,
    [EnumMember(Value = "4Rnd_GBU12")]
    FOURROUNDGBU12, //vanilla

    [EnumMember(Value = "6Rnd_GBU12_AV8B")]
    VANILLA_SIXROUNDGBU12, //vanilla

    [EnumMember(Value = "2Rnd_Igla")]
    TWOROUNDIGLA,

    [EnumMember(Value = "2Rnd_Sidewinder_F35")]
    TWOROUNDSIDEWINDER,

    [EnumMember(Value = "2Rnd_Sidewinder_AH1Z")]
    TWOROUNDSIDEWINDER_AH1Z,

    [EnumMember(Value = "2Rnd_Maverick_A10")]
    TWOROUNDMAVERICK,
    [EnumMember(Value = "4Rnd_Maverick_L159")]
    VANILLA_FOURROUNDMAVERICK,

    [EnumMember(Value = "6Rnd_Mk82")]
    SIXROUNDMK82,

    [EnumMember(Value = "38Rnd_FFAR")]
    THIRTYEIGHTROUNDHYDRA,
    [EnumMember(Value = "14Rnd_FFAR")]
    FOURTEENROUNDHYDRA,

    [EnumMember(Value = "8Rnd_Hellfire")]
    EIGHTROUNDHELLFIRE,

    [EnumMember(Value = "300Rnd_25mm_GAU12")]
    THREEHUNDREDROUNDGAU12,

    [EnumMember(Value = "2Rnd_Stinger")]
    TWOROUNDSTINGER,

    [EnumMember(Value = "4Rnd_Stinger")]
    VANILLA_FOURROUNDSTINGER,

    [EnumMember(Value = "12Rnd_Vikhr_KA50")]
    TWELVEROUNDSVIKHR,

    [EnumMember(Value = "180Rnd_30mm_GSh301")]
    THREEHUNDREDSIXTYGSH301ROUNDS,

    [EnumMember(Value = "6Rnd_TOW2")]
    SIXROUNDTOWTWO,
    [EnumMember(Value = "2Rnd_TOW2")]
    TWOROUNDTOWTWO,

    [EnumMember(Value = "2Rnd_Spike_ACR")]
    TWOROUNDSPIKE,

    [EnumMember(Value = "200Rnd_40mmSABOT_FV510")]
    TWOHUNDREDROUNDCTWSSABOT,

    [EnumMember(Value = "200Rnd_40mmHE_FV510")]
    TWOHUNDREDROUNDCTWSHE,

    [EnumMember(Value = "6Rnd_CRV7_HEPD")]
    SIXROUNDCRV7HEPD,

    [EnumMember(Value = "8Rnd_9M311")]
    VANILLA_EIGHTROUNDTUNGUSKA,

    [EnumMember(Value = "500Rnd_TwinVickers")]
    FIVEHUNDREDROUNDTWINVICKERS,

    [EnumMember(Value = "60Rnd_CMFlareMagazine")]
    SIXTYROUNDCMFLAREMAGAZINE,

    [EnumMember(Value = "10Rnd_85mmAP")]
    TENROUND85MMAPZIS,
    [EnumMember(Value = "60Rnd_762x54_DT")]
    SIXTYROUND762X54DT,

    [EnumMember(Value = "210Rnd_25mm_M242_HEI")]
    TWOHUNDREDTENROUND25MMM242HEI,
    [EnumMember(Value = "210Rnd_25mm_M242_APDS")]
    TWOHUNDREDTENROUND25MMM242APDS,
    [EnumMember(Value = "210Rnd_25mm_M242_HEI")]
    TWOHUNDREDTENROUND25MMM242HEI_BC,
    [EnumMember(Value = "210Rnd_25mm_M242_APDS")]
    TWOHUNDREDTENROUND25MMM242APDS_BC,

    [EnumMember(Value = "12Rnd_MLRS")]
    TWELVEROUNDMLRS,

    [EnumMember(Value = "12Rnd_CRV7")]
    WARNING_GAME_CRASH_DO_NOT_USE_IN_LOADOUTS_TWELVEROUNDCRV7PG,

    [EnumMember(Value = "1200Rnd_20mm_M621")]
    ONETHOUSANDTWOHUNDREDROUND20MMM261,

    [EnumMember(Value = "6RND_105mm_APDS")]
    SIXROUND105MMAPDS,

    [EnumMember(Value = "750Rnd_30mm_GSh301")]
    SEVENHUNDREDFIFTY30MMGSH301ROUNDS,

    [EnumMember(Value = "1470Rnd_127x108_YakB")]
    ONETHOUSANDFOURHUNDREDSEVENTY127X108YAKBROUNDS,
}