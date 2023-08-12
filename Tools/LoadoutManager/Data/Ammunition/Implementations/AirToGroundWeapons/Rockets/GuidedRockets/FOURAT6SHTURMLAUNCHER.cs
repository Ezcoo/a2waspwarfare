public class FOURAT6SHTURMLAUNCHER : BaseAmmunition
{
    public FOURAT6SHTURMLAUNCHER()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FOURAT6SHTURMLAUNCHER };
        amountPerPylon = 2;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.SHTURMLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Shturm";
        costPerPylon = 99999999;
    }
}