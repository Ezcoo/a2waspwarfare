public class TWOHUNDREDTENROUND25MMM242HEI : BaseAmmunition
{
    public TWOHUNDREDTENROUND25MMM242HEI()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOHUNDREDTENROUND25MMM242HEI };
        amountPerPylon = 210;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.M242.ToString()) as BaseWeapon;
        ammoDisplayName = "25MM (HE)";
        costPerPylon = 99999999;
    }
}