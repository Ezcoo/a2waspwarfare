public class A10C : BaseAircraft
{
    public A10C()
    {
        VehicleType = VehicleType.A10C;
        pylonAmount = 8;
        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2},
                { AmmunitionType.TWOROUNDMAVERICK, 2},
                { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 2},
                { AmmunitionType.SIXROUNDMK82, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDGBU12, 8 },
            { AmmunitionType.TWOROUNDSIDEWINDER_AH1Z, 2 },
            { AmmunitionType.TWOROUNDMAVERICK, 0 },
            { AmmunitionType.THIRTYEIGHTROUNDHYDRA, 0 },
            { AmmunitionType.SIXROUNDMK82, 0 },
            { AmmunitionType.EIGHTROUNDHELLFIRE, 4 },
        };

        inGameDisplayName = "A-10C";
        inGameFactoryLevel = 4;
    }
}