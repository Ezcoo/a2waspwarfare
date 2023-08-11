public class A10A : BaseAircraft
{
    public A10A()
    {
        VehicleType = VehicleType.A10A;
        pylonAmount = 4;

        //weapons[] = {
        //    "GAU8",
        //    "MaverickLauncher",
        //    "SidewinderLaucher_AH1Z",
        //    "BombLauncherA10",
        //    "FFARLauncher_14",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "1350Rnd_30mmAP_A10",
        //    "2Rnd_Maverick_A10",
        //    "2Rnd_Sidewinder_AH1Z",
        //    "4Rnd_GBU12",
        //    "14Rnd_FFAR",
        //    "120Rnd_CMFlare_Chaff_Magazine"
        //};

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURTEENROUNDHYDRA, 2},
                { AmmunitionType.FOURROUNDGBU12, 2},
                { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2},
                { AmmunitionType.TWOROUNDMAVERICK, 2},
            };
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