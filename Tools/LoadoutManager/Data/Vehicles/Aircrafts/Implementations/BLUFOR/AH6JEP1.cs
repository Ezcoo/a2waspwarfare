public class AH6JEP1 : BaseHelicopter
{
    public AH6JEP1()
    {
        VehicleType = VehicleType.AH6JEP1;
        pylonAmount = 0;

        //weapons[] = {
        //    "FFARLauncher_14",
        //    "TwinM134",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "14Rnd_FFAR",
        //    "4000Rnd_762x51_M134",
        //    "60Rnd_CMFlareMagazine"
        //};

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURTEENROUNDHYDRA, 0},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURTEENROUNDHYDRA, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
        };

        inGameDisplayName = "AH-6J";
        inGameFactoryLevel = 2;

        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}