public class VANILLA_SIXROUNDGBU12 : BaseAmmunition
{
    public VANILLA_SIXROUNDGBU12()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_SIXROUNDGBU12 };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.VANILLA_GBU12BOMBLAUNCHER_6RND.ToString()) as BaseWeapon;
        ammoDisplayName = "GBU-12";
        costPerPylon = 9999999;
    }
}