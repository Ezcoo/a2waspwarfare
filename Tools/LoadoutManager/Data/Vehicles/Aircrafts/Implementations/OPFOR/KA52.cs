public class KA52 : BaseHelicopter
{
    public KA52()
    {
        VehicleType = VehicleType.KA52;
        pylonAmount = 2;

        //weapons[] = {
        //    "80mmLauncher",
        //    "CMFlareLauncher"
        //};
        //magazines[] = {
        //    "40Rnd_80mm",
        //    "120Rnd_CMFlare_Chaff_Magazine"
        //};

        base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWELVEROUNDSVIKHR, 2},
            };
        base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 5},
            };

        turretPos = -1;

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };

        inGameDisplayName = "Ka-52";
        inGameFactoryLevel = 4;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}