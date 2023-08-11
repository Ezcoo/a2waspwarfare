public class VANILLA_FOURTYROUNDS8 : BaseAmmunition
{
    public VANILLA_FOURTYROUNDS8()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_FOURTYROUNDS8 };
        amountPerPylon = 20;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.VANILLA_S8LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "S-8";
        costPerPylon = 3000;
    }
}