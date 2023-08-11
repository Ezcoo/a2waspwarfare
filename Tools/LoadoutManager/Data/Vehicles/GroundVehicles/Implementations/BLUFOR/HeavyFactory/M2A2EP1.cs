public class M2A2EP1 : BaseGroundVehicle
{
    public M2A2EP1()
    {
        VehicleType = VehicleType.M2A2EP1;

        //weapons[] = {
        //            "M242BC",
        //            "M240BC_veh",
        //            "TOWLauncher"
        //        };
        //magazines[] = {
        //            "1200Rnd_762x51_M240",
        //            "2Rnd_TOW2",
        //            "2Rnd_TOW2",
        //            "2Rnd_TOW2",
        //            "2Rnd_TOW2",
        //            "2Rnd_TOW2",
        //            "210Rnd_25mm_M242_APDS",
        //            "210Rnd_25mm_M242_HEI",
        //            "210Rnd_25mm_M242_APDS",
        //            "210Rnd_25mm_M242_HEI"
        //        };

        // Driver seat
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDTOWTWO, 10},
                { AmmunitionType.TWOHUNDREDTENROUND25MMM242HEI_BC, 2},
                { AmmunitionType.TWOHUNDREDTENROUND25MMM242APDS_BC, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOHUNDREDTENROUND25MMM242HEI, 0},
                { AmmunitionType.TWOHUNDREDTENROUND25MMM242APDS, 0},
            };

        inGameDisplayName = "M2A2 Bradley";
        inGameFactoryLevel = 1;
        producedFromFactoryType = FactoryType.HEAVYFACTORY;
    }
}