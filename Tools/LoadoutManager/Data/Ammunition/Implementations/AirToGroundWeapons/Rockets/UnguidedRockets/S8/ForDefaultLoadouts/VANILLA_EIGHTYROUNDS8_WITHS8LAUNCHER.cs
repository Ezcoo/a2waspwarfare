public class VANILLA_EIGHTYROUNDS8_WITHS8LAUNCHER : BaseAmmunition
{
    public VANILLA_EIGHTYROUNDS8_WITHS8LAUNCHER()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_EIGHTYROUNDS8_WITHS8LAUNCHER };
        amountPerPylon = 40;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.S8LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "S-8";
        costPerPylon = 99999999;
    }
}