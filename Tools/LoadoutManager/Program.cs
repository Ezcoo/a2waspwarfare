using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        foreach (AircraftType aircraftType in Enum.GetValues(typeof(AircraftType)))
        {
            var _interfaceAircraft = (InterfaceAircraft)EnumExtensions.GetInstance(aircraftType.ToString());

            Console.WriteLine("_easaVehi = _easaVehi + ['" + EnumExtensions.GetEnumMemberAttrValue(_interfaceAircraft.AircraftType) + "'];");

            GenerateDefaultLoadout(_interfaceAircraft);

            GenerateCombinationLoadouts(_interfaceAircraft);
        }
    }

    private static void GenerateCombinationLoadouts(InterfaceAircraft _interfaceAircraft)
    {
        Console.WriteLine("_easaLoadout = _easaLoadout + [\n[");

        List<List<AmmunitionType>> combinations = GenerateCombinations(_interfaceAircraft.AllowedAmmunitionTypes.ToArray(), _interfaceAircraft.PylonAmount / 2);

        // Display the combinations
        foreach (var combination in combinations)
        {
            Dictionary<AmmunitionType, int> combinationLoadouts = new Dictionary<AmmunitionType, int>();

            //Console.WriteLine(string.Join(", ", combination));

            foreach (var item in combination)
            {
                if (!combinationLoadouts.ContainsKey(item))
                {
                    combinationLoadouts.Add(item, 2);
                }
                else
                {
                    combinationLoadouts[item] += 2;
                }
            }
            Console.WriteLine(GenerateLoadoutRow(combinationLoadouts) + ",\n");
        }
    }

    private static void GenerateDefaultLoadout(InterfaceAircraft _interfaceAircraft)
    {
        Console.WriteLine("_easaDefault = _easaDefault + ");

        string ammunitionArray = GenerateLoadoutRow(_interfaceAircraft.DefaultLoadout.AmmunitionTypesWithCount);

        Console.WriteLine(ammunitionArray + ";");
    }

    private static string GenerateLoadoutRow(Dictionary<AmmunitionType, int> _input)
    {
        Console.Write("[[[");
        string weaponTypesArray = string.Empty;
        string ammunitionArray = string.Empty;
        List<string> alreadyAddedWeaponLaunchers = new List<string>();
        foreach (var ammoTypeKvp in _input)
        {
            var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(ammoTypeKvp.Key.ToString());
            var weaponDefinition = (InterfaceWeapon)ammunitionType.WeaponDefinition;
            var weaponSqfName = EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);

            int amount = ammoTypeKvp.Value / 2;

            // Calculates the the other halves of the pylons
            for (int p = 0; p < amount; p++)
            {
                ammunitionArray += "'";
                ammunitionArray += EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionType);
                ammunitionArray += "',";
            }

            // Do not add duplicate weapon launchers
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
        ammunitionArray += "]]]";

        return ammunitionArray;
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
