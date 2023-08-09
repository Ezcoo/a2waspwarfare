using System;

public interface InterfaceAircraft
{
    public int pylonAmount { get; set; }
    public Dictionary<AmmunitionType, int> allowedAmmunitionTypesWithTheirLimitationAmount { get; set; }
    public bool addToDefaultLoadoutPrice { get; set; }
    public Dictionary<AmmunitionType, float> ammunitionTypeCostFloatModifier { get; set; }

    public string GenerateLoadoutsForTheAircraft();
}
