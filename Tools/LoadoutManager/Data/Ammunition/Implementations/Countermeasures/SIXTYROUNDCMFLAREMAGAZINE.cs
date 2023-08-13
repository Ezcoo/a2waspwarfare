public class SIXTYROUNDCMFLAREMAGAZINE : BaseAmmunition
{
    public SIXTYROUNDCMFLAREMAGAZINE()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE };
        amountPerPylon = 30;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.CMFLARELAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Flares";
        costPerPylon = 9999999;
    }
}