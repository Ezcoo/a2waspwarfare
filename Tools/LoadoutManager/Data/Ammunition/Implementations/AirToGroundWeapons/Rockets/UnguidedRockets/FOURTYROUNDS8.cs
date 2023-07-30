public class FOURTYROUNDS8 : BaseAmmunition
{
    public FOURTYROUNDS8()
    {
        AmmunitionType = AmmunitionType.FOURTYROUNDS8;
        amountPerPylon = 20;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.S8LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "S-8";
        costPerPylon = 3000;
    }
}