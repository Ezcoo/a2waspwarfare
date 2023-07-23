public class SU34 : BaseAircraft
{
    public SU34()
    {
        Type = AircraftType.SU34;
        PylonAmount = 10;


        Loadout defaultLoadout = new();
        defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.R73, 10},
            };

        DefaultLoadout = defaultLoadout;

        AllowedAmmunitionTypes = new List<AmmunitionType>
        {
            AmmunitionType.R73,
        };
    }

    public AircraftType Type { get; }
}