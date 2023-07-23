using System;

public interface InterfaceAmmunition
{
    public int AmountPerPylon { get; set; }
    public WeaponDefinition WeaponDefinition { get; set; }
    public int CostPerPylon { get; set; }
}
