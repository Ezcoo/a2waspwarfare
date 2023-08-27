public class BMP2INS : BaseGroundVehicle
{
    public BMP2INS()
    {
        VehicleType = VehicleType.BMP2INS;
        inGameDisplayName = "BMP-2";
        inGameFactoryLevel = 1;
        producedFromFactoryType = FactoryType.HEAVYFACTORY;
        weaponsToRemoveUntilFactoryLevelOnAVehicle = new Dictionary<WeaponType, int>
        {
            {WeaponType.KONKURSLAUNCHERSINGLE, 2},
        };
    }
}