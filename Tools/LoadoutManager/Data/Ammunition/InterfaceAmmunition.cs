using System;

public interface InterfaceAmmunition
{
    public AmmunitionType AmmunitionType { get; set; }
    public int amountPerPylon { get; set; }
    public BaseWeapon weaponDefinition { get; set; }
    public string ammoDisplayName { get; set; }
    public int costPerPylon { get; set; }
    public bool canNotBeUsedAsLoadoutOption { get; set; }
}
