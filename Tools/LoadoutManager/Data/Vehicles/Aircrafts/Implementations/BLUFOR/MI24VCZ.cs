public class MI24VCZ : BaseHelicopter
{
    public MI24VCZ()
    {
        VehicleType = VehicleType.MI24VCZ;
        pylonAmount = 6;

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 4},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 4},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.FOURROUNDATAKA, 4},
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "Mi-24V (CZ)";
        inGameFactoryLevel = 3;

        addToDefaultLoadoutPrice = true;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}