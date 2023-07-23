using System;

public interface InterfaceAircraft
{
    public AircraftType Type { get; set; }
    public int PylonAmount { get; set; }
    public List<AmmunitionType> AllowedAmmunitionTypes { get; set; }
    public Loadout DefaultLoadout { get; set; }


}
