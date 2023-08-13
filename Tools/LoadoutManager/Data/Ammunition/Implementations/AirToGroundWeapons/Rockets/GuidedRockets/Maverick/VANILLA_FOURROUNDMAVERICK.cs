public class VANILLA_FOURROUNDMAVERICK : BaseAmmunition
{
    public VANILLA_FOURROUNDMAVERICK()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.VANILLA_FOURROUNDMAVERICK };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.VANILLA_MAVERICKLAUNCHER4ROUNDS.ToString()) as BaseWeapon;
        ammoDisplayName = "AGM-65";
        costPerPylon = 999999;
    }
}