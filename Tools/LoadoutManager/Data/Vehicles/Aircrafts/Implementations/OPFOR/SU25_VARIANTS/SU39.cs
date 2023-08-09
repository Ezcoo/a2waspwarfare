public class SU39 : BaseAircraft
{
    public SU39()
    {
        VehicleType = VehicleType.SU39;
        pylonAmount = 10;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWELVEROUNDSVIKHR, 2},
                { AmmunitionType.TWOROUNDR73, 2},
                { AmmunitionType.FOURTYROUNDS8, 4},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.FOURTYROUNDS8, 0 },
            { AmmunitionType.TWELVEROUNDSVIKHR, 4 },
            { AmmunitionType.BASECH29, 0 },
            { AmmunitionType.TWOROUNDGBU12, 8 },
            { AmmunitionType.TWOROUNDR73, 4 },
        };

        inGameDisplayName = "Su-39";
        inGameFactoryLevel = 5;
    }
}