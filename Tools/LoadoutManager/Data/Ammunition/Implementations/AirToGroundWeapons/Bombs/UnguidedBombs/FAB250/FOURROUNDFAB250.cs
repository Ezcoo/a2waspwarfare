public class FOURROUNDFAB250 : BaseAmmunition
{
    public FOURROUNDFAB250()
    {
        AmmunitionType = AmmunitionType.FOURROUNDFAB250;
        amountPerPylon = 4;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.AIRBOMBLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "FAB-250";
        costPerPylon = 300;
    }
}