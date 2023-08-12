public class MI24P : BaseHelicopter
{
    public MI24P()
    {
        VehicleType = VehicleType.MI24P;
        pylonAmount = 4;

        //weapons[] = {
        //            "HeliBombLauncher",
        //            "AT9Launcher"
        //        };
        //magazines[] = {
        //            "2Rnd_FAB_250",
        //            "4Rnd_AT9_Mi24P"
        //        };

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 4},
                { AmmunitionType.TWOROUNDFAB250, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 2},
            };

        //weapons[] = {
        //    "GSh302",
        //    "80mmLauncher",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "750Rnd_30mm_GSh301",
        //    "40Rnd_80mm",
        //    "120Rnd_CMFlareMagazine"
        //};

        base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SEVENHUNDREDFIFTY30MMGSH301ROUNDS, 0},
                { AmmunitionType.VANILLA_FOURTYROUNDS8WITH80MMLAUNCHER, 2},
            };
        base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SEVENHUNDREDFIFTY30MMGSH301ROUNDS, 4},
                { AmmunitionType.VANILLA_FOURTYROUNDS8WITH80MMLAUNCHER, 2},
            };
        turretPos = -1;

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.FOURROUNDATAKA, 2},
            { AmmunitionType.SIXROUNDFAB250, 2 },
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };

        inGameDisplayName = "Mi-24P";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;


        addToDefaultLoadoutPrice = true;
    }
}