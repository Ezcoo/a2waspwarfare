public class TWELVEROUNDMLRS : BaseAmmunition
{
    public TWELVEROUNDMLRS()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWELVEROUNDMLRS };
        amountPerPylon = 6;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.MLRSLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "MLRS";
        costPerPylon = 999999999;
    }
}