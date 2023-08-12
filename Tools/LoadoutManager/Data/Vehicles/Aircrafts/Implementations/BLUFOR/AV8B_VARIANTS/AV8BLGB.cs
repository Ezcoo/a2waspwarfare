public class AV8BLGB : BaseAircraft
{
    public AV8BLGB()
    {
        VehicleType = VehicleType.AV8BLGB;
        pylonAmount = 8;

        //weapons[] = {
        //    "GAU12",
        //    "BombLauncher",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "300Rnd_25mm_GAU12",
        //    "6Rnd_GBU12_AV8B",
        //    "120Rnd_CMFlare_Chaff_Magazine"
        //};

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                //{ AmmunitionType.THREEHUNDREDROUNDGAU12, 2},
                { AmmunitionType.VANILLA_SIXROUNDGBU12, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                //{ AmmunitionType.THREEHUNDREDROUNDGAU12, 2},
                { AmmunitionType.TWOROUNDGBU12, 6},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDGBU12, 0 },
            { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 2 },
        };

        inGameDisplayName = "AV8B (LGB)";
        inGameFactoryLevel = 4;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}