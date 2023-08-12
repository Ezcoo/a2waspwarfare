public class WILDCAT : BaseHelicopter
{
    public WILDCAT()
    {
        VehicleType = VehicleType.WILDCAT;
        pylonAmount = 4;

        //weapons[] = {
        //            "Laserdesignator_mounted"
        //        };
        //magazines[] = {
        //            "Laserbatteries"
        //        };

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.LASERBATTERIES, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.LASERBATTERIES, 2},
            };

        //weapons[] = {
        //    "CRV7_PG",
        //    "M621",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "12Rnd_CRV7",
        //    "1200Rnd_20mm_M621",
        //    "120Rnd_CMFlareMagazine"
        //};

        base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.WARNING_GAME_CRASH_DO_NOT_USE_IN_LOADOUTS_TWELVEROUNDCRV7PG, 2},
                { AmmunitionType.ONETHOUSANDTWOHUNDREDROUND20MMM261, 2},
            };
        base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDSPIKE, 4},
                { AmmunitionType.TWOHUNDREDROUNDCTWSHE, 2},
                { AmmunitionType.TWOHUNDREDROUNDCTWSSABOT, 2},
                { AmmunitionType.SIXROUNDCRV7HEPD, 4},
            };

        turretPos = 0;

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSPIKE, 4 },
            { AmmunitionType.TWOROUNDSTINGER, 4 },
        };

        inGameDisplayName = "Wildcat AH11";
        inGameFactoryLevel = 3;

        addToDefaultLoadoutPrice = true;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
    }
}