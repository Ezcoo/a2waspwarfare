public class MLRSDESEP1 : BaseGroundVehicle
{
    public MLRSDESEP1()
    {
        VehicleType = VehicleType.MLRSDESEP1;

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

        inGameDisplayName = "MLRS (Desert)";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.HEAVYFACTORY;
    }
}