public class TWOROUNDFAB250 : BaseAmmunition
{
    public TWOROUNDFAB250()
    {
        AmmunitionType = AmmunitionType.TWOROUNDFAB250;
        AmountPerPylon = 2;
        WeaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.AIRBOMBLAUNCHER.ToString()) as BaseWeapon;
        CostPerPylon = 23222;
    }
}