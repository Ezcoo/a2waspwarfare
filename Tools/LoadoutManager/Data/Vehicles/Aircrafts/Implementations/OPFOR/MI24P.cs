public class MI24P : BaseHelicopter
{
    public MI24P()
    {
        VehicleType = VehicleType.MI24P;
        pylonAmount = 2;

        //weapons[] = {
        //    "S8Launcher",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "80Rnd_80mm",
        //    "120Rnd_CMFlareMagazine"
        //};

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.VANILLA_EIGHTYROUNDS8, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 2},
                { AmmunitionType.FOURTYROUNDS8, 2},
                { AmmunitionType.TWOROUNDFAB250, 2},
            };

        base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SEVENHUNDREDFIFTY30MMGSH301ROUNDS, 0},
            };
        base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SEVENHUNDREDFIFTY30MMGSH301ROUNDS, 4},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 2 },
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };

        inGameDisplayName = "Mi-24P";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;
        turretPos = -1;

        addToDefaultLoadoutPrice = true;
    }
}