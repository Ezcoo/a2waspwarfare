public class L159ACR : BaseAircraft
{
    public L159ACR()
    {
        VehicleType = VehicleType.L159ACR;
        pylonAmount = 6;


        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.VANILLA_FOURROUNDMAVERICK, 2},
                { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDSPIKE, 2},
                { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 2},
                { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 4 },
            { AmmunitionType.TWOROUNDSPIKE, 0 },
            { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 0 },
            { AmmunitionType.SIXROUNDMK82, 0 },
            { AmmunitionType.EIGHTROUNDHELLFIRE, 2 },
            //{ AmmunitionType.TWOROUNDGBU12, 2 },
        };

        inGameDisplayName = "L-159";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}