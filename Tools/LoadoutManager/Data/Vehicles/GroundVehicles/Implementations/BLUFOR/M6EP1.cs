public class M6EP1 : BaseGroundVehicle
{
    public M6EP1()
    {
        VehicleType = VehicleType.M6EP1;

        //weapons[] = {
        //            "M242BC",
        //            "M240BC_veh",
        //            "StingerLaucher_4x" removed
        //        };
        //magazines[] = {
        //            "1200Rnd_762x51_M240",
        //            "4Rnd_Stinger", removed
        //            "4Rnd_Stinger", removed
        //            "4Rnd_Stinger", removed
        //            "210Rnd_25mm_M242_APDS",
        //            "210Rnd_25mm_M242_HEI",
        //            "210Rnd_25mm_M242_APDS",
        //            "210Rnd_25mm_M242_HEI"
        //        };

        // Driver seat
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.VANILLA_FOURROUNDSTINGER, 6},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.VANILLA_EIGHTROUNDTUNGUSKA, 2},
            };

        //// Turret
        //base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //    {
        //        { AmmunitionType.SIXROUNDCH29, 2},
        //        { AmmunitionType.FOURROUNDR73, 2},
        //    };
        //base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
        //    {
        //        { AmmunitionType.SIXROUNDCH29, 2},
        //        { AmmunitionType.TWOROUNDR73, 4},
        //    };
        //turretPos = -1;

        inGameDisplayName = "M6 Linebacker";
        inGameFactoryLevel = 4;
        producedFromFactoryType = FactoryType.HEAVYFACTORY;
    }
}