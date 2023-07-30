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

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDR73, 0 },
            { AmmunitionType.FOURROUNDFAB250, 0 },
            { AmmunitionType.BASECH29, 0 },
            { AmmunitionType.FOURTYROUNDS8, 0 },
        };
    }
}