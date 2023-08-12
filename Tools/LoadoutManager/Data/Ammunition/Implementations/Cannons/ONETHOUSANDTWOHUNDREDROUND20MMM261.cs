public class ONETHOUSANDTWOHUNDREDROUND20MMM261 : BaseAmmunition
{
    public ONETHOUSANDTWOHUNDREDROUND20MMM261()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.ONETHOUSANDTWOHUNDREDROUND20MMM261 };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.M621.ToString()) as BaseWeapon;
        ammoDisplayName = "M621";
        costPerPylon = 99999999;
    }
}