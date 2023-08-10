public class TWOHUNDREDTENROUND25MMM242HEI_BC : BaseAmmunition
{
    public TWOHUNDREDTENROUND25MMM242HEI_BC()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOHUNDREDTENROUND25MMM242HEI_BC };
        amountPerPylon = 210;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.M242BC.ToString()) as BaseWeapon;
        ammoDisplayName = "25MM (HE)";
        costPerPylon = 99999999;
    }
}