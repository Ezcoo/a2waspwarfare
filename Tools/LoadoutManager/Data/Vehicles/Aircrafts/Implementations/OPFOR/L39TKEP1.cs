public class L39TKEP1 : BaseAircraft
{
    public L39TKEP1()
    {
        VehicleType = VehicleType.L39TKEP1;
        pylonAmount = 4;

        //weapons[] = {
        //    "GSh23L_L39",
        //    "57mmLauncher"
        //};
        //magazines[] = {
        //    "150Rnd_23mm_GSh23L",
        //    "64Rnd_57mm"
        //};

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                //{ AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 2},
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDR73, 2},
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
                { AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 0 },
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.SIXTYFOURROUNDS5, 0 },
            { AmmunitionType.FOURROUNDATAKA, 0 },
            //{ AmmunitionType.TWOROUNDGBU12, 2 },
        };

        inGameDisplayName = "L-39";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}