public class SU25INS : BaseAircraft
{
    public SU25INS()
    {
        AircraftType = AircraftType.SU25INS;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDCH29, 2},
                { AmmunitionType.FOURROUNDR73, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 0 },
            { AmmunitionType.FOURROUNDFAB250, 0 },
            { AmmunitionType.BASECH29, 0 },
            { AmmunitionType.SIXTYFOURROUNDS5, 0 },
        };
    }
}