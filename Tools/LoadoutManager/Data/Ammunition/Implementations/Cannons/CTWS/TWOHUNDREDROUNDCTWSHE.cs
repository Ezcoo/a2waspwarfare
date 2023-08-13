public class TWOHUNDREDROUNDCTWSHE : BaseAmmunition
{
    public TWOHUNDREDROUNDCTWSHE()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOHUNDREDROUNDCTWSHE };
        amountPerPylon = 200;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.CTWS.ToString()) as BaseWeapon;
        ammoDisplayName = "CTWS (HE)";
        costPerPylon = 99999999;
    }
}