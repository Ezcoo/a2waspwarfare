public class SEVENHUNDREDFIFTY30MMGSH301ROUNDS : BaseAmmunition
{
    public SEVENHUNDREDFIFTY30MMGSH301ROUNDS()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.SEVENHUNDREDFIFTY30MMGSH301ROUNDS };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.GSHGUNPOD.ToString()) as BaseWeapon;
        ammoDisplayName = "Gun rounds (750rnd)";
        costPerPylon = 99999999;
    }
}