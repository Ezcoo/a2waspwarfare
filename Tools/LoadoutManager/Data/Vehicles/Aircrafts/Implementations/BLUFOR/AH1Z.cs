public class AH1Z : BaseHelicopter
{
    public AH1Z()
    {
        VehicleType = VehicleType.AH1Z;
        pylonAmount = 4;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 4},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSIDEWINDER, 2 },
            { AmmunitionType.EIGHTROUNDHELLFIRE, 4},
        };

        inGameDisplayName = "AH-1Z";
        inGameFactoryLevel = 5;
            
        addToDefaultLoadoutPrice = true;
    }
}