public class TWOHUNDREDTENROUND25MMM242APDS_BC : BaseAmmunition
{
    public TWOHUNDREDTENROUND25MMM242APDS_BC()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOHUNDREDTENROUND25MMM242APDS_BC };
        amountPerPylon = 200;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.M242BC.ToString()) as BaseWeapon;
        ammoDisplayName = "25MM (APDS)";
        costPerPylon = 99999999;
    }
}