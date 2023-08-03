public class AH64DEP1 : BaseHelicopter
{
    public AH64DEP1()
    {
        AircraftType = AircraftType.AH64DEP1;
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

        inGameDisplayName = "AH-64D (Longbow)";
        inGameAircraftFactoryLevel = 4;
            
        addToDefaultLoadoutPrice = true;
    }
}