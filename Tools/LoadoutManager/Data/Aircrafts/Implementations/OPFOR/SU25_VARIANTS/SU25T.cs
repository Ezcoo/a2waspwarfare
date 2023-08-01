public class SU25T : BaseAircraft
{
    public SU25T()
    {
        AircraftType = AircraftType.SU25T;
        pylonAmount = 8;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 4},
                { AmmunitionType.TWOROUNDR73, 2},
                { AmmunitionType.FOURTYROUNDS8, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.FOURTYROUNDS8, 0 },
            { AmmunitionType.FOURROUNDATAKA, 0 },
            { AmmunitionType.TWOROUNDGBU12, 6 },
            { AmmunitionType.FOURROUNDR73, 2 },
        };

        inGameDisplayName = "Su-25T";
        inGameAircraftFactoryLevel = 4;
    }
}