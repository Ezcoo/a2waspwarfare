public class MI24V : BaseHelicopter
{
    public MI24V()
    {
        VehicleType = VehicleType.MI24V;
        pylonAmount = 4;

        //weapons[] = {
        //            "YakB",
        //            "AT6Launcher"
        //        };
        //magazines[] = {
        //            "1470Rnd_127x108_YakB",
        //            "4Rnd_AT6_Mi24V"
        //        };

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURAT6SHTURMLAUNCHER, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 2},
            };

        //weapons[] = {
        //    "S8Launcher",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "80Rnd_80mm",
        //    "120Rnd_CMFlareMagazine"
        //};

        //base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //    {
        //        { AmmunitionType.VANILLA_EIGHTYROUNDS8, 2},
        //    };
        //base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //    {
        //        { AmmunitionType.FOURTYROUNDS8, 4},
        //    };
        //turretPos = -1;

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.FOURROUNDATAKA, 2},
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };

        inGameDisplayName = "Mi-24V";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}