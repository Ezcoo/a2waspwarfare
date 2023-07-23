public abstract class BaseWeapon : InterfaceWeapon
{
    public WeaponType WeaponType { get => weaponType; set => weaponType = value; }

    private WeaponType weaponType { get; set; }
    public int CostPerWeaponLauncher { get; set; }
}