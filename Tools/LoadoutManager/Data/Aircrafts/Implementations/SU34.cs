public class SU34 : BaseAircraft
{
    public SU34()
    {
        AircraftType = AircraftType.SU34;
        PylonAmount = 10;

        Loadout defaultLoadout = new();
        defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.R73, 8},
                { AmmunitionType.TWOROUNDFAB250, 2},
            };

        DefaultLoadout = defaultLoadout;

        AllowedAmmunitionTypes = new List<AmmunitionType>
        {
            AmmunitionType.R73,
            AmmunitionType.TWOROUNDFAB250,
        };
    }
}