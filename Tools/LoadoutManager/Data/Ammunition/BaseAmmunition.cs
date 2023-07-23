public abstract class BaseAmmunition : InterfaceAmmunition
{
    AmmunitionType InterfaceAmmunition.Type { get; set; }
    public int AmountPerPylon { get; set; }
    public BaseWeapon WeaponDefinition { get; set; }
    public int CostPerPylon { get; set; }
}