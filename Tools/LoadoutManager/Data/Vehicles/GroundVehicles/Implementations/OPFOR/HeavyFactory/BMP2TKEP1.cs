public class BMP2TKEP1 : BaseGroundVehicle
{
    public BMP2TKEP1()
    {
        VehicleType = VehicleType.BMP2TKEP1;
        inGameDisplayName = "BMP-2";
        inGameFactoryLevel = 1;
        producedFromFactoryType = FactoryType.HEAVYFACTORY;
        weaponsToRemoveUntilFactoryLevelOnAVehicle = new Dictionary<WeaponType, int>
        {
            {WeaponType.KONKURSLAUNCHERSINGLE, 2},
        };
    }
}