using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        foreach (AircraftType aircraftType in Enum.GetValues(typeof(AircraftType)))
        {
            var aircraftDefinition = (InterfaceAircraft)EnumExtensions.GetInstance(aircraftType.ToString());

            // Generate the SQF code
            Console.WriteLine("_easaVehi = _easaVehi + ['" + EnumExtensions.GetEnumMemberAttrValue(aircraftDefinition.AircraftType) + "'];");
            Console.WriteLine("_easaDefault = _easaDefault + [[");

            Console.Write("[");

            string weaponTypesArray = string.Empty;
            string ammunitionArray = string.Empty;
            List<string> alreadyAddedWeaponLaunchers = new List<string>();
            foreach (var ammoTypeKvp in aircraftDefinition.DefaultLoadout.AmmunitionTypesWithCount)
            {
                var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(ammoTypeKvp.Key.ToString());
                var weaponDefinition = (InterfaceWeapon)ammunitionType.WeaponDefinition;
                var weaponSqfName = EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);

                // Calculates the the other halves of the pylons
                for (int p = 0; p < ammoTypeKvp.Value / 2; p++)
                {
                    ammunitionArray += "'";
                    ammunitionArray += EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionType);
                    ammunitionArray += "',";
                }

                //Do not add duplicate weapon launchers
                if (alreadyAddedWeaponLaunchers.Contains(weaponSqfName))
                {
                    continue;
                }

                weaponTypesArray += "'";
                weaponTypesArray += weaponSqfName;
                weaponTypesArray += "',";

                alreadyAddedWeaponLaunchers.Add(weaponSqfName);
            }

            weaponTypesArray = weaponTypesArray.Substring(0, weaponTypesArray.Length - 1);
            weaponTypesArray += "]";

            Console.WriteLine(weaponTypesArray + ",");
            Console.Write("[");

            ammunitionArray = ammunitionArray.Substring(0, ammunitionArray.Length - 1);
            ammunitionArray += "]";

            Console.WriteLine(ammunitionArray + "\n]];");

            int r = aircraftDefinition.PylonAmount/2; // Number of elements in each combination

            List<List<AmmunitionType>> combinations = GenerateCombinations(aircraftDefinition.AllowedAmmunitionTypes.ToArray(), r);

            // Display the combinations
            foreach (var combination in combinations)
            {
                Console.WriteLine(string.Join(", ", combination));
            }
        }
    }

    static List<List<AmmunitionType>> GenerateCombinations(AmmunitionType[] _inputArray, int _r)
    {
        List<List<AmmunitionType>> result = new List<List<AmmunitionType>>();
        List<AmmunitionType> combination = new List<AmmunitionType>();

        GenerateCombinationsUtil(_inputArray, _r, 0, combination, result);

        return result;
    }

    static void GenerateCombinationsUtil(
        AmmunitionType[] _inputArray, int r, int start, List<AmmunitionType> _combination, List<List<AmmunitionType>> _result)
    {
        if (r == 0)
        {
            _result.Add(new List<AmmunitionType>(_combination));
            return;
        }

        for (int i = start; i < _inputArray.Length; i++)
        {
            _combination.Add(_inputArray[i]);
            GenerateCombinationsUtil(_inputArray, r - 1, i, _combination, _result);
            _combination.RemoveAt(_combination.Count - 1);
        }
    }
}
