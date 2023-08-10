public class SU25A : BaseAircraft
{
    public SU25A()
    {
        VehicleType = VehicleType.SU25A;
        pylonAmount = 6;

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
                { AmmunitionType.FOURROUNDFAB250, 6},
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 0 },
            { AmmunitionType.TWOROUNDIGLA, 2 },
            { AmmunitionType.SIXTYFOURROUNDS5, 0 },
            { AmmunitionType.THREEHUNDREDSIXTYGSH301ROUNDS, 2 },
        };

        inGameDisplayName = "Su-25A";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}