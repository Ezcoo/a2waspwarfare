public class L39TKEP1 : BaseAircraft
{
    public L39TKEP1()
    {
        AircraftType = AircraftType.L39TKEP1;
        pylonAmount = 4;

        Loadout defaultLoadout = new();
        defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.SIXTYFOURROUNDS5, 2},
                { AmmunitionType.TWOROUNDR73, 2},
            };

        base.defaultLoadout = defaultLoadout;

        allowedAmmunitionTypes = new List<AmmunitionType>
        {
            AmmunitionType.TWOROUNDR73,
            AmmunitionType.FOURROUNDFAB250,
            AmmunitionType.FOURTYROUNDS8,
            AmmunitionType.SIXTYFOURROUNDS5,
        };
    }
}