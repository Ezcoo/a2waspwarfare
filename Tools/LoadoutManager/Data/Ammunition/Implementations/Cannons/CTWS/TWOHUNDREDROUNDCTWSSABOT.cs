public class TWOHUNDREDROUNDCTWSSABOT : BaseAmmunition
{
    public TWOHUNDREDROUNDCTWSSABOT()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOHUNDREDROUNDCTWSSABOT };
        amountPerPylon = 200;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.CTWS.ToString()) as BaseWeapon;
        ammoDisplayName = "CTWS (Sabot)";
        costPerPylon = 99999999;
    }
}