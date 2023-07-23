using System;
using System.Collections.Generic;

public class Loadout
{
    public List<List<string>> Weapons { get; set; }
}

class Program
{
    static void Main()
    {
        //var ammoTest = (InterfaceAmmunition)EnumExtensions.GetInstance(AmmunitionType.R73.ToString());
        //Console.WriteLine(ammoTest.WeaponDefinition.DisplayName);
        //Console.WriteLine(EnumExtensions.GetEnumMemberAttrValue(AmmunitionType.R73));


        var easaLoadouts = new List<Loadout>
        {
            // Define all the loadouts here with the specified ammunition
            // and calculate the costs per pylon accordingly
            // Example:
             new Loadout
             {
                 Weapons = new List<List<string>>
                 {
                     new List<string> { "Ch29Launcher_Su34", "R73Launcher_2", "80mmLauncher" },
                     new List<string> { "6Rnd_Ch29", "2Rnd_R73", "2Rnd_R73", "2Rnd_R73" }
                 }
             }
        };

        var aircraftDefinition = (InterfaceAircraft)EnumExtensions.GetInstance(AircraftType.SU34.ToString());

        // Generate the SQF code
        Console.WriteLine("_easaVehi = _easaVehi + ['" + EnumExtensions.GetEnumMemberAttrValue(aircraftDefinition.Type) + "'];");
        Console.WriteLine("_easaDefault = _easaDefault + [[");

        foreach (var weapon in aircraftDefinition.DefaultLoadout.Weapons)
        {
            Console.Write("['");
            Console.Write(string.Join("','", weapon));
            Console.Write("'],");
        }

        Console.WriteLine("]];");

        //Console.WriteLine("_easaLoadout = _easaLoadout + [");
        //foreach (var loadout in aircraftDefinition.EASALoadouts)
        //{
        //    Console.WriteLine("  [");
        //    foreach (var weapon in loadout.Weapons)
        //    {
        //        Console.Write("   [");
        //        // Here you can calculate the cost per pylon using the ammunition definitions
        //        // and weapon definitions.
        //        Console.Write("0, '" + weapon[0] + " (" + weapon.Count + ")', [");
        //        for (int i = 0; i < weapon.Count; i++)
        //        {
        //            Console.Write("'" + weapon[i] + "'");
        //            if (i < weapon.Count - 1)
        //            {
        //                Console.Write(",");
        //            }
        //        }
        //        Console.WriteLine("]],");
        //    }
        //    Console.WriteLine(" ],");
        //}
        //Console.WriteLine("];");
    }
}
