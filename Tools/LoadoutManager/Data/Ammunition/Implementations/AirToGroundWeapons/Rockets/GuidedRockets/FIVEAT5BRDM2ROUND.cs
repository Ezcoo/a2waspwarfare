public class FIVEAT5BRDM2ROUND : BaseAmmunition
{
    public FIVEAT5BRDM2ROUND()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FIVEAT5BRDM2ROUND };
        amountPerPylon = 3;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.KONKURSLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Konkurs";
        costPerPylon = 9999999;
    }
}