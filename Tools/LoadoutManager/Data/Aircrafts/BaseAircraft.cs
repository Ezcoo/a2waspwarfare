using System.Collections.Generic;

public abstract class BaseAircraft : InterfaceAircraft
{
    public AircraftType AircraftType { get => aircraftType; set => aircraftType = value; }

    private AircraftType aircraftType { get; set; }
    public int pylonAmount { get; set; }
    public Dictionary<AmmunitionType, int> allowedAmmunitionTypesWithTheirLimitationAmount { get; set; }
    public Loadout defaultLoadout { get; set; }

    protected BaseAircraft()
    {
        defaultLoadout = new Loadout();
    }

    public void GenerateLoadoutsForTheAircraft()
    {
        Console.WriteLine("_easaVehi = _easaVehi + ['" + EnumExtensions.GetEnumMemberAttrValue(AircraftType) + "'];");

        GenerateDefaultLoadout();

        GenerateCombinationLoadouts();

        Console.WriteLine("]");
        Console.WriteLine("];");
    }

    private void GenerateCombinationLoadouts()
    {
        Console.WriteLine("_easaLoadout = _easaLoadout + [\n[");

        List<List<AmmunitionType>> combinations = GenerateCombinations(allowedAmmunitionTypesWithTheirLimitationAmount.Keys.ToArray(), pylonAmount / 2);

        Dictionary<string, int> unsortedListByPrice = new Dictionary<string, int>();
        Dictionary<string, int> finalPricesSortedByPrice = new Dictionary<string, int>();

        // Display the combinations
        foreach (var combination in combinations)
        {
            (string, int) loadout = ("",0);

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

            loadout = GenerateLoadoutRow(combinationLoadouts, allowedAmmunitionTypesWithTheirLimitationAmount);

            if (loadout.Item1 == "" || loadout.Item2 == 0)
            {
                continue;
            }

            unsortedListByPrice.Add(loadout.Item1, loadout.Item2);
        }

        finalPricesSortedByPrice = unsortedListByPrice
            .OrderBy(pair => pair.Value)
            .ToDictionary(pair => pair.Key, pair => pair.Value);

        int index = 0;

        foreach (var item in finalPricesSortedByPrice)
        {
            if (index == combinations.Count - 1)
            {
                Console.WriteLine(item.Key.TrimEnd(','));
                break;
            }

            Console.WriteLine(item.Key + ",\n");

            index++;
        }
    }

    private string GenerateDefaultLoadout()
    {
        Console.WriteLine("_easaDefault = _easaDefault + ");

        var ammunitionArray = GenerateLoadoutRow(defaultLoadout.AmmunitionTypesWithCount, new Dictionary<AmmunitionType, int>(), false);

        if (ammunitionArray.Item1 == "")
        {
            return "";
        }

        Console.WriteLine(ammunitionArray.Item1 + ";");

        return ammunitionArray.Item1;
    }

    private (string, int) GenerateLoadoutRow(
        Dictionary<AmmunitionType, int> _input, Dictionary<AmmunitionType, int> _allowedAmmunitionTypesWithTheirLimitationAmount,
        bool _generateWithPriceAndWeaponsInfo = true)
    {
        string finalRowOutput = string.Empty;

        var calculatedLoadoutRow = CalculateLoadoutRow(_input, _allowedAmmunitionTypesWithTheirLimitationAmount, _generateWithPriceAndWeaponsInfo);

        if (_generateWithPriceAndWeaponsInfo)
        {
            string priceAndWeaponsInfo = calculatedLoadoutRow.Item1.ToString() + ",'" + calculatedLoadoutRow.Item4 + "',";

            finalRowOutput += "[" + priceAndWeaponsInfo + "[[";
        }
        else
        {
            finalRowOutput += "[[[";
        }

        calculatedLoadoutRow.Item2 = calculatedLoadoutRow.Item2.TrimEnd(',');
        calculatedLoadoutRow.Item2 += "]";

        finalRowOutput += calculatedLoadoutRow.Item2 + ",";
        finalRowOutput += "[";

        calculatedLoadoutRow.Item3 = calculatedLoadoutRow.Item3.TrimEnd(',');
        calculatedLoadoutRow.Item3 += "]]]";

        finalRowOutput += calculatedLoadoutRow.Item3;

        //Console.WriteLine("RETURNING: " + finalRowOutput);

        return (finalRowOutput, calculatedLoadoutRow.Item1);
    }

    private (int,string,string,string) CalculateLoadoutRow(
        Dictionary<AmmunitionType, int> _input, Dictionary<AmmunitionType, int> _allowedAmmunitionTypesWithTheirLimitationAmount,
        bool _generateWithPriceAndWeaponsInfo = true) // For non-default loadouts, show the information on the easa screen
    {
        Dictionary<AmmunitionType, int> newInput = new();
        bool disregardLoadout = false;

        foreach (var kvp in _input)
        {
            newInput.Add(kvp.Key, kvp.Value);
        }

        //Console.WriteLine("Generating:");
        foreach (var ammunitionKvp in newInput)
        {
            //Console.WriteLine(ammunitionKvp.Key + " | " + ammunitionKvp.Value);

            // Check for weapon specific limitations
            if (_allowedAmmunitionTypesWithTheirLimitationAmount.Count > 0 &&
                allowedAmmunitionTypesWithTheirLimitationAmount[ammunitionKvp.Key] != 0 &&
                ammunitionKvp.Value > allowedAmmunitionTypesWithTheirLimitationAmount[ammunitionKvp.Key])
            {
                disregardLoadout = true;
                break;
            }

            // Replace with list if needed
            var ammoToSearch = AmmunitionType.BASECH29;
            if (ammunitionKvp.Key != ammoToSearch)
            {
                continue;
            }

            var interfaceAmmunition = (InterfaceAmmunition)EnumExtensions.GetInstance(ammunitionKvp.Key.ToString());

            if (ammunitionKvp.Value == 2)
            {
                disregardLoadout = true;
                break;
            }
        }

        if (disregardLoadout)
        {
            return (0, "", "", "");
        }

        string weaponTypesArray = string.Empty;
        string ammunitionArray = string.Empty;

        int totalPrice = 0;
        string priceAndWeaponsInfo = string.Empty;
        string weaponsInfo = string.Empty;


        bool doneAddingSpecialAmounts = false;
        Dictionary<(string, string), int> alreadyAddedWeaponLaunchersWithWeaponAmountInTotal = new Dictionary<(string, string), int>();
        foreach (var ammoTypeKvp in newInput)
        {
            int weaponAmount = 0;

            var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(ammoTypeKvp.Key.ToString());
            if (ammunitionType.canNotBeUsedAsLoadoutOption && _generateWithPriceAndWeaponsInfo)
            {
                continue;
            }

            var weaponDefinition = (InterfaceWeapon)ammunitionType.weaponDefinition;
            var weaponSqfName = EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
            var ammoDisplayName = EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionType);

            int amount = ammoTypeKvp.Value / 2;

            // Calculates the the other halves of the pylons
            for (int p = 0; p < amount; p++)
            {
                totalPrice += ammunitionType.costPerPylon * 2;
                weaponAmount += ammunitionType.amountPerPylon * 2;

                string type = EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionType);

                if (type == "ERROR_UNDEFINED_VARIANTS")
                {
                    continue;
                }

                ammunitionArray += "'";
                ammunitionArray += type;
                ammunitionArray += "',";
            }

            // Temp solution to add kh29
            if (ammoTypeKvp.Key == AmmunitionType.BASECH29 && !doneAddingSpecialAmounts)
            {
                var tempCh29 = (InterfaceAmmunition)EnumExtensions.GetInstance(AmmunitionType.BASECH29.ToString());

                foreach (var item in tempCh29.optionalAmmunitionDictionary[ammoTypeKvp.Value])
                {
                    string type = EnumExtensions.GetEnumMemberAttrValue(item);

                    ammunitionArray += "'";
                    ammunitionArray += type;
                    ammunitionArray += "',";
                }
            }

            if (_generateWithPriceAndWeaponsInfo)
            {
                totalPrice += weaponDefinition.costPerWeaponLauncher;
            }

            // Do not add duplicate weapon launchers
            if (alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.ContainsKey((weaponSqfName, ammunitionType.ammoDisplayName)))
            {
                alreadyAddedWeaponLaunchersWithWeaponAmountInTotal[(weaponSqfName, ammunitionType.ammoDisplayName)] += weaponAmount;
                continue;
            }

            weaponTypesArray += "'";
            weaponTypesArray += EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
            weaponTypesArray += "',";

            alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.Add((weaponSqfName, ammunitionType.ammoDisplayName), weaponAmount);
        }

        foreach (var kvp in alreadyAddedWeaponLaunchersWithWeaponAmountInTotal)
        {
            weaponsInfo += kvp.Key.Item2 + " (" + kvp.Value + ") | ";
        }
        weaponsInfo = weaponsInfo.TrimEnd(' ');
        weaponsInfo = weaponsInfo.TrimEnd('|');
        weaponsInfo = weaponsInfo.TrimEnd(' ');

        return (totalPrice, weaponTypesArray, ammunitionArray, weaponsInfo);
    }

    private List<List<AmmunitionType>> GenerateCombinations(AmmunitionType[] _inputArray, int _r)
    {
        List<List<AmmunitionType>> result = new List<List<AmmunitionType>>();
        List<AmmunitionType> combination = new List<AmmunitionType>();

        GenerateCombinationsUtil(_inputArray, _r, 0, combination, result);

        return result;
    }

    private void GenerateCombinationsUtil(
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