public class SIXROUNDCRV7HEPD : BaseAmmunition
{
    public SIXROUNDCRV7HEPD()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.SIXROUNDCRV7HEPD };
        amountPerPylon = 19;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.CRV7HEPD.ToString()) as BaseWeapon;
        ammoDisplayName = "CRV7 (HDPD)";
        costPerPylon = 99999999;
    }
}