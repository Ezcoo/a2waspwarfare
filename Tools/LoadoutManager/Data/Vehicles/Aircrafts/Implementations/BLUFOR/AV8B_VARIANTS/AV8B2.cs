public class AV8B2 : BaseAircraft
{
    public AV8B2()
    {
        VehicleType = VehicleType.AV8B2;
        pylonAmount = 8;

        //weapons[] = {
        //    "GAU12",
        //    "Mk82BombLauncher_6",
        //    "SidewinderLaucher_AH1Z",
        //    "FFARLauncher_14",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "300Rnd_25mm_GAU12",
        //    "6Rnd_Mk82",
        //    "2Rnd_Sidewinder_AH1Z",
        //    "14Rnd_FFAR",
        //    "120Rnd_CMFlare_Chaff_Magazine"
        //};

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.THREEHUNDREDROUNDGAU12, 2},
                { AmmunitionType.VANILLA_SIXROUNDGBU12, 2},
                { AmmunitionType.SIXROUNDMK82, 2},
                { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.THREEHUNDREDROUNDGAU12, 2},
                { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2},
                { AmmunitionType.TWOROUNDMAVERICK, 6},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDGBU12, 0 },
            { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 0 },
            { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 4 },
            { AmmunitionType.TWOROUNDMAVERICK, 0},
            { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            { AmmunitionType.SIXROUNDMK82, 0},
        };

        inGameDisplayName = "AV8B";
        inGameFactoryLevel = 5;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}