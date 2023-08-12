public class TWOROUNDFAB250_HELIBOMBLAUNCHER : BaseAmmunition
{
    public TWOROUNDFAB250_HELIBOMBLAUNCHER()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOROUNDFAB250_HELIBOMBLAUNCHER };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.HELIBOMBLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "FAB-250";
        costPerPylon = 9999999;
    }
}