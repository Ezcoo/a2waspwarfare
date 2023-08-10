public class T34TKGUEEP1 : BaseVehicle
{
    public T34TKGUEEP1()
    {
        VehicleType = VehicleType.T34TKGUEEP1;

        //weapons[] = {
        //            "ZiS_S_53",
        //            "DT_veh"
        //        };
        //selectionFireAnim = "zasleh";
        //magazines[] = {
        //            "10Rnd_85mmAP",
        //            "33Rnd_85mmHE",
        //            "60Rnd_762x54_DT",
        //            "60Rnd_762x54_DT",
        //            "60Rnd_762x54_DT",
        //            "60Rnd_762x54_DT",
        //            "60Rnd_762x54_DT"
        //        };

        // Driver seat
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXTYROUND762X54DT, 0},
                { AmmunitionType.TENROUND85MMAPZIS, 0},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXTYROUND762X54DT, 14},
                { AmmunitionType.TENROUND85MMAPZIS, 2},
            };

        // Turret
        base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXTYROUND762X54DT, 0},
            };
        base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXTYROUND762X54DT, 10},
            };
        turretPos = 1;

        inGameDisplayName = "T-34";
        inGameFactoryLevel = 1;
        producedFromFactoryType = FactoryType.HEAVYFACTORY;
    }
}