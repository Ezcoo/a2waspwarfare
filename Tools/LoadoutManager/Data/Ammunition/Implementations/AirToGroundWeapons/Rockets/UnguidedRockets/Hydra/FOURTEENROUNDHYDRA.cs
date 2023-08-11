public class FOURTEENROUNDHYDRA : BaseAmmunition
{
    public FOURTEENROUNDHYDRA()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.FOURTEENROUNDHYDRA };
        amountPerPylon = 7;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.HYDRALAUNCHER_14ROUNDS.ToString()) as BaseWeapon;
        ammoDisplayName = "Hydra";
        costPerPylon = 999999;
    }
}