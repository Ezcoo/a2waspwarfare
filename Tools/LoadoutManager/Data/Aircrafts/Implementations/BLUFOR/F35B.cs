public class F35B : BaseAircraft
{
    public F35B()
    {
        AircraftType = AircraftType.F35B;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDGBU12, 2},
                { AmmunitionType.TWOROUNDSIDEWINDER, 2},
                { AmmunitionType.TWOROUNDMAVERICK, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDGBU12, 0 },
            { AmmunitionType.TWOROUNDSIDEWINDER, 0 },
            { AmmunitionType.TWOROUNDMAVERICK, 0 },
        };
    }
}