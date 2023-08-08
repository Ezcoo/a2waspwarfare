using System;

public interface InterfaceAmmunition
{
    public List<AmmunitionType> AmmunitionTypes { get; set; }
    public int amountPerPylon { get; set; }
    public BaseWeapon weaponDefinition { get; set; }
    public string ammoDisplayName { get; set; }
    public int costPerPylon { get; set; }
    public Dictionary<int, List<AmmunitionType>> optionalAmmunitionDictionary { get; set; }
}
