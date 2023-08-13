public class ONETHOUSANDFOURHUNDREDSEVENTY127X108YAKBROUNDS : BaseAmmunition
{
    public ONETHOUSANDFOURHUNDREDSEVENTY127X108YAKBROUNDS()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.ONETHOUSANDFOURHUNDREDSEVENTY127X108YAKBROUNDS };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.YAKB.ToString()) as BaseWeapon;
        ammoDisplayName = "12.7mm";
        costPerPylon = 99999999;
    }
}