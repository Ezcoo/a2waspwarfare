public class R73 : BaseAmmunition
{
    public R73()
    {
        AmmunitionType = AmmunitionType.R73;
        AmountPerPylon = 1;
        WeaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.R73_WEAPON.ToString()) as BaseWeapon;
        CostPerPylon = 2322; // Fill in the actual cost here
    }
}