public class R73 : BaseAmmunition
{
    public R73()
    {
        AmountPerPylon = 2;
        WeaponDefinition = new BaseWeapon
        {
            ClassName = "R73Launcher_2",
            DisplayName = "R-73",
            CostPerWeaponLauncher = 1000 // Fill in the actual cost here
        };
        CostPerPylon = 2322; // Fill in the actual cost here
    }
}