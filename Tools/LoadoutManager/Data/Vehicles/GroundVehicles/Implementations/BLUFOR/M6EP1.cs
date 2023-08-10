public class M6EP1 : BaseVehicle
{
    public M6EP1()
    {
        VehicleType = VehicleType.M6EP1;

        // Pilot seat
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.VANILLA_FOURTYROUNDS8, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURTYROUNDS8, 2},
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
    }
}