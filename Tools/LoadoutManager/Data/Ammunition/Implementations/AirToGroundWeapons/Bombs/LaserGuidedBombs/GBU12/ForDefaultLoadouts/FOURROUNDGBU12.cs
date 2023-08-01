public class FOURROUNDGBU12 : BaseAmmunition
{
    public FOURROUNDGBU12()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FOURROUNDGBU12 };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.GBU12BOMBLAUNCHER_A10.ToString()) as BaseWeapon;
        ammoDisplayName = "GBU-12";
        costPerPylon = 4000;
    }
}