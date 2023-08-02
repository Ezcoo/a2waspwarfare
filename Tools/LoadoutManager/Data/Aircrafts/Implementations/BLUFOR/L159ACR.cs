public class L159ACR : BaseAircraft
{
    public L159ACR()
    {
        AircraftType = AircraftType.L159ACR;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2},
                { AmmunitionType.TWOROUNDMAVERICK, 2},
                { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 4 },
            { AmmunitionType.TWOROUNDMAVERICK, 0 },
            { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 0 },
            { AmmunitionType.SIXROUNDMK82, 0 },
            { AmmunitionType.EIGHTROUNDHELLFIRE, 2 },
            //{ AmmunitionType.TWOROUNDGBU12, 2 },
        };

        inGameDisplayName = "L-159";
        inGameAircraftFactoryLevel = 3;
    }
}