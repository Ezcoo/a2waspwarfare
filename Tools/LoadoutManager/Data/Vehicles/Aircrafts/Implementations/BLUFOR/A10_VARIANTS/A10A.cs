public class A10A : BaseAircraft
{
    public A10A()
    {
        VehicleType = VehicleType.A10A;
        pylonAmount = 4;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 2 },
                { AmmunitionType.SIXROUNDMK82, 2 },
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 0 },
            { AmmunitionType.SIXROUNDMK82, 0 },
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "A-10A";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}