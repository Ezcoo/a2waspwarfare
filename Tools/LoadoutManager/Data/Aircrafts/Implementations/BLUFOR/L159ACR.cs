public class L159ACR : BaseAircraft
{
    public L159ACR()
    {
        AircraftType = AircraftType.L159ACR;
        pylonAmount = 6;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDGBU12, 2},
                { AmmunitionType.TWOROUNDSIDEWINDER, 2},
                { AmmunitionType.TWOROUNDMAVERICK, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDGBU12, 2 },
            { AmmunitionType.TWOROUNDSIDEWINDER, 4 },
            { AmmunitionType.TWOROUNDMAVERICK, 0 },
            { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 0 },
            { AmmunitionType.THREEROUNDMK82, 0 },
            { AmmunitionType.EIGHTROUNDHELLFIRE, 2 },
        };
    }
}