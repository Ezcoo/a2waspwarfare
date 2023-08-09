public class AH64DEP1 : BaseHelicopter
{
    public AH64DEP1()
    {
        VehicleType = VehicleType.AH64DEP1;
        pylonAmount = 4;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.EIGHTROUNDHELLFIRE, 2},
            { AmmunitionType.TWOROUNDSTINGER, 2 },
        };

        inGameDisplayName = "AH-64D (Longbow)";
        inGameFactoryLevel = 4;
            
        addToDefaultLoadoutPrice = true;
    }
}