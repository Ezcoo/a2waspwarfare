public abstract class BaseAircraft : InterfaceAircraft
{
    public AircraftType AircraftType { get => aircraftType; set => aircraftType = value; }

    private AircraftType aircraftType { get; set; }
    public int pylonAmount { get; set; }
    public List<AmmunitionType> allowedAmmunitionTypes { get; set; }
    public Loadout defaultLoadout { get; set; }

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

        List<List<AmmunitionType>> combinations = GenerateCombinations(allowedAmmunitionTypes.ToArray(), pylonAmount / 2);

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

    private void GenerateDefaultLoadout()
    {
        Console.WriteLine("_easaDefault = _easaDefault + ");

        string ammunitionArray = GenerateLoadoutRow(defaultLoadout.AmmunitionTypesWithCount, false);

        Console.WriteLine(ammunitionArray + ";");
    }

    private string GenerateLoadoutRow(
        Dictionary<AmmunitionType, int> _input,
        bool _generateWithPriceAndWeaponsInfo = true) // For non-default loadouts, show the information on the easa screen
    {
        string weaponTypesArray = string.Empty;
        string ammunitionArray = string.Empty;

        int totalPrice = 0;
        string priceAndWeaponsInfo = string.Empty;
        string weaponsInfo = string.Empty;

        Dictionary<(string, string), int> alreadyAddedWeaponLaunchersWithWeaponAmountInTotal = new Dictionary<(string, string), int>();
        foreach (var ammoTypeKvp in _input)
        {
            int weaponAmount = 0;

            var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(ammoTypeKvp.Key.ToString());
            var weaponDefinition = (InterfaceWeapon)ammunitionType.weaponDefinition;
            var weaponSqfName = EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
            var ammoDisplayName = EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionType);

            int amount = ammoTypeKvp.Value / 2;

            // Calculates the the other halves of the pylons
            for (int p = 0; p < amount; p++)
            {
                totalPrice += ammunitionType.costPerPylon * 2;
                weaponAmount += ammunitionType.amountPerPylon * 2;

                ammunitionArray += "'";
                ammunitionArray += EnumExtensions.GetEnumMemberAttrValue(ammunitionType.AmmunitionType);
                ammunitionArray += "',";
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