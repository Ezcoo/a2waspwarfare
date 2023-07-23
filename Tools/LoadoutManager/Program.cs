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

            Console.WriteLine("]");
            Console.WriteLine("];");
        }
    }

    private static void GenerateCombinationLoadouts(InterfaceAircraft _interfaceAircraft)
    {
        Console.WriteLine("_easaLoadout = _easaLoadout + [\n[");

        List<List<AmmunitionType>> combinations = GenerateCombinations(_interfaceAircraft.AllowedAmmunitionTypes.ToArray(), _interfaceAircraft.PylonAmount / 2);

        int index = 0;

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


            if (index == combinations.Count - 1)
            {
                Console.WriteLine(GenerateLoadoutRow(combinationLoadouts).TrimEnd(','));
                break;
            }

            Console.WriteLine(GenerateLoadoutRow(combinationLoadouts) + ",\n");

            index++;
        }
    }

    private static void GenerateDefaultLoadout(InterfaceAircraft _interfaceAircraft)
    {
        Console.WriteLine("_easaDefault = _easaDefault + ");

        string ammunitionArray = GenerateLoadoutRow(_interfaceAircraft.DefaultLoadout.AmmunitionTypesWithCount, false);

        Console.WriteLine(ammunitionArray + ";");
    }

    private static string GenerateLoadoutRow(
        Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo = true) // For non-default loadouts, show the information on the easa screen
    {
        string weaponTypesArray = string.Empty;
        string ammunitionArray = string.Empty;
        
        int totalPrice = 0;
        string priceAndWeaponsInfo = string.Empty;
        string weaponsInfo = string.Empty;

        Dictionary<string, int> alreadyAddedWeaponLaunchersWithWeaponAmountInTotal = new Dictionary<string, int>();
        foreach (var ammoTypeKvp in _input)
        {
            int weaponAmount = 0;

            var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(ammoTypeKvp.Key.ToString());
            var weaponDefinition = (InterfaceWeapon)ammunitionType.WeaponDefinition;
            var weaponSqfName = EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);

            int amount = ammoTypeKvp.Value / 2;

            // Calculates the the other halves of the pylons
            for (int p = 0; p < amount; p++)
            {
                totalPrice += ammunitionType.CostPerPylon * 2;
                weaponAmount += ammunitionType.AmountPerPylon * 2;

                ammunitionArray += "'";
                ammunitionArray += EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionType);
                ammunitionArray += "',";
            }

            if (_generateWithPriceAndWeaponsInfo)
            {
                totalPrice += weaponDefinition.CostPerWeaponLauncher;
            }

            // Do not add duplicate weapon launchers
            if (alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.ContainsKey(weaponSqfName))
            {
                alreadyAddedWeaponLaunchersWithWeaponAmountInTotal[weaponSqfName] += weaponAmount;
                continue;
            }

            weaponTypesArray += "'";
            weaponTypesArray += weaponSqfName;
            weaponTypesArray += "',";

            alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.Add(weaponSqfName, weaponAmount);
        }

        foreach (var kvp in alreadyAddedWeaponLaunchersWithWeaponAmountInTotal)
        {
            weaponsInfo += kvp.Key + " (" + kvp.Value + ") | ";
        }
        weaponsInfo = weaponsInfo.TrimEnd(' ');
        weaponsInfo = weaponsInfo.TrimEnd('|');
        weaponsInfo = weaponsInfo.TrimEnd(' ');

        priceAndWeaponsInfo = totalPrice.ToString() + ",'" + weaponsInfo + "'";

        Console.Write("[" + priceAndWeaponsInfo + "[[");

        weaponTypesArray = weaponTypesArray.TrimEnd(',');
        weaponTypesArray += "]";

        Console.WriteLine(weaponTypesArray + ",");
        Console.Write("[");

        ammunitionArray = ammunitionArray.TrimEnd(',');
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