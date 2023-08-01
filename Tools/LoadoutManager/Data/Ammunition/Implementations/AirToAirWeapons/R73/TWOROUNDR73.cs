public class TWOROUNDR73 : BaseAmmunition
{
    public TWOROUNDR73()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOROUNDR73 };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.R73_WEAPON.ToString()) as BaseWeapon;
        ammoDisplayName = "R-73";
        costPerPylon = 700;
    }
}