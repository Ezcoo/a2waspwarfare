public class MODDED_FOURR60ROUND : BaseAmmunition
{
    public MODDED_FOURR60ROUND()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.MODDED_FOURR60ROUND };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.MODDED_R60LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "R-60";
        costPerPylon = 99999999;
    }
}