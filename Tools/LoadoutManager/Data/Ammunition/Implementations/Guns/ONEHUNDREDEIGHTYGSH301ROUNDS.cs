public class ONEHUNDREDEIGHTYGSH301ROUNDS : BaseAmmunition
{
    public ONEHUNDREDEIGHTYGSH301ROUNDS()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.ONEHUNDREDEIGHTYGSH301ROUNDS };
        amountPerPylon = 1;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.GSHGUNPOD.ToString()) as BaseWeapon;
        ammoDisplayName = "Gun rounds (360rnd)";
        costPerPylon = 600;
    }
}