public class MIG21 : BaseAircraft
{
    public MIG21()
    {
        VehicleType = VehicleType.MIG21;
        pylonAmount = 4;

        // Add weapons from mod pack to here

        // Only test for now
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                //{ AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 2},
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDR73, 2},
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
                { AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 2},
            };
        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 0 },
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.SIXTYFOURROUNDS5, 0 },
            { AmmunitionType.FOURROUNDATAKA, 0 },
            //{ AmmunitionType.TWOROUNDGBU12, 2 },
        };

        inGameDisplayName = "MiG-21";
        inGamePrice = 49999;
        ConstructionTime = 50;
        inGameFactoryLevel = 5;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
        factionType = FactionType.MOLATIAN;

        moddedVehicle = true;
    }
}