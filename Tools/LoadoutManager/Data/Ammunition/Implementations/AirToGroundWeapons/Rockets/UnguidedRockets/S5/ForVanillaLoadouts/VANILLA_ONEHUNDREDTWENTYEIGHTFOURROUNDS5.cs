public class VANILLA_ONEHUNDREDTWENTYEIGHTFOURROUNDS5 : BaseAmmunition
{
    public VANILLA_ONEHUNDREDTWENTYEIGHTFOURROUNDS5()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_ONEHUNDREDTWENTYEIGHTFOURROUNDS5 };
        amountPerPylon = 64;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.S5LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "S-5";
        costPerPylon = 99999999;
    }
}