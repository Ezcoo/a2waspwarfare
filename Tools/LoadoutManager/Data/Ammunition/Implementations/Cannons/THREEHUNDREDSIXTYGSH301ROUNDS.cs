public class THREEHUNDREDSIXTYGSH301ROUNDS : BaseAmmunition
{
    public THREEHUNDREDSIXTYGSH301ROUNDS()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.THREEHUNDREDSIXTYGSH301ROUNDS,
            AmmunitionType.THREEHUNDREDSIXTYGSH301ROUNDS };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.GSHGUNPOD.ToString()) as BaseWeapon;
        ammoDisplayName = "Gun rounds (360rnd)";
        costPerPylon = 600;
    }
}