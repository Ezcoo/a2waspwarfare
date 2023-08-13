public class MLRS : BaseGroundVehicle
{
    public MLRS()
    {
        VehicleType = VehicleType.MLRS;

        //weapons[] = {
        //            "MLRS"
        //        };
        //magazines[] = {
        //            "12Rnd_MLRS"
        //        };

        // Driver seat
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWELVEROUNDMLRS, 0},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWELVEROUNDMLRS, 4},
            };

        inGameDisplayName = "MLRS";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.HEAVYFACTORY;
    }
}