public class SIXTYFOURROUNDS5 : BaseAmmunition
{
    public SIXTYFOURROUNDS5()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.SIXTYFOURROUNDS5 };
        amountPerPylon = 32;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.S5LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "S-5";
        costPerPylon = 500;
    }
}