public abstract class BaseAircraft : InterfaceAircraft
{
    AircraftType InterfaceAircraft.Type { get; set; }
    public int PylonAmount { get; set; }
    public Loadout DefaultLoadout { get; set; }
    public List<Loadout> EASALoadouts { get; set; }
}