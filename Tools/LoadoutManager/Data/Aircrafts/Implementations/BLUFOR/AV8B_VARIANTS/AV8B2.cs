public class AV8B2 : BaseAircraft
{
    public AV8B2()
    {
        AircraftType = AircraftType.AV8B2;
        pylonAmount = 8;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 2},
                { AmmunitionType.TWOROUNDMAVERICK, 6},
                { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDGBU12, 0 },
            { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 2 },
            { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2 },
            { AmmunitionType.TWOROUNDMAVERICK, 0},
            { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            { AmmunitionType.SIXROUNDMK82, 0},
        };

        inGameDisplayName = "AV8B";
        inGameAircraftFactoryLevel = 5;
    }
}