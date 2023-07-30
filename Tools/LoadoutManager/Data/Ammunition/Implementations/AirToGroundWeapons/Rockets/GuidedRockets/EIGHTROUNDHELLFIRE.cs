public class EIGHTROUNDHELLFIRE : BaseAmmunition
{
    public EIGHTROUNDHELLFIRE()
    {
        AmmunitionType = AmmunitionType.EIGHTROUNDHELLFIRE;
        amountPerPylon = 4;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.HELLFIRELAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "AGM-114";
        costPerPylon = 600;
    }
}