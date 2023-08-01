public class SU25A : BaseAircraft
{
    public SU25A()
    {
        AircraftType = AircraftType.SU25A;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDFAB250, 4},
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.SIXTYFOURROUNDS5, 0 },
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };

        inGameDisplayName = "Su-25A";
        inGameAircraftFactoryLevel = 3;
    }
}