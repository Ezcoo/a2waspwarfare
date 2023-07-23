public abstract class BaseWeapon : InterfaceWeapon
{
    WeaponType InterfaceWeapon.Type { get; set; }
    public string DisplayName { get; set; }
    public int CostPerWeaponLauncher { get; set; }
}