public class BASECH29 : BaseAmmunition
{
    public BASECH29()
    {
        AmmunitionType = AmmunitionType.BASECH29;
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.CH29LAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Kh-29";
        costPerPylon = 1234;

        optionalAmmunitionDictionary = new Dictionary<int, List<AmmunitionType>>
        {
            { 4, new List<AmmunitionType> { AmmunitionType.FOURROUNDCH29 } },
            { 6, new List<AmmunitionType> { AmmunitionType.SIXROUNDCH29 } },
            { 8, new List<AmmunitionType> { AmmunitionType.FOURROUNDCH29, AmmunitionType.FOURROUNDCH29 } },
            { 10, new List<AmmunitionType> { AmmunitionType.SIXROUNDCH29, AmmunitionType.FOURROUNDCH29 } },
        };
    }
}