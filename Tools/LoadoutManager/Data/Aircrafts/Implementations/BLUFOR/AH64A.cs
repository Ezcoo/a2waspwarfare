public class AH64A : BaseHelicopter
{
    public AH64A()
    {
        AircraftType = AircraftType.AH64A;
        pylonAmount = 2;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDTOWTWO, 2},
                { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "AH-64A";
        inGameAircraftFactoryLevel = 3;
            
        addToDefaultLoadoutPrice = true;
    }
}