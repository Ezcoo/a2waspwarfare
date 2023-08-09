using System.Collections.Generic;

public abstract class BaseHelicopter : BaseAircraft
{
    protected BaseHelicopter() 
    {
        ammunitionTypeCostFloatModifier = new Dictionary<AmmunitionType, float>()
        {
            {AmmunitionType.EIGHTROUNDHELLFIRE, 0.8333333333333333f },
            {AmmunitionType.FOURROUNDATAKA, 0.8333333333333333f },
            {AmmunitionType.TWOROUNDSIDEWINDER, 5.714285714285714f },
            {AmmunitionType.TWOROUNDR73, 5.714285714285714f },
            {AmmunitionType.TWOROUNDSTINGER, 12.5f },
            {AmmunitionType.TWOROUNDIGLA, 12.5f },
            {AmmunitionType.SIXROUNDFAB250, 1.5f },
        };
    }
}