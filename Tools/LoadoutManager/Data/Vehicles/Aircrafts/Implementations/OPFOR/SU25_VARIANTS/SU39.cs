public class SU39 : BaseAircraft
{
    public SU39()
    {
        VehicleType = VehicleType.SU39;
        pylonAmount = 10;

        //weapons[] = {
        //    "GSh301",
        //    "AirBombLauncher",
        //    "R73Launcher_2",
        //    "S8Launcher",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "180Rnd_30mm_GSh301",
        //    "4Rnd_FAB_250",
        //    "2Rnd_R73",
        //    "80Rnd_S8T",
        //    "120Rnd_CMFlare_Chaff_Magazine"
        //};


        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDFAB250, 2},
                { AmmunitionType.TWOROUNDR73, 2},
                { AmmunitionType.VANILLA_EIGHTYROUNDS8, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWELVEROUNDSVIKHR, 2},
                { AmmunitionType.TWOROUNDR73, 2},
                { AmmunitionType.FOURTYROUNDS8, 4},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.FOURTYROUNDS8, 0 },
            { AmmunitionType.TWELVEROUNDSVIKHR, 4 },
            { AmmunitionType.BASECH29, 0 },
            { AmmunitionType.TWOROUNDGBU12, 8 },
            { AmmunitionType.TWOROUNDR73, 4 },
        };

        inGameDisplayName = "Su-39";
        inGameFactoryLevel = 5;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}