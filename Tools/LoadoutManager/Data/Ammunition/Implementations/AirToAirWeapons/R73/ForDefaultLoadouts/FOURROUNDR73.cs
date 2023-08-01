public class FOURROUNDR73 : BaseAmmunition
{
    public FOURROUNDR73()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FOURROUNDR73 };
        amountPerPylon = 2;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.R73_WEAPON.ToString()) as BaseWeapon;
        ammoDisplayName = "R-73";
        costPerPylon = 2322;

        canNotBeUsedAsLoadoutOption = true;
    }
}