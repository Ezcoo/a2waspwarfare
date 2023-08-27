public class ATK44HE : BaseAmmunition
{
    public ATK44HE()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.ATK44HE };
        amountPerPylon = 140;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.ATK44.ToString()) as BaseWeapon;
        ammoDisplayName = "ATK44 HE";
        costPerPylon = 99999999;
    }
}