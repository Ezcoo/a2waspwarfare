public class SU25TKEP1 : BaseAircraft
{
    public SU25TKEP1()
    {
        AircraftType = AircraftType.SU25TKEP1;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDFAB250, 2},
                { AmmunitionType.FOURROUNDR73, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.FOURROUNDFAB250, 0 },
            { AmmunitionType.BASECH29, 0 },
            { AmmunitionType.SIXTYFOURROUNDS5, 0 },
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };
    }
}