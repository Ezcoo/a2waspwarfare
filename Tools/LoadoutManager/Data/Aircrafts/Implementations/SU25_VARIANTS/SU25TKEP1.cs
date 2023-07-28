public class SU25TKEP1 : BaseAircraft
{
    public SU25TKEP1()
    {
        AircraftType = AircraftType.SU25TKEP1;
        pylonAmount = 6;

        Loadout defaultLoadout = new();
        defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.FOURROUNDFAB250, 2},
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