public abstract class BaseAircraft : InterfaceAircraft
{
    public AircraftType AircraftType { get => aircraftType; set => aircraftType = value; }

    private AircraftType aircraftType { get; set; }
    public int pylonAmount { get; set; }
    public List<AmmunitionType> allowedAmmunitionTypes { get; set; }
    public Loadout defaultLoadout { get; set; }
}