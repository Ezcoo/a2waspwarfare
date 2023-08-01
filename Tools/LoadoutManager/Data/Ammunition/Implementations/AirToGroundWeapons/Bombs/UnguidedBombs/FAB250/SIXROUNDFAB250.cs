public class SIXROUNDFAB250 : BaseAmmunition
{
    public SIXROUNDFAB250()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FOURROUNDFAB250, AmmunitionType.TWOROUNDFAB250 };
        amountPerPylon = 3;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.AIRBOMBLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "FAB-250";
        costPerPylon = 300;
    }
}