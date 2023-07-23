public class AIRBOMBLAUNCHER : BaseWeapon
{
    public AIRBOMBLAUNCHER()
    {
        Type = WeaponType.AIRBOMBLAUNCHER;
        CostPerWeaponLauncher = 1000; // Fill in the actual cost here
    }

    public WeaponType Type { get; }
}