public class AV8BLGB : BaseAircraft
{
    public AV8BLGB()
    {
        AircraftType = AircraftType.AV8BLGB;
        pylonAmount = 8;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.THREEHUNDREDROUNDGAU12, 2},
                { AmmunitionType.TWOROUNDGBU12, 6},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDGBU12, 0 },
            { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 2 },
        };

        inGameDisplayName = "AV8B (LGB)";
        inGameAircraftFactoryLevel = 4;

        addToDefaultLoadoutPrice = true;
    }
}