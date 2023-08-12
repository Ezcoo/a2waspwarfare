public class AH64A : BaseHelicopter
{
    public AH64A()
    {
        VehicleType = VehicleType.AH64A;
        pylonAmount = 2;

        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDTOWTWO, 2},
            };

        //weapons[] = {
        //            "M230",
        //            "SidewinderLaucher_AH64" ????
        //        };
        //magazines[] = {
        //            "1200Rnd_30x113mm_M789_HEDP",
        //            "8Rnd_Sidewinder_AH64" ????
        //        };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "AH-64A";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.AIRCRAFTFACTORY;

        addToDefaultLoadoutPrice = true;
    }
}