public class SU25TKEP1 : BaseAircraft
{
    public SU25TKEP1()
    {
        AircraftType = AircraftType.SU25TKEP1;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDFAB250, 2},
                { AmmunitionType.TWOROUNDR73, 2},
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