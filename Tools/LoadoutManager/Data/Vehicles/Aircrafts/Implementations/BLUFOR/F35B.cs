public class F35B : BaseAircraft
{
    public F35B()
    {
        VehicleType = VehicleType.F35B;
        pylonAmount = 6;

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.THREEHUNDREDROUNDGAU12, 2},
                { AmmunitionType.TWOROUNDGBU12, 2},
                { AmmunitionType.TWOROUNDSIDEWINDER, 2},
            };

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDGBU12, 2},
                { AmmunitionType.TWOROUNDSIDEWINDER, 2},
                { AmmunitionType.TWOROUNDMAVERICK, 2},
                { AmmunitionType.THREEHUNDREDROUNDGAU12, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDGBU12, 0 },
            { AmmunitionType.TWOROUNDSIDEWINDER, 0 },
            { AmmunitionType.TWOROUNDMAVERICK, 0 },
        };

        inGameDisplayName = "F-35B";
        inGameFactoryLevel = 5;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}