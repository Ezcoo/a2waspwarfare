public class SU39 : BaseAircraft
{
    public SU39()
    {
        AircraftType = AircraftType.SU39;
        pylonAmount = 6;

        Loadout defaultLoadout = new();
        defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDCH29, 2},
                { AmmunitionType.FOURROUNDR73, 2},
            };

        base.defaultLoadout = defaultLoadout;

        allowedAmmunitionTypes = new List<AmmunitionType>
        {
            AmmunitionType.TWOROUNDR73,
            AmmunitionType.FOURROUNDFAB250,
            AmmunitionType.BASECH29,
            AmmunitionType.FOURTYROUNDS8,
        };
    }
}