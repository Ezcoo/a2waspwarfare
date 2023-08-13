public class BRDM2ATGMINS : BaseGroundVehicle
{
    public BRDM2ATGMINS()
    {
        VehicleType = VehicleType.BRDM2ATGMINS;

        // Turret
        base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FIVEAT5BRDM2ROUND, 2},
            };
        base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDIGLA, 5},
            };
        turretPos = 0;

        inGameDisplayName = "BRDM (Igla)";
        inGameFactoryLevel = 4;
        producedFromFactoryType = FactoryType.LIGHTFACTORY;
    }
}