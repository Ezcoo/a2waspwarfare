using System;

public interface InterfaceWeapon
{
    public WeaponType WeaponType { get; set; }
    public int costPerWeaponLauncher { get; set; }
    public bool doNotAddWeapon { get; set; }
}
