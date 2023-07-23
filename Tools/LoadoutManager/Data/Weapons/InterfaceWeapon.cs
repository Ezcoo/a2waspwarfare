using System;

public interface InterfaceWeapon
{
    public WeaponType Type { get; set; }
    public string ClassName { get; set; }
    public string DisplayName { get; set; }
    public int CostPerWeaponLauncher { get; set; }
}
