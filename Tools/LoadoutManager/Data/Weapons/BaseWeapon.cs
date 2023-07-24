public abstract class BaseWeapon : InterfaceWeapon
{
    public WeaponType WeaponType { get => weaponType; set => weaponType = value; }

    private WeaponType weaponType { get; set; }
    public string weaponDisplayName { get; set; }
    public int costPerWeaponLauncher { get; set; }
}