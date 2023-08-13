public class TWOROUNDFAB250 : BaseAmmunition
{
    public TWOROUNDFAB250()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOROUNDFAB250 };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.AIRBOMBLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "FAB-250";
        costPerPylon = 100;
    }
}