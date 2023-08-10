public class AN2TKEP1 : BaseAircraft
{
    public AN2TKEP1()
    {
        VehicleType = VehicleType.AN2TKEP1;
        pylonAmount = 10;

        // Pilot seat
        base.vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {

            };
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE, 2},
                { AmmunitionType.FIVEHUNDREDROUNDTWINVICKERS, 2},
                { AmmunitionType.FOURROUNDFAB250, 2},
            };

        inGameDisplayName = "An-2";
        inGameFactoryLevel = 1;
    }
}