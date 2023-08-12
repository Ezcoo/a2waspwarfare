public class VANILLA_FOURTYROUNDS8WITH80MMLAUNCHER : BaseAmmunition
{
    public VANILLA_FOURTYROUNDS8WITH80MMLAUNCHER()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_EIGHTYROUNDS8_WITHS8LAUNCHER };
        amountPerPylon = 20;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.VANILLA_S8LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "S-8";
        costPerPylon = 99999999;
    }
}