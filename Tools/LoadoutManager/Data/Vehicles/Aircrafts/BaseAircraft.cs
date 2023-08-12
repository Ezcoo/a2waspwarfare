using System.Linq;
using System.Runtime.Serialization;
using System.Text;

public abstract class BaseAircraft : BaseVehicle, InterfaceAircraft
{
    public int pylonAmount { get; set; }
    public Dictionary<AmmunitionType, int> allowedAmmunitionTypesWithTheirLimitationAmount { get; set; }
    public bool addToDefaultLoadoutPrice { get; set; }
    public Dictionary<AmmunitionType, float> ammunitionTypeCostFloatModifier { get; set; }

    public string GenerateLoadoutsForTheAircraft()
    {
        string generatedLoadouts = string.Empty;

        generatedLoadouts += GenerateCommentForTheSqfCode();
        generatedLoadouts += "\n_easaVehi = _easaVehi + ['" + EnumExtensions.GetEnumMemberAttrValue(VehicleType) + "'];";
        generatedLoadouts += GenerateDefaultLoadout();
        string generatedLoadout = GenerateCombinationLoadouts();
        if (generatedLoadout == "")
        {
            return "";
        }
        generatedLoadouts += generatedLoadout;
        generatedLoadouts += "\n]";
        generatedLoadouts += "\n];";

        return generatedLoadouts;
    }

    protected override string GenerateCommentForTheSqfCode()
    {
        return "// " + inGameDisplayName + " [" + EnumExtensions.GetEnumMemberAttrValue(producedFromFactoryType)
            + InGameFactoryLevel + "] - " + pylonAmount + " pylons";
    }

    private string GenerateCombinationLoadouts()
    {
        string generatedCombinationLoadouts = string.Empty;

        if(allowedAmmunitionTypesWithTheirLimitationAmount == null || allowedAmmunitionTypesWithTheirLimitationAmount.Count < 1)
        {
            return "";
        }

        generatedCombinationLoadouts += "\n_easaLoadout = _easaLoadout + [\n[";
        var combinations = GenerateCombinations(allowedAmmunitionTypesWithTheirLimitationAmount.Keys.ToArray(), pylonAmount / 2);
        generatedCombinationLoadouts += GenerateSortedCombinations(combinations);

        return generatedCombinationLoadouts;
    }

    private string GenerateSortedCombinations(List<List<AmmunitionType>> _combinations)
    {
        string sortedCombinations = string.Empty;

        var finalPricesSortedByPrice = GetSortedCombinationsByPrice(_combinations);

        int index = 0;
        foreach (var item in finalPricesSortedByPrice)
        {
            string finalString = item.Key + ",";
            if (index == finalPricesSortedByPrice.Count - 1)
            {
                finalString = finalString.TrimEnd(',');
            }
            sortedCombinations += "\n" + finalString;
            index++;
        }

        return sortedCombinations;
    }

    private Dictionary<string, int> GetSortedCombinationsByPrice(List<List<AmmunitionType>> _combinations)
    {
        Dictionary<string, int> unsortedListByPrice = new Dictionary<string, int>();
        foreach (var combination in _combinations)
        {
            var loadout = GenerateLoadoutForCombination(combination);
            if (loadout.Item1 != "" && loadout.Item2 != 0)
            {
                unsortedListByPrice.Add(loadout.Item1, loadout.Item2);
            }
        }
        return unsortedListByPrice.OrderBy(pair => pair.Value).ToDictionary(pair => pair.Key, pair => pair.Value);
    }

    private (string, int) GenerateLoadoutForCombination(List<AmmunitionType> _combination)
    {
        (string, int) loadout = ("", 0);
        Dictionary<AmmunitionType, int> combinationLoadouts = new Dictionary<AmmunitionType, int>();

        foreach (var item in _combination)
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
        return loadout;
    }

    private string GenerateDefaultLoadout()
    {
        (string, int) ammunitionArray = ("", 0);

        // Calculate for turret (like for aircrafts, the Su34)
        if (defaultLoadoutOnTurret.AmmunitionTypesWithCount.Count > 0 && (vehicleType != VehicleType.WILDCAT || vehicleType != VehicleType.MI24P)) // Convert this to list if needed later on
        {
            ammunitionArray = GenerateLoadoutRow(defaultLoadoutOnTurret.AmmunitionTypesWithCount, false);
        }
        else
        {
            ammunitionArray = GenerateLoadoutRow(defaultLoadout.AmmunitionTypesWithCount, false);
        }

        if (ammunitionArray.Item1 == "")
        {
            return "";
        }

        ammunitionArray.Item1 = "\n_easaDefault = _easaDefault + " + ammunitionArray.Item1 + ";";
        return ammunitionArray.Item1;
    }

    private int CalculateLoadoutTotalPrice(AmmunitionType _ammunitionType, int _priceWithoutModifier)
    {
        if (ammunitionTypeCostFloatModifier == null ||
            !ammunitionTypeCostFloatModifier.ContainsKey(_ammunitionType))
        {
            return _priceWithoutModifier;
        }

        return _priceWithoutModifier * (int)ammunitionTypeCostFloatModifier[_ammunitionType];
    }

    private (string, int) GenerateLoadoutRow(
        Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo = true)
    {
        string finalRowOutput = string.Empty;

        // Remove flares magazines
        if (!_generateWithPriceAndWeaponsInfo && _input.ContainsKey(AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE))
        {
            foreach (var item in _input.Keys)
            {
                if (item == AmmunitionType.SIXTYROUNDCMFLAREMAGAZINE)
                {
                    _input.Remove(item);
                }
            }
        }

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
            finalRowOutput += "'";
            finalRowOutput += item;
            finalRowOutput += "',";
        }

        finalRowOutput = finalRowOutput.TrimEnd(',');
        finalRowOutput += "]]]";

        return (finalRowOutput, calculatedLoadoutRow.totalPrice);
    }

    private bool CheckDisregardedLoadout(Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo)
    {
        bool disregardLoadout = false;
        var ammoToSearch = AmmunitionType.BASECH29;

        foreach (var ammunitionKvp in _input)
        {
            if (_generateWithPriceAndWeaponsInfo &&
                allowedAmmunitionTypesWithTheirLimitationAmount[ammunitionKvp.Key] != 0 &&
                ammunitionKvp.Value > allowedAmmunitionTypesWithTheirLimitationAmount[ammunitionKvp.Key])
            {
                disregardLoadout = true;
                break;
            }

            if (ammunitionKvp.Key != ammoToSearch) continue;

            if (ammunitionKvp.Value == 2)
            {
                disregardLoadout = true;
                break;
            }
        }

        return disregardLoadout;
    }


    private LoadoutRow CalculateLoadoutRow(
        Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo = true) // For non-default loadouts, show the information on the easa screen
    {
        LoadoutRow newLoadoutRow = new LoadoutRow();

        if (CalculateWeaponsCount(_input) != pylonAmount && !addToDefaultLoadoutPrice)
        {
            return newLoadoutRow;
        }

        if (CheckDisregardedLoadout(_input, _generateWithPriceAndWeaponsInfo))
        {
            return new LoadoutRow();
        }

        bool doneAddingSpecialAmounts = false;
        Dictionary<string, int> alreadyAddedWeaponLaunchersWithWeaponAmountInTotal = new Dictionary<string, int>();
        foreach (var ammoTypeKvp in _input)
        {
            int weaponAmount = 0;

            var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(ammoTypeKvp.Key.ToString());
            var weaponDefinition = (InterfaceWeapon)ammunitionType.weaponDefinition;
            var weaponSqfName = EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
            var ammoDisplayName = EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionTypes[0]);

            for (int p = 0; p < ammoTypeKvp.Value; p++)
            {
                if (p % 2 != 0)
                {
                    continue;
                }

                string totalTypes = string.Empty;
                if (!addToDefaultLoadoutPrice)
                {
                    // If not adding to default loadout price, just add the cost of the current ammunition type
                    newLoadoutRow.totalPrice += CalculateLoadoutTotalPrice(ammoTypeKvp.Key, ammunitionType.costPerPylon * 2);
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

                newLoadoutRow.totalPrice += CalculateLoadoutTotalPrice(ammoTypeKvp.Key, ammunitionType.costPerPylon * (easaAmmoCount - defaultLoadcoutAmmoCount));
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
            if (alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.ContainsKey(weaponSqfName))
            {
                alreadyAddedWeaponLaunchersWithWeaponAmountInTotal[weaponSqfName] += weaponAmount;
                continue;
            }

            if (!weaponDefinition.doNotAddWeapon)
            {
                newLoadoutRow.weaponTypesArray += "'";
                newLoadoutRow.weaponTypesArray += EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
                newLoadoutRow.weaponTypesArray += "',";
            }

            newLoadoutRow.weaponsInfo += ammunitionType.ammoDisplayName + " (" + weaponAmount + ") | ";

            alreadyAddedWeaponLaunchersWithWeaponAmountInTotal.Add(weaponSqfName, weaponAmount);
        }

        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd(' ');
        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd('|');
        newLoadoutRow.weaponsInfo = newLoadoutRow.weaponsInfo.TrimEnd(' ');

        return newLoadoutRow;
    }

    private int CalculateWeaponsCount(Dictionary<AmmunitionType, int> _input)
    {
        int countOfWeapons = 0;

        foreach (var item in _input)
        {
            int totalValue = 0;

            switch (item.Key)
            {
                case AmmunitionType.TWELVEROUNDSVIKHR:
                case AmmunitionType.FOURROUNDCH29:
                case AmmunitionType.EIGHTROUNDHELLFIRE:
                    totalValue += item.Value * 2;
                    break;
                case AmmunitionType.FOURROUNDFAB250:
                case AmmunitionType.TWOROUNDFAB250:
                    totalValue += item.Value / 2;
                    break;
                case AmmunitionType.SIXROUNDCH29:
                    totalValue += item.Value * 3;
                    break;
                default:
                    countOfWeapons += item.Value;
                    break;
            }
            countOfWeapons += totalValue;
        }

        return countOfWeapons;
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
            // Check if the current ammunition type is HELLFIRE/VIKHR
            if ((_inputArray[i] == AmmunitionType.EIGHTROUNDHELLFIRE || _inputArray[i] == AmmunitionType.TWELVEROUNDSVIKHR) && !addToDefaultLoadoutPrice) // Quickfix for ah64, apache, ah1z with hellfires 
            {
                // If it is, then reduce the remaining slots by 2 instead of 1
                // Also make sure there are enough slots left for HELLFIRE/VIKHR
                if (_r >= 2)
                {
                    _combination.Add(_inputArray[i]);
                    GenerateCombinationsUtil(_inputArray, _r - 2, i, _combination, _result);
                    _combination.RemoveAt(_combination.Count - 1);
                }
            }
            else
            {
                // Otherwise, proceed as usual
                _combination.Add(_inputArray[i]);
                GenerateCombinationsUtil(_inputArray, _r - 1, i, _combination, _result);
                _combination.RemoveAt(_combination.Count - 1);
            }
        }
    }
}