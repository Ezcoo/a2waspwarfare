public class AH1Z : BaseHelicopter
{
    public AH1Z()
    {
        VehicleType = VehicleType.AH1Z;
        pylonAmount = 4;

        //weapons[] = {
        //            "M197",
        //            "HellfireLauncher",
        //            "SidewinderLaucher_AH1Z"
        //        };
        //magazines[] = {
        //            "750Rnd_M197_AH1",
        //            "8Rnd_Hellfire",
        //            "2Rnd_Sidewinder_AH1Z"
        //        };


        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 0},
                { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            };
        turretPos = 0;

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSIDEWINDER, 2 },
            { AmmunitionType.EIGHTROUNDHELLFIRE, 4},
        };

        inGameDisplayName = "AH-1Z";
        inGameFactoryLevel = 5;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}