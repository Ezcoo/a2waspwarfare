public class MI24V : BaseHelicopter
{
    public MI24V()
    {
        VehicleType = VehicleType.MI24V;
        pylonAmount = 2;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 4},
                { AmmunitionType.FOURTYROUNDS8, 4},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };

        inGameDisplayName = "Mi-24V";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}