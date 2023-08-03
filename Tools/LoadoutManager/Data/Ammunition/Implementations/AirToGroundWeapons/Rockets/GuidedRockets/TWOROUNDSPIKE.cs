public class TWOROUNDSPIKE : BaseAmmunition
{
    public TWOROUNDSPIKE()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.TWOROUNDSPIKE };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.SPIKELAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Spike";
        costPerPylon = 1000;
    }
}