public abstract class BaseAmmunition : InterfaceAmmunition
{
    public AmmunitionType AmmunitionType { get => ammunitionType; set => ammunitionType = value; }

    private AmmunitionType ammunitionType { get; set; }
    public int amountPerPylon { get; set; }
    public BaseWeapon weaponDefinition { get; set; }
    public string ammoDisplayName { get; set; }
    public int costPerPylon { get; set; }
    public bool canNotBeUsedAsLoadoutOption { get; set; }
}