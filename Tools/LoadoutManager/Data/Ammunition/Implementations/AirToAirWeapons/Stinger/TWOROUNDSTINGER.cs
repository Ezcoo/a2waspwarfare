public class TWOROUNDSTINGER : BaseAmmunition
{
    public TWOROUNDSTINGER()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOROUNDSTINGER };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.STINGERLAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Stinger";
        costPerPylon = 700;
    }
}