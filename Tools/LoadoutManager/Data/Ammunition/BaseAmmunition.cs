public abstract class BaseAmmunition : InterfaceAmmunition
{
    public AmmunitionType AmmunitionType { get => ammunitionType; set => ammunitionType = value; }

    private AmmunitionType ammunitionType { get; set; }
    public int AmountPerPylon { get; set; }
    public BaseWeapon WeaponDefinition { get; set; }
    public int CostPerPylon { get; set; }

}