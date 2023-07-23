public abstract class BaseWeapon : InterfaceWeapon
{
    WeaponType InterfaceWeapon.Type { get; set; }
    public int CostPerWeaponLauncher { get; set; }
}