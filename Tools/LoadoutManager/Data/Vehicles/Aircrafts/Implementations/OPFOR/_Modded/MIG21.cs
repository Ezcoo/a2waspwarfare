public class MIG21 : BaseAircraft
{
    public MIG21()
    {
        VehicleType = VehicleType.MIG21;
        pylonAmount = 4;

        //weapons[] = { "GSh23L", "PRACS_AA8_Launcher", "CMFlareLauncher" };
        //magazines[] = { "520Rnd_23mm_GSh23L", "PRACS_AA8x4", "60Rnd_CMFlare_Chaff_Magazine" };

        // Only test for now
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.MODDED_FOURR60ROUND, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDR73, 4},
            };
        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 4},
            { AmmunitionType.TWOROUNDGBU12, 2},
            { AmmunitionType.FOURROUNDATAKA, 2},
        };

        inGameDisplayName = "MiG-21MF Fishbed";
        inGamePrice = 49999;
        ConstructionTime = 50;
        inGameFactoryLevel = 5;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
        factionType = FactionType.MOLATIAN;

        moddedVehicle = true;
    }
}