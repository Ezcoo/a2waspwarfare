public class SIXROUNDMK82 : BaseAmmunition
{
    public SIXROUNDMK82()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.SIXROUNDMK82 };
        amountPerPylon = 3;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.MK82BOMBLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "MK-82";
        costPerPylon = 300;
    }
}