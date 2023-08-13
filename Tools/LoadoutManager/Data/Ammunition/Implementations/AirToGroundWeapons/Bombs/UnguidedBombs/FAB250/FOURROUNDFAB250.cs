public class FOURROUNDFAB250 : BaseAmmunition
{
    public FOURROUNDFAB250()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FOURROUNDFAB250 };
        amountPerPylon = 2;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.AIRBOMBLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "FAB-250";
        costPerPylon = 300;
    }
}