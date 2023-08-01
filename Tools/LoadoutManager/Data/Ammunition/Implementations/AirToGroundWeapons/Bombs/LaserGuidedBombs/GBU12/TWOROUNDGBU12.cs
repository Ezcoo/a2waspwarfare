public class TWOROUNDGBU12 : BaseAmmunition
{
    public TWOROUNDGBU12()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOROUNDGBU12 };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.GBU12BOMBLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "GBU-12";
        costPerPylon = 4000;
    }
}