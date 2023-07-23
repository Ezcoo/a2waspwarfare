using System;

public interface InterfaceAircraft
{
    public AircraftType AircraftType { get; set; }
    public int pylonAmount { get; set; }
    public List<AmmunitionType> allowedAmmunitionTypes { get; set; }
    public Loadout defaultLoadout { get; set; }
}
