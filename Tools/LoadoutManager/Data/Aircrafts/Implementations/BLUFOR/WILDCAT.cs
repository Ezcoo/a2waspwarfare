﻿public class WILDCAT : BaseHelicopter
{
    public WILDCAT()
    {
        AircraftType = AircraftType.WILDCAT;
        pylonAmount = 4;

        base.defaultLoadout.AmmunitionTypesWithCount = new Dictionary<AmmunitionType, int>
            {
                { AmmunitionType.TWOROUNDSPIKE, 4},
                { AmmunitionType.TWOHUNDREDROUNDCTWSHE, 4},
                { AmmunitionType.TWOHUNDREDROUNDCTWSSABOT, 4},
                { AmmunitionType.SIXROUNDCRV7HEPD, 4},
            };

        allowedAmmunitionTypesWithTheirLimitationAmount = new Dictionary<AmmunitionType, int>
        {
            { AmmunitionType.TWOROUNDSPIKE, 4 },
            { AmmunitionType.TWOROUNDSTINGER, 4 },
        };

        inGameDisplayName = "Wildcat AH11";
        inGameAircraftFactoryLevel = 3;
            
        addToDefaultLoadoutPrice = true;
    }
}