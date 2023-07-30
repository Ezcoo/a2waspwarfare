public class TWOROUNDSIDEWINDER_AH1Z : BaseAmmunition
{
    public TWOROUNDSIDEWINDER_AH1Z()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.SIDEWINDERLAUNCHER_AH1Z.ToString()) as BaseWeapon;
        ammoDisplayName = "AIM-9L";
        costPerPylon = 700;
    }
}