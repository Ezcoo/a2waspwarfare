public class VANILLA_FOURROUNDSTINGER : BaseAmmunition
{
    public VANILLA_FOURROUNDSTINGER()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_FOURROUNDSTINGER };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.VANILLA_STINGERLAUNCHER_4X.ToString()) as BaseWeapon;
        ammoDisplayName = "Stinger";
        costPerPylon = 200;
    }
}