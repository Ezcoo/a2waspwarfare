public class SU25T : BaseAircraft
{
    public SU25T()
    {
        VehicleType = VehicleType.SU25T;
        pylonAmount = 8;

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
                { AmmunitionType.FOURROUNDATAKA, 4},
                { AmmunitionType.TWOROUNDR73, 2},
                { AmmunitionType.FOURTYROUNDS8, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.FOURTYROUNDS8, 0 },
            { AmmunitionType.FOURROUNDATAKA, 0 },
            { AmmunitionType.TWOROUNDGBU12, 6 },
            { AmmunitionType.TWOROUNDR73, 2 },
        };

        inGameDisplayName = "Su-25T";
        inGameFactoryLevel = 4;
    }
}