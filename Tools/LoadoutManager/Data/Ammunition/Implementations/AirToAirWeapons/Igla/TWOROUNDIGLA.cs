public class TWOROUNDIGLA : BaseAmmunition
{
    public TWOROUNDIGLA()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOROUNDIGLA };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.IGLALAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Igla-V";
        costPerPylon = 200;
    }
}