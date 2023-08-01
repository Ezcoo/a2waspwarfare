public class SU39 : BaseAircraft
{
    public SU39()
    {
        AircraftType = AircraftType.SU39;
        pylonAmount = 10;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDCH29, 2},
                { AmmunitionType.TWOROUNDR73, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.FOURTYROUNDS8, 0 },
            { AmmunitionType.TWELVEROUNDSVIKHR, 4 },
            { AmmunitionType.BASECH29, 0 },
            { AmmunitionType.TWOROUNDGBU12, 8 },
            { AmmunitionType.FOURROUNDR73, 4 },
        };

        inGameDisplayName = "Su-39";
        inGameAircraftFactoryLevel = 5;
    }
}