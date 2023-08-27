public class BTR90 : BaseGroundVehicle
{
    public BTR90()
    {
        VehicleType = VehicleType.BTR90;
        inGameDisplayName = "BTR-90";
        inGameFactoryLevel = 3;
        producedFromFactoryType = FactoryType.LIGHTFACTORY;
        weaponsToRemoveUntilFactoryLevelOnAVehicle = new Dictionary<WeaponType, int>
        {
            {WeaponType.KONKURSLAUNCHERSINGLE, 4},
        };
    }
}