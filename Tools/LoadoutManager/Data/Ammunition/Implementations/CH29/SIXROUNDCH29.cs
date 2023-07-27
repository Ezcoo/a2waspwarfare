public class SIXROUNDCH29 : BaseAmmunition
{
    public SIXROUNDCH29()
    {
        AmmunitionType = AmmunitionType.SIXROUNDCH29;
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.CH29LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Kh-29";
        costPerPylon = 1234;
    }
}