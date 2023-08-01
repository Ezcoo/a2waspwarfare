public class L39TKEP1 : BaseAircraft
{
    public L39TKEP1()
    {
        AircraftType = AircraftType.L39TKEP1;
        pylonAmount = 4;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
                { AmmunitionType.TWOROUNDR73, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 0 },
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.FOURTYROUNDS8, 0 },
            { AmmunitionType.SIXTYFOURROUNDS5, 0 },
            { AmmunitionType.FOURROUNDATAKA, 0 },
            { AmmunitionType.TWOROUNDGBU12, 2 },
        };

        inGameDisplayName = "L-39";
        inGameAircraftFactoryLevel = 3;
    }
}