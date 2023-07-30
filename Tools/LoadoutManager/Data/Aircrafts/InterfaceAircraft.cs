using System;

public interface InterfaceAircraft
{
    public AircraftType AircraftType { get; set; }
    public int pylonAmount { get; set; }
    public Dictionary<AmmunitionType, int> allowedAmmunitionTypesWithTheirLimitationAmount { get; set; }
    public Loadout defaultLoadout { get; set; }

    public void GenerateLoadoutsForTheAircraft();
}
