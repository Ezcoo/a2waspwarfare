public class SU25A : BaseAircraft
{
    public SU25A()
    {
        VehicleType = VehicleType.SU25A;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDFAB250, 4},
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.TWOROUNDIGLA, 2 },
            { AmmunitionType.SIXTYFOURROUNDS5, 0 },
            { AmmunitionType.THREEHUNDREDSIXTYGSH301ROUNDS, 2 },
        };

        inGameDisplayName = "Su-25A";
        inGameFactoryLevel = 3;
    }
}