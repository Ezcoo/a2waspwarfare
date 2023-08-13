public class TWOHUNDREDTENROUND25MMM242APDS : BaseAmmunition
{
    public TWOHUNDREDTENROUND25MMM242APDS()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOHUNDREDTENROUND25MMM242APDS };
        amountPerPylon = 200;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.M242.ToString()) as BaseWeapon;
        ammoDisplayName = "25MM (APDS)";
        costPerPylon = 99999999;
    }
}