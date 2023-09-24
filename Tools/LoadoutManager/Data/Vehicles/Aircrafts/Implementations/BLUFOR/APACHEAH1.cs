public class APACHEAH1 : BaseHelicopter
{
    public APACHEAH1()
    {
        VehicleType = VehicleType.APACHEAH1;
        pylonAmount = 4;

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "Apache AH1";
        inGameFactoryLevel = 4;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}