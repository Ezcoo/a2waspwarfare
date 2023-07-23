using System;

public interface InterfaceAircraft
{
    public AircraftType AircraftType { get; set; }
    public int PylonAmount { get; set; }
    public List<AmmunitionType> AllowedAmmunitionTypes { get; set; }
    public Loadout DefaultLoadout { get; set; }
}
