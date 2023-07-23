public abstract class BaseAircraft : InterfaceAircraft
{
    public AircraftType AircraftType { get => aircraftType; set => aircraftType = value; }

    private AircraftType aircraftType { get; set; }
    public int PylonAmount { get; set; }
    public List<AmmunitionType> AllowedAmmunitionTypes { get; set; }
    public Loadout DefaultLoadout { get; set; }
}