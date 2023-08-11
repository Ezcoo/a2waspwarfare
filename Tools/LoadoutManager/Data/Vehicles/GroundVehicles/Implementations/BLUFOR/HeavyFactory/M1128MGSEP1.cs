public class M1128MGSEP1 : BaseGroundVehicle
{
    public M1128MGSEP1()
    {
        VehicleType = VehicleType.M1128MGSEP1;

        // Turret
        base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUND105MMAPDS, 0},
            };
        base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUND105MMAPDS, 2},
            };
        //turretPos = 0;

        inGameDisplayName = "Stryker MGS";
        inGameFactoryLevel = 4;
        producedFromFactoryType = FactoryType.LIGHTFACTORY;
    }
}