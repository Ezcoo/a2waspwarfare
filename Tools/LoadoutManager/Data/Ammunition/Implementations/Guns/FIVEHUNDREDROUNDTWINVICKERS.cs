public class FIVEHUNDREDROUNDTWINVICKERS : BaseAmmunition
{
    public FIVEHUNDREDROUNDTWINVICKERS()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FIVEHUNDREDROUNDTWINVICKERS };
        amountPerPylon = 250;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.TWINVICKERS.ToString()) as BaseWeapon;
        ammoDisplayName = "Vickers";
        costPerPylon = 9999999;
    }
}