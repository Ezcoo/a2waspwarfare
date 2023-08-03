public class KA52BLACK : BaseHelicopter
{
    public KA52BLACK()
    {
        AircraftType = AircraftType.KA52;
        pylonAmount = 2;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURTYROUNDS8, 2},
                { AmmunitionType.TWELVEROUNDSVIKHR, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 2 },
        };

        inGameDisplayName = "Ka-52 (Black)";
        inGameAircraftFactoryLevel = 5;
            
        addToDefaultLoadoutPrice = true;
    }
}