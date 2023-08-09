public class AH64A : BaseHelicopter
{
    public AH64A()
    {
        VehicleType = VehicleType.AH64A;
        pylonAmount = 2;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDTOWTWO, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "AH-64A";
        inGameFactoryLevel = 3;
            
        addToDefaultLoadoutPrice = true;
    }
}