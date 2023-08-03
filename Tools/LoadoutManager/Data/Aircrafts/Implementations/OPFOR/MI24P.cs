public class MI24P : BaseHelicopter
{
    public MI24P()
    {
        AircraftType = AircraftType.MI24P;
        pylonAmount = 2;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 2},
                { AmmunitionType.FOURTYROUNDS8, 2},
                { AmmunitionType.TWOROUNDFAB250, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.SIXROUNDFAB250, 2 },
            { AmmunitionType.TWOROUNDIGLA, 2 },
        };

        inGameDisplayName = "Mi-24P";
        inGameAircraftFactoryLevel = 3;
            
        addToDefaultLoadoutPrice = true;
    }
}