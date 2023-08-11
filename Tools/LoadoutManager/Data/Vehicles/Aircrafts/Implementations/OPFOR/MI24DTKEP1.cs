public class MI24DTKEP1 : BaseHelicopter
{
    public MI24DTKEP1()
    {
        VehicleType = VehicleType.MI24DTKEP1;
        pylonAmount = 2;

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.VANILLA_ONEHUNDREDTWENTYEIGHTFOURROUNDS5, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
            };

        inGameDisplayName = "Mi-24D";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}