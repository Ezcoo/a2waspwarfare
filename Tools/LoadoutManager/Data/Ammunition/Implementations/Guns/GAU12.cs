public class THREEHUNDREDROUNDGAU12 : BaseAmmunition
{
    public THREEHUNDREDROUNDGAU12()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.THREEHUNDREDROUNDGAU12 };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.GAU12.ToString()) as BaseWeapon;
        ammoDisplayName = "GAU-12";
        costPerPylon = 99999999;
    }
}