public class MODDED_FIVEHUNDREDTWENTYROUND23MMGSH23L : BaseAmmunition
{
    public MODDED_FIVEHUNDREDTWENTYROUND23MMGSH23L()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.MODDED_FIVEHUNDREDTWENTYROUND23MMGSH23L };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.MODDED_GSH23L.ToString()) as BaseWeapon;
        ammoDisplayName = "23mm (520rnd)";
        costPerPylon = 99999999;
    }
}