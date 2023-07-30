public class SU39 : BaseAircraft
{
    public SU39()
    {
        AircraftType = AircraftType.SU39;
        pylonAmount = 8;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDCH29, 2},
                { AmmunitionType.TWOROUNDR73, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 2 },
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.BASECH29, 0 },
            { AmmunitionType.FOURTYROUNDS8, 0 },
            { AmmunitionType.TWOROUNDGBU12, 6 },
        };
    }
}