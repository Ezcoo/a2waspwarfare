public class SU34 : BaseAircraft
{
    public SU34()
    {
        AircraftType = AircraftType.SU34;
        pylonAmount = 10;

        Loadout defaultLoadout = new();
        defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXROUNDCH29, 2},
                { AmmunitionType.FOURROUNDR73, 2},
            };

        base.defaultLoadout = defaultLoadout;

        allowedAmmunitionTypes = new List<AmmunitionType>
        {
            AmmunitionType.TWOROUNDR73,
            AmmunitionType.FOURROUNDFAB250,

            //KH29 (atm limited to 4 and 6 pylons)
            AmmunitionType.BASECH29,


            //S8 rockets

        };
    }
}