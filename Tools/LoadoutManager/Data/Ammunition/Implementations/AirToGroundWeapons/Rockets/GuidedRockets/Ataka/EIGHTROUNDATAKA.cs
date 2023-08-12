public class EIGHTROUNDATAKA : BaseAmmunition
{
    public EIGHTROUNDATAKA()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.EIGHTROUNDATAKA };
        amountPerPylon = 4;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.ATAKALAUNCHER.ToString()) as BaseWeapon;
        ammoDisplayName = "Ataka-V";
        costPerPylon = 1200;
    }
}