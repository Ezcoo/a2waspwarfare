using System;

public interface InterfaceAmmunition
{
    public AmmunitionType AmmunitionType { get; set; }
    public int AmountPerPylon { get; set; }
    public BaseWeapon WeaponDefinition { get; set; }
    public int CostPerPylon { get; set; }
}
