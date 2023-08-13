public class TWOROUNDTOWTWO : BaseAmmunition
{
    public TWOROUNDTOWTWO()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOROUNDTOWTWO };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.TOWLAUNCHER2RND.ToString()) as BaseWeapon;
        ammoDisplayName = "TOW-2";
        costPerPylon = 9999999;
    }
}