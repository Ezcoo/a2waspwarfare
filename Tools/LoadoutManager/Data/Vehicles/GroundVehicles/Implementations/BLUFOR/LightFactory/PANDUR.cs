public class PANDUR : BaseGroundVehicle
{
    public PANDUR()
    {
        VehicleType = VehicleType.PANDUR;
        inGameDisplayName = "Pandur";

         base.vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.ATK44HE, 2},
                { AmmunitionType.ATK44AP, 2},
            };
        base.defaultLoadoutOnTurret.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOHUNDREDROUNDCTWSHE, 2},
                //{ AmmunitionType.TWOHUNDREDROUNDCTWSSABOT, 2},

            };

        turretPos = 0;
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.LIGHTFACTORY;
        weaponToRemoveUntilHeavyLevelOnATank = new Dictionary<WeaponType, int>
        {
            {WeaponType.SPIKELAUNCHER, 4},
        };
    }
}