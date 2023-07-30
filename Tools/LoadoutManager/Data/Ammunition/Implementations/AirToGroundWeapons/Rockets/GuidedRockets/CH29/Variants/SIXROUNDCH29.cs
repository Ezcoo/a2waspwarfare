public class SIXROUNDCH29 : BASECH29
{
    public SIXROUNDCH29()
    {
        AmmunitionType = AmmunitionType.SIXROUNDCH29;
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.CH29LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Kh-29";
        costPerPylon = 600;
    }
}