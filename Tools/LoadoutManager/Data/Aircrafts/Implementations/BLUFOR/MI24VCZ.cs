public class MI24VCZ : BaseHelicopter
{
    public MI24VCZ()
    {
        AircraftType = AircraftType.MI24VCZ;
        pylonAmount = 2;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDATAKA, 4},
                { AmmunitionType.FOURTYROUNDS8, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSTINGER, 0 },
        };

        inGameDisplayName = "Mi-24 (CZ)";
        inGameAircraftFactoryLevel = 3;
            
        addToDefaultLoadoutPrice = true;
    }
}