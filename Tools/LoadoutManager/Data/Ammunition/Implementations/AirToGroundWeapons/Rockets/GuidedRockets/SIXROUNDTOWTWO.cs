public class SIXROUNDTOWTWO : BaseAmmunition
{
    public SIXROUNDTOWTWO()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.SIXROUNDTOWTWO };
        amountPerPylon = 3;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.TOWLAUNCHERSINGLE.ToString()) as BaseWeapon;
        ammoDisplayName = "TOW-2";
        costPerPylon = 600;
    }
}