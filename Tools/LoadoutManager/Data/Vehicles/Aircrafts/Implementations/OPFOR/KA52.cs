public class KA52 : BaseHelicopter
{
    public KA52()
    {
        VehicleType = VehicleType.KA52;
        pylonAmount = 2;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURTYROUNDS8, 2},
                { AmmunitionType.FOURROUNDATAKA, 5},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };

        inGameDisplayName = "Ka-52";
        inGameFactoryLevel = 4;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}