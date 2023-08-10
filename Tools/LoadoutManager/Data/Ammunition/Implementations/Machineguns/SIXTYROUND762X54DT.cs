public class SIXTYROUND762X54DT : BaseAmmunition
{
    public SIXTYROUND762X54DT()
    {
        AmmunitionTypes = new List<AmmunitionType>() { AmmunitionType.SIXTYROUND762X54DT };
        amountPerPylon = 30;
        weaponDefinition = (InterfaceWeapon)EnumExtensions.GetInstance(WeaponType.DTMACHINEGUN.ToString()) as BaseWeapon;
        ammoDisplayName = "DT";
        costPerPylon = 9999999;
    }
}