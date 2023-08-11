public class SIXROUND105MMAPDS : BaseAmmunition
{
    public SIXROUND105MMAPDS()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.SIXROUND105MMAPDS };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.M68.ToString()) as BaseWeapon;
        ammoDisplayName = "105mm (APDS)";
        costPerPylon = 99999999;
    }
}