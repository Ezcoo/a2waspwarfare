public class LASERBATTERIES : BaseAmmunition
{
    public LASERBATTERIES()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.LASERBATTERIES };
        amountPerPylon = 4;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.LASERDESIGNATOR.ToString()) as BaseWeapon;
        ammoDisplayName = "Laser Designator" +
            "";
        costPerPylon = 9999999;
    }
}