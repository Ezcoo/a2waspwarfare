public class ATK44AP : BaseAmmunition
{
    public ATK44AP()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.ATK44AP };
        amountPerPylon = 60;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.ATK44.ToString()) as BaseWeapon;
        ammoDisplayName = "ATK44 AP";
        costPerPylon = 99999999;
    }
}