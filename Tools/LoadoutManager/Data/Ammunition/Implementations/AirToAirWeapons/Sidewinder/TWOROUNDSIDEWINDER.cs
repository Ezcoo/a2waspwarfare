public class TWOROUNDSIDEWINDER : BaseAmmunition
{
    public TWOROUNDSIDEWINDER()
    {
        AmmunitionType = AmmunitionType.TWOROUNDSIDEWINDER;
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.SIDEWINDERLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "AIM-9L";
        costPerPylon = 700;
    }
}