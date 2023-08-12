public class VANILLA_FOURROUNDCH29 : BASECH29
{
    public VANILLA_FOURROUNDCH29()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_FOURROUNDCH29 };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.VANILLA_CH29LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Kh-29";
        costPerPylon = 99999999;
    }
}