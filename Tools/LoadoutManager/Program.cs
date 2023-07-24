using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        foreach (AircraftType aircraftType in Enum.GetValues(typeof(AircraftType)))
        {
            var _interfaceAircraft = (InterfaceAircraft)EnumExtensions.GetInstance(aircraftType.ToString());
            _interfaceAircraft.GenerateLoadoutsForTheAircraft();

            Console.WriteLine("\n\n");
        }
    }
}