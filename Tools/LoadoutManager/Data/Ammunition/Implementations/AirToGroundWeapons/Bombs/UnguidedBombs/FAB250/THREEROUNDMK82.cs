public class THREEROUNDMK82 : BaseAmmunition
{
    public THREEROUNDMK82()
    {
        AmmunitionType = AmmunitionType.THREEROUNDMK82;
        amountPerPylon = 3;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.MK82BOMBLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "MK-82";
        costPerPylon = 300;
    }
}