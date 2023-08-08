using System;

public interface InterfaceAircraft
{
    public AircraftType AircraftType { get; set; }
    public int pylonAmount { get; set; }
    public Dictionary<AmmunitionType, int> allowedAmmunitionTypesWithTheirLimitationAmount { get; set; }
    public Loadout defaultLoadout { get; set; }
    public string inGameDisplayName { get; set; }
    public int inGameAircraftFactoryLevel { get; set; }
    public bool addToDefaultLoadoutPrice { get; set; }
    public Dictionary<AmmunitionType, float> ammunitionTypeCostFloatModifier { get; set; }

    public void GenerateLoadoutsForTheAircraft();
    public void GenerateCommonBalanceInitForTheAircraft();
}
