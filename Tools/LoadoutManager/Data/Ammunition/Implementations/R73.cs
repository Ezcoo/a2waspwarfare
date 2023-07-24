public class R73 : BaseAmmunition
{
    public R73()
    {
        AmmunitionType = AmmunitionType.R73;
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.R73_WEAPON.ToString()) as BaseWeapon;
        ammoDisplayName = "R-73";
        costPerPylon = 2322;
    }
}