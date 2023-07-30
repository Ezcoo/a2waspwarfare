public class TWOROUNDGBU12 : BaseAmmunition
{
    public TWOROUNDGBU12()
    {
        AmmunitionType = AmmunitionType.TWOROUNDGBU12;
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.AIRBOMBLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "GBU-12";
        costPerPylon = 4000;
    }
}