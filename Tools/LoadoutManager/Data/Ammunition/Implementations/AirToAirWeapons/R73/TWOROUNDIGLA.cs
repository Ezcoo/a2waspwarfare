public class TWOROUNDIGLA : BaseAmmunition
{
    public TWOROUNDIGLA()
    {
        AmmunitionType = AmmunitionType.TWOROUNDIGLA;
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.IGLALAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Igla-V";
        costPerPylon = 700;
    }
}