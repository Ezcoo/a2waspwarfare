public abstract class BaseAircraft : InterfaceAircraft
{
    AircraftType InterfaceAircraft.Type { get; set; }
    public int PylonAmount { get; set; }
    public List<AmmunitionType> AllowedAmmunitionTypes { get; set; }
    public Loadout DefaultLoadout { get; set; }
}