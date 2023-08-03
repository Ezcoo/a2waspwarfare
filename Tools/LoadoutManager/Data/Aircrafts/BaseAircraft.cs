public abstract class BaseAircraft : InterfaceAircraft
{
    public AircraftType AircraftType { get => aircraftType; set => aircraftType = value; }

    private AircraftType aircraftType { get; set; }
    public int pylonAmount { get; set; }
    public Dictionary<AmmunitionType, int> allowedAmmunitionTypesWithTheirLimitationAmount { get; set; }
    public Loadout defaultLoadout { get; set; }
    public string inGameDisplayName { get; set; }
    public int inGameAircraftFactoryLevel { get; set; }
    public bool addToDefaultLoadoutPrice { get; set; }

    // Add price etc here for more advanced SQF generation

    protected BaseAircraft()
    {
        defaultLoadout = new Loadout();
    }

    private string GenerateCommentForTheSqfCode()
    {
        return "// " + inGameDisplayName + " [AF" + inGameAircraftFactoryLevel + "] - " + pylonAmount + " pylons";
    }

    public void GenerateLoadoutsForTheAircraft()
    {
        Console.WriteLine(GenerateCommentForTheSqfCode());

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

            loadout = GenerateLoadoutRow(combinationLoadouts);

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
            string finalString = item.Key + ",";

            if (index == finalPricesSortedByPrice.Count - 1)
            {
                finalString = finalString.TrimEnd(',');
            }

            Console.WriteLine(finalString);
            index++;
        }
    }

    private string GenerateDefaultLoadout()
    {
        Console.WriteLine("_easaDefault = _easaDefault + ");

        var ammunitionArray = GenerateLoadoutRow(defaultLoadout.AmmunitionTypesWithCount, false);

        if (ammunitionArray.Item1 == "")
        {
            return "";
        }

        Console.WriteLine(ammunitionArray.Item1 + ";");

        return ammunitionArray.Item1;
    }

    private (string, int) GenerateLoadoutRow(
        Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo = true)
    {
        string finalRowOutput = string.Empty;

        var calculatedLoadoutRow = CalculateLoadoutRow(_input, _generateWithPriceAndWeaponsInfo);

        if (_generateWithPriceAndWeaponsInfo)
        {
            string priceAndWeaponsInfo = calculatedLoadoutRow.totalPrice.ToString() + ",'" + calculatedLoadoutRow.weaponsInfo + "',";

            finalRowOutput += "[" + priceAndWeaponsInfo + "[[";
        }
        else
        {
            finalRowOutput += "[[[";
        }

        calculatedLoadoutRow.weaponTypesArray = calculatedLoadoutRow.weaponTypesArray.TrimEnd(',');
        calculatedLoadoutRow.weaponTypesArray += "]";

        finalRowOutput += calculatedLoadoutRow.weaponTypesArray + ",";
        finalRowOutput += "[";

        foreach (var item in calculatedLoadoutRow.ammunitionList)
        {
            calculatedLoadoutRow.finalAmmunitionString += "'";
            calculatedLoadoutRow.finalAmmunitionString += item;
            calculatedLoadoutRow.finalAmmunitionString += "',";
        }

        calculatedLoadoutRow.finalAmmunitionString = calculatedLoadoutRow.finalAmmunitionString.TrimEnd(',');
        calculatedLoadoutRow.finalAmmunitionString += "]]]";

        finalRowOutput += calculatedLoadoutRow.finalAmmunitionString;

        //Console.WriteLine("RETURNING: " + finalRowOutput);

        return (finalRowOutput, calculatedLoadoutRow.totalPrice);
    }

    private LoadoutRow CalculateLoadoutRow(
        Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo = true) // For non-default loadouts, show the information on the easa screen
    {
        LoadoutRow newLoadoutRow = new LoadoutRow();
        Dictionary<AmmunitionType, int> newInput = new();
        bool disregardLoadout = false;

        foreach (var kvp in _input)
        {
            newInput.Add(kvp.Key, kvp.Value);
        }

        // Detect the default loadout
        if (newInput.SequenceEqual(defaultLoadout.AmmunitionTypesWithCount) && _generateWithPriceAndWeaponsInfo)
        {
            newLoadoutRow.isDefaultLoadout = true;
        }
        
        //Console.WriteLine("Generating:");
        foreach (var ammunitionKvp in newInput)
        {
            //Console.WriteLine(ammunitionKvp.Key + " | " + ammunitionKvp.Value);

            // Check for weapon specific limitations
            if (_generateWithPriceAndWeaponsInfo &&
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

            if (ammunitionKvp.Value == 2)
            {
                disregardLoadout = true;
                break;
            }
        }

        if (disregardLoadout)
        {
            return new LoadoutRow();
        }

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
            var ammoDisplayName = EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionTypes[0]);

            int amount = ammoTypeKvp.Value / 2;

            // Calculates the the other halves of the pylons
            for (int p = 0; p < amount; p++)
            {
                string totalTypes = string.Empty;
                if (!addToDefaultLoadoutPrice)
                {
                    // If not adding to default loadout price, just add the cost of the current ammunition type
                    newLoadoutRow.totalPrice += ammunitionType.costPerPylon * 2;
                }

                weaponAmount += ammunitionType.amountPerPylon * 2;

                foreach (var ammunitonType in ammunitionType.AmmunitionTypes)
                {
                    string type = EnumExtensions.GetEnumMemberAttrValue(ammunitonType);

                    if (type == "ERROR_UNDEFINED_VARIANTS")
                    {
                        continue;
                    }

                    newLoadoutRow.ammunitionList.Add(type);
                }
            }

            // Compare to default loadout and see what it adds to the aircraft EASA total cost
            if (addToDefaultLoadoutPrice)
            {
                var ammo = ammunitionType.AmmunitionTypes[0];
                var defaultLoadcoutAmmoCount = 0;
                if (defaultLoadout.AmmunitionTypesWithCount.ContainsKey(ammo))
                {
                    defaultLoadcoutAmmoCount = defaultLoadout.AmmunitionTypesWithCount[ammo];
                }

                var easaAmmoCount = ammoTypeKvp.Value;

                newLoadoutRow.totalPrice += ammunitionType.costPerPylon * (easaAmmoCount - defaultLoadcoutAmmoCount);
            }

            // Temp solution to add kh29
            if (ammoTypeKvp.Key == AmmunitionType.BASECH29 && !doneAddingSpecialAmounts)
            {
                var tempCh29 = (InterfaceAmmunition)EnumExtensions.GetInstance(AmmunitionType.BASECH29.ToString());

                foreach (var item in tempCh29.optionalAmmunitionDictionary[ammoTypeKvp.Value])
                {
                    string type = EnumExtensions.GetEnumMemberAttrValue(item);

                    newLoadoutRow.ammunitionList.Add(type);
                }
            }

            if (_generateWithPriceAndWeaponsInfo)
            {
                newLoadoutRow.totalPrice += weaponDefinition.costPerWeaponLauncher;
            }

            // Do not add duplicate weapon launchers
            if (alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.ContainsKey((weaponSqfName, ammunitionType.ammoDisplayName)))
            {
                alreadyAddedWeaponLaunchersWithWeaponAmountInTotal[(weaponSqfName, ammunitionType.ammoDisplayName)] += weaponAmount;
                continue;
            }

            newLoadoutRow.weaponTypesArray += "'";
            newLoadoutRow.weaponTypesArray += EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
            newLoadoutRow.weaponTypesArray += "',";

            alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.Add((weaponSqfName, ammunitionType.ammoDisplayName), weaponAmount);
        }

        if (newLoadoutRow.isDefaultLoadout)
        {
            newLoadoutRow.weaponsInfo += "DEFAULT | ";
        }

        foreach (var kvp in alreadyAddedWeaponLaunchersWithWeaponAmountInTotal)
        {
            newLoadoutRow.weaponsInfo += kvp.Key.Item2 + " (" + kvp.Value + ") | ";
        }
        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd(' ');
        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd('|');
        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd(' ');

        // Detect the default loadout for su34 etc
        if (!newLoadoutRow.isDefaultLoadout)
        {
            string defaultLoadoutWeaponsInfo = string.Empty;
            foreach (var kvp in defaultLoadout.AmmunitionTypesWithCount)
            {
                int finalKvpValue = kvp.Value;

                var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(kvp.Key.ToString());

                if (ammunitionType.AmmunitionTypes[0] == AmmunitionType.FOURROUNDCH29)
                {
                    finalKvpValue = 4;
                }

                if (ammunitionType.AmmunitionTypes[0] == AmmunitionType.SIXROUNDCH29)
                {
                    finalKvpValue = 6;
                }

                defaultLoadoutWeaponsInfo += ammunitionType.ammoDisplayName + " (" + finalKvpValue + ") | ";
            }
            defaultLoadoutWeaponsInfo = defaultLoadoutWeaponsInfo.TrimEnd(' ');
            defaultLoadoutWeaponsInfo = defaultLoadoutWeaponsInfo.TrimEnd('|');
            defaultLoadoutWeaponsInfo = defaultLoadoutWeaponsInfo.TrimEnd(' ');

            if (_generateWithPriceAndWeaponsInfo && (defaultLoadoutWeaponsInfo == newLoadoutRow.weaponsInfo))
            {
                newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.Insert(0, "DEFAULT | ");
                newLoadoutRow.isDefaultLoadout = true;
            }
        }

        int countOfWeapons = 0;

        foreach (var item in newLoadoutRow.ammunitionList)
        {
            if (item == "12Rnd_Vikhr_KA50" || item == "4Rnd_Ch29" || item == "8Rnd_Hellfire")
            {
                countOfWeapons += 4;
                continue;
            }

            if (item == "4Rnd_FAB_250" || item == "2Rnd_FAB_250")
            {
                countOfWeapons += 1;
                continue;
            }

            if (item == "6Rnd_Ch29")
            {
                countOfWeapons += 6;
                continue;
            }

            countOfWeapons += 2;
        }

        if (countOfWeapons == pylonAmount)
        {
            return newLoadoutRow;
        }

        return new LoadoutRow();
    }

    private List<List<AmmunitionType>> GenerateCombinations(AmmunitionType[] _inputArray, int _r)
    {
        List<List<AmmunitionType>> result = new List<List<AmmunitionType>>();
        List<AmmunitionType> combination = new List<AmmunitionType>();

        GenerateCombinationsUtil(_inputArray, _r, 0, combination, result);

        return result;
    }

    private void GenerateCombinationsUtil(
        AmmunitionType[] _inputArray, int _r, int _start, List<AmmunitionType> _combination, List<List<AmmunitionType>> _result)
    {
        if (_r == 0)
        {
            _result.Add(new List<AmmunitionType>(_combination));
            return;
        }

        for (int i = _start; i < _inputArray.Length; i++)
        {
            _combination.Add(_inputArray[i]);
            GenerateCombinationsUtil(_inputArray, _r - 1, i, _combination, _result);
            _combination.RemoveAt(_combination.Count - 1);
        }
    }
}