public class APACHEAH1 : BaseHelicopter
{
    public APACHEAH1()
    {
        AircraftType = AircraftType.APACHEAH1;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "Apache AH1";
        inGameAircraftFactoryLevel = 4;
            
        addToDefaultLoadoutPrice = true;
    }
}