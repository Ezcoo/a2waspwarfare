
public class THIRTYEIGHTROUNDHYDRA : BaseAmmunition
{
    public THIRTYEIGHTROUNDHYDRA()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.THIRTYEIGHTROUNDHYDRA };
        amountPerPylon = 19;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.HYDRALAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Hydra";
        costPerPylon = 500;
    }
}