public class WARNING_GAME_CRASH_DO_NOT_USE_IN_LOADOUTS_TWELVEROUNDCRV7PG : BaseAmmunition
{
    public WARNING_GAME_CRASH_DO_NOT_USE_IN_LOADOUTS_TWELVEROUNDCRV7PG()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.WARNING_GAME_CRASH_DO_NOT_USE_IN_LOADOUTS_TWELVEROUNDCRV7PG };
        amountPerPylon = 6;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.WARNING_GAME_CRASH_DO_NOT_USE_IN_LOADOUTS_CRV7PG.ToString()) as BaseWeapon;
        ammoDisplayName = "CRV7 (HDPD)";
        costPerPylon = 99999999;
    }
}