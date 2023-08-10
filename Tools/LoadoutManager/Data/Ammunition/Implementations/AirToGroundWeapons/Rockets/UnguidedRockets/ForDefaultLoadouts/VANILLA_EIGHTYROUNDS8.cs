public class VANILLA_EIGHTYROUNDS8 : BaseAmmunition
{
    public VANILLA_EIGHTYROUNDS8()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_EIGHTYROUNDS8 };
        amountPerPylon = 40;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.VANILLA_S8LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "S-8";
        costPerPylon = 99999999;
    }
}