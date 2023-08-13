public class VANILLA_EIGHTROUNDTUNGUSKA : BaseAmmunition
{
    public VANILLA_EIGHTROUNDTUNGUSKA()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_EIGHTROUNDTUNGUSKA };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.VANILLA_TUNGUSKALAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Tunguska";
        costPerPylon = 999999999;
    }
}