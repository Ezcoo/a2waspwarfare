public class TWELVEROUNDSVIKHR : BaseAmmunition
{
    public TWELVEROUNDSVIKHR()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWELVEROUNDSVIKHR };
        amountPerPylon = 6;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.VIKHRLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Vikhr";
        costPerPylon = 200;
    }
}