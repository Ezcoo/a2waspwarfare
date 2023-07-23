public class CH29 : BaseAmmunition
{
    public CH29()
    {
        AmountPerPylon = 6;
        WeaponDefinition = new BaseWeapon
        {
            ClassName = "Ch29Launcher_Su34",
            DisplayName = "Kh-29",
            CostPerWeaponLauncher = 3900 // Fill in the actual cost here
        };
        CostPerPylon = 1231231; // Fill in the actual cost here
    }
}