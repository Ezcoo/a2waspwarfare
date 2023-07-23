public class FOURROUNDFAB250 : BaseAmmunition
{
    public FOURROUNDFAB250()
    {
        AmmunitionType = AmmunitionType.FOURROUNDFAB250;
        AmountPerPylon = 4;
        WeaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.AIRBOMBLAUNCHER.ToString()) as BaseWeapon;
        CostPerPylon = 23222;
    }
}