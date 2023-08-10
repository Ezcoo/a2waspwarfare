using System;

public interface InterfaceVehicle
{
    public VehicleType VehicleType { get; set; }
    public string InGameDisplayName { get; set; }
    public int InGameFactoryLevel { get; set; }

    public string StartGeneratingCommonBalanceInitForTheVehicle();
    public string GenerateCommonBalanceInitForTheVehicle(Loadout _vanillaLoadout, Loadout _defaultLoadout, string _turret = "");
}
