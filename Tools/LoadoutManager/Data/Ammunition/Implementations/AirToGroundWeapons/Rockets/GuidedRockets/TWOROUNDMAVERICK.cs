public class TWOROUNDMAVERICK : BaseAmmunition
{
    public TWOROUNDMAVERICK()
    {
        AmmunitionType = AmmunitionType.TWOROUNDMAVERICK;
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.MAVERICKLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "AGM-65";
        costPerPylon = 600;
    }
}