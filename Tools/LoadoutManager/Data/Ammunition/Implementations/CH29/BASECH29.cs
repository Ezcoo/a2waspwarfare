public class BASECH29 : BaseAmmunition
{
    public BASECH29()
    {
        AmmunitionType = AmmunitionType.BASECH29;
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.CH29LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Kh-29";
        costPerPylon = 1234;
    }
}