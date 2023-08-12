public class MI24VCZ : BaseHelicopter
{
    public MI24VCZ()
    {
        VehicleType = VehicleType.MI24VCZ;
        pylonAmount = 4;

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDATAKA, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDATAKA, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.EIGHTROUNDATAKA, 2 },
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "Mi-24V (CZ)";
        inGameFactoryLevel = 3;

        addToDefaultLoadoutPrice = true;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}