using System;
using System.Collections.Generic;

public abstract class AmmunitionDefinition
{
    public int AmountPerPylon { get; set; }
    public WeaponDefinition WeaponDefinition { get; set; }
    public int CostPerPylon { get; set; }
}

public class R73 : AmmunitionDefinition
{
    public R73()
    {
        AmountPerPylon = 2;
        WeaponDefinition = new WeaponDefinition
        {
            ClassName = "R73Launcher_2",
            DisplayName = "R-73",
            CostPerWeaponLauncher = 1000 // Fill in the actual cost here
        };
        CostPerPylon = 2322; // Fill in the actual cost here
    }
}

public class Ch29 : AmmunitionDefinition
{
    public Ch29()
    {
        AmountPerPylon = 6;
        WeaponDefinition = new WeaponDefinition
        {
            ClassName = "Ch29Launcher_Su34",
            DisplayName = "Ch-29",
            CostPerWeaponLauncher = 3900 // Fill in the actual cost here
        };
        CostPerPylon = 1231231; // Fill in the actual cost here
    }
}

public class WeaponDefinition
{
    public string ClassName { get; set; }
    public string DisplayName { get; set; }
    public int CostPerWeaponLauncher { get; set; }
}

public class Loadout
{
    public List<List<string>> Weapons { get; set; }
}

public class AircraftDefinition
{
    public string SQFPlaneClassName { get; set; }
    public int PylonAmount { get; set; }
    public Loadout DefaultLoadout { get; set; }
    public List<Loadout> EASALoadouts { get; set; }
}

class Program
{
    static void Main()
    {
        var ammunitionR73 = Activator.CreateInstance<R73>();
        var ammunitionCh29 = Activator.CreateInstance<Ch29>();

        var loadoutDefault = new Loadout
        {
            Weapons = new List<List<string>>
            {
                new List<string> { "Ch29Launcher_Su34", "R73Launcher_2", "80mmLauncher" },
                new List<string> { "6Rnd_Ch29", "2Rnd_R73", "2Rnd_R73", "2Rnd_R73", "2Rnd_R73", "2Rnd_R73" }
            }
        };

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

        var aircraftDefinition = new AircraftDefinition
        {
            SQFPlaneClassName = "Su34",
            PylonAmount = 10,
            DefaultLoadout = loadoutDefault,
            EASALoadouts = easaLoadouts
        };

        // Generate the SQF code
        Console.WriteLine("_easaVehi = _easaVehi + ['" + aircraftDefinition.SQFPlaneClassName + "'];");
        Console.WriteLine("_easaDefault = _easaDefault + [[");

        foreach (var weapon in aircraftDefinition.DefaultLoadout.Weapons)
        {
            Console.Write("['");
            Console.Write(string.Join("','", weapon));
            Console.Write("'],");
        }

        Console.WriteLine("]];");

        Console.WriteLine("_easaLoadout = _easaLoadout + [");
        foreach (var loadout in aircraftDefinition.EASALoadouts)
        {
            Console.WriteLine("  [");
            foreach (var weapon in loadout.Weapons)
            {
                Console.Write("   [");
                // Here you can calculate the cost per pylon using the ammunition definitions
                // and weapon definitions.
                Console.Write("0, '" + weapon[0] + " (" + weapon.Count + ")', [");
                for (int i = 0; i < weapon.Count; i++)
                {
                    Console.Write("'" + weapon[i] + "'");
                    if (i < weapon.Count - 1)
                    {
                        Console.Write(",");
                    }
                }
                Console.WriteLine("]],");
            }
            Console.WriteLine(" ],");
        }
        Console.WriteLine("];");
    }
}
