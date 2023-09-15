using System;
using System.Text;

// The BaseVehicle class is an abstract base that encapsulates the core functionalities and attributes applicable to all vehicle types in the game.
// It implements the InterfaceVehicle interface to standardize common properties like vehicle type, in-game display name, factory level, and production factory type.
// Additionally, it holds data structures for managing various weapon configurations and loadouts, including conditional weapon removal based on factory levels.
// The class also provides methods for generating SQF (Slate Query Format) code snippets for initializing and balancing vehicle attributes in the game.
public abstract class BaseVehicle : InterfaceVehicle
{
    // Represents the name of the vehicle (e.g., Su25, L-39, T-90).
    public VehicleType VehicleType { get => vehicleType; set => vehicleType = value; }

    // Specifies the display name of the vehicle as it appears in-game.
    string InterfaceVehicle.InGameDisplayName { get => inGameDisplayName; set => inGameDisplayName = value; }

    // Specifies the factory level required for this vehicle in the game.
    public int InGameFactoryLevel { get => inGameFactoryLevel; set => inGameFactoryLevel = value; }

    // Indicates the type of factory where this vehicle is produced.
    public FactoryType ProducedFromFactoryType { get => producedFromFactoryType; set => producedFromFactoryType = value; }

    public bool ModdedVehicle { get => moddedVehicle; set => moddedVehicle = value; }

    // Protected member holding the actual type of the vehicle.
    protected VehicleType vehicleType { get; set; }

    // Default loadout configuration for the vehicle.
    protected Loadout defaultLoadout { get; set; }

    // Default loadout configuration specifically for the turret on the vehicle.
    protected Loadout defaultLoadoutOnTurret { get; set; }

    // Default loadout configuration from the vanilla game.
    protected Loadout vanillaGameDefaultLoadout { get; set; }

    // Default loadout configuration for the turret from the vanilla game.
    protected Loadout vanillaGameDefaultLoadoutOnTurret { get; set; }

    // Position index for the turret on the vehicle.
    protected int turretPos { get; set; }

    // Protected member holding the factory level required for this vehicle.
    protected int inGameFactoryLevel { get; set; }

    // Protected member indicating the type of factory where this vehicle is produced.
    protected FactoryType producedFromFactoryType { get; set; }

    // Protected member for the in-game display name of the vehicle.
    protected string inGameDisplayName { get; set; }
    protected bool moddedVehicle { get; set; }

    // Mapping of weapon types to the factory levels at which they should be removed from the vehicle.
    protected Dictionary<WeaponType, int> weaponsToRemoveUntilFactoryLevelOnAVehicle { get; set; }

    // Mapping of weapon types for the turret to the factory levels at which they should be removed from the vehicle.
    protected Dictionary<WeaponType, int> weaponsOnTheTurretToRemoveUntilFactoryLevelOnAVehicle { get; set; }
    // Add price etc here for more advanced SQF generation

    protected BaseVehicle()
    {
        defaultLoadout = new Loadout();
        defaultLoadout.AmmunitionTypesWithCount = new();
        defaultLoadoutOnTurret = new Loadout();
        defaultLoadoutOnTurret.AmmunitionTypesWithCount = new();
        vanillaGameDefaultLoadout = new Loadout();
        vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new();
        vanillaGameDefaultLoadoutOnTurret = new Loadout();
        vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new();
    }

    protected abstract string GenerateCommentForTheSqfCode();

    // Initiates the generation of SQF code for balancing the vehicle's weapons and loadouts.
    // This method takes into account both the default and turret-specific loadouts,
    // as well as any weapons that need to be removed based on factory level.
    // Returns: A string containing the generated SQF code for the vehicle balance initialization.
    public string StartGeneratingCommonBalanceInitForTheVehicle()
    {
        string finalSQFCode = GenerateCommonBalanceInitForTheVehicle(vanillaGameDefaultLoadout, defaultLoadout);

        if (defaultLoadoutOnTurret.AmmunitionTypesWithCount.Keys.Count > 0 ||
            vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount.Keys.Count > 0)
        {
            string finalTurretSQFCode =
                GenerateCommonBalanceInitForTheVehicle(vanillaGameDefaultLoadoutOnTurret, defaultLoadoutOnTurret, "Turret");
            finalSQFCode += finalTurretSQFCode;
        }

        // Remove weapons on non turret
        if (weaponsToRemoveUntilFactoryLevelOnAVehicle != null &&
            weaponsToRemoveUntilFactoryLevelOnAVehicle.Count > 0)
        {
            finalSQFCode += GenerateSQFCodeForWeaponRemoval();
        }

        // Remove weapons on the turret
        if (weaponsOnTheTurretToRemoveUntilFactoryLevelOnAVehicle != null &&
            weaponsOnTheTurretToRemoveUntilFactoryLevelOnAVehicle.Count > 0)
        {
            finalSQFCode += GenerateSQFCodeForWeaponRemovalOnTheTurret();
        }

        return $"{GenerateCommentForTheSqfCode()}\ncase \"{EnumExtensions.GetEnumMemberAttrValue(VehicleType)}\": {{\n" + finalSQFCode + "};";
    }

    // Generates SQF code to remove weapons from the vehicle based on the factory level and type.
    // The method uses the 'weaponsToRemoveUntilFactoryLevelOnAVehicle' dictionary to determine which weapons to remove.
    // Returns: A string containing the generated SQF code for weapon removal.
    private string GenerateSQFCodeForWeaponRemoval()
    {
        StringBuilder sb = new StringBuilder();

        // Temp solution
        string facLevelVariable = "_currentFactoryLevel";
        string facTypeVariable = "WFBE_UP_HEAVY";
        if (producedFromFactoryType == FactoryType.LIGHTFACTORY)
        {
            facTypeVariable = "WFBE_UP_LIGHT";
        }

        //     _this removeWeaponTurret ["ATKMK44_ACR", [0]];
        sb.AppendLine($"{facLevelVariable} = ((side group player) Call WFBE_CO_FNC_GetSideUpgrades) select {facTypeVariable}; ");
        sb.AppendLine($"if ({facLevelVariable} < {weaponsToRemoveUntilFactoryLevelOnAVehicle.First().Value}) then {{");
        sb.AppendLine($"    _this removeWeapon \"{EnumExtensions.GetEnumMemberAttrValue(
            weaponsToRemoveUntilFactoryLevelOnAVehicle.First().Key)}\";");
        sb.AppendLine("};");

        return sb.ToString();
    }

    // Generates SQF (Arma 2 scripting language) code to remove weapons from the turret based on factory level.
    // The method checks the current factory level for the player's faction and compares it against a predefined level.
    // If the factory level is less than the required level, the weapon on the turret is removed.
    private string GenerateSQFCodeForWeaponRemovalOnTheTurret()
    {
        StringBuilder sb = new StringBuilder();

        // Temp solution
        string facLevelVariable = "_currentFactoryLevel";
        string facTypeVariable = "WFBE_UP_HEAVY";
        if (producedFromFactoryType == FactoryType.LIGHTFACTORY)
        {
            facTypeVariable = "WFBE_UP_LIGHT";
        }

        //     _this removeWeaponTurret ["ATKMK44_ACR", [0]];
        sb.AppendLine($"{facLevelVariable} = ((side group player) Call WFBE_CO_FNC_GetSideUpgrades) select {facTypeVariable}; ");
        sb.AppendLine($"if ({facLevelVariable} < {weaponsOnTheTurretToRemoveUntilFactoryLevelOnAVehicle.First().Value}) then {{");
        sb.AppendLine($"    _this removeWeaponTurret [\"{EnumExtensions.GetEnumMemberAttrValue(
            weaponsOnTheTurretToRemoveUntilFactoryLevelOnAVehicle.First().Key)}\", [{turretPos}]];");
        sb.AppendLine("};");

        return sb.ToString();
    }

    // Generates Arma 2 SQF (Scripting language) code for initializing the balance of a vehicle's loadout.
    // This method compares the default and vanilla loadouts to produce SQF code that performs 
    // the necessary additions and removals of weapons and magazines.
    // Parameters:
    // _vanillaLoadout: The vanilla game's default loadout for the vehicle.
    // _defaultLoadout: The customized loadout that will be set for the vehicle.
    // _turret: Optional parameter, specifies if the turret is being configured.
    // Returns: 
    // A string containing SQF code for initializing the loadout balance.
    public string GenerateCommonBalanceInitForTheVehicle(Loadout _vanillaLoadout, Loadout _defaultLoadout, string _turret = "")
    {
        // Use trycatch
        bool error = false;

        Dictionary<string, List<string>> weaponsAndMagazinesToAdd = new();
        Dictionary<string, List<string>> weaponsAndMagazinesToRemove = new();

        List<string> extraWeaponsToAdd = new();
        List<string> extraWeaponsToRemove = new();

        // Use trycatch
        if (error)
        {
            Console.WriteLine("Error!!! " + nameof(weaponsAndMagazinesToRemove) +
                " was null! Plane " + vehicleType + " not configured right? aborted: " + nameof(GenerateCommonBalanceInitForTheVehicle));
            return "[ERROR]";
        }

        var commonKeys = CompareAmmunitionDictionaries(_vanillaLoadout.AmmunitionTypesWithCount, _defaultLoadout.AmmunitionTypesWithCount);

        List<WeaponType> allowedWeapons = new List<WeaponType>();
        List<WeaponType> vanillaWeapons = new List<WeaponType>();

        foreach (var item in _defaultLoadout.AmmunitionTypesWithCount)
        {
            var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(item.Key.ToString());
            var weaponDefinition = (InterfaceWeapon)ammunitionType.weaponDefinition;

            allowedWeapons.Add(weaponDefinition.WeaponType);
        }

        foreach (var item in _vanillaLoadout.AmmunitionTypesWithCount)
        {
            var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(item.Key.ToString());
            var weaponDefinition = (InterfaceWeapon)ammunitionType.weaponDefinition;

            vanillaWeapons.Add(weaponDefinition.WeaponType);
        }

        foreach (var commonKey in commonKeys)
        {
            foreach (AmmunitionType item in Enum.GetValues(typeof(AmmunitionType)))
            {
                var ammunitionType = (InterfaceAmmunition)EnumExtensions.GetInstance(item.ToString());
                var weaponDefinition = (InterfaceWeapon)ammunitionType.weaponDefinition;
                var weaponDefinitionString = EnumExtensions.GetEnumMemberAttrValue(weaponDefinition.WeaponType);
                foreach (var ammoTypes in ammunitionType.AmmunitionTypes)
                {
                    var ammoTypesString = EnumExtensions.GetEnumMemberAttrValue(ammoTypes);

                    if (ammoTypesString == commonKey)
                    {
                        if (allowedWeapons.Contains(weaponDefinition.WeaponType))
                        {
                            if (!extraWeaponsToAdd.Contains(weaponDefinitionString))
                            {
                                extraWeaponsToAdd.Add(weaponDefinitionString);

                                foreach (var vanillaWeapon in vanillaWeapons)
                                {
                                    var allVanillaAmmunitionTypes = (InterfaceAmmunition)EnumExtensions.GetInstance(item.ToString());

                                    foreach (var vanillaAmmunitionType in allVanillaAmmunitionTypes.AmmunitionTypes)
                                    {
                                        var vanillaWeaponDefinition = (InterfaceWeapon)ammunitionType.weaponDefinition;

                                        if (vanillaWeaponDefinition.WeaponType == weaponDefinition.WeaponType)
                                        {
                                            extraWeaponsToRemove.Add(EnumExtensions.GetEnumMemberAttrValue(vanillaWeapon));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        // Populate weapons and magazines
        error = PopulateWeaponsAndMagazines(_defaultLoadout.AmmunitionTypesWithCount, weaponsAndMagazinesToAdd);
        error = PopulateWeaponsAndMagazines(_vanillaLoadout.AmmunitionTypesWithCount, weaponsAndMagazinesToRemove);
        // Use trycatch

        if (error)
        {
            Console.WriteLine("Error!!! " + nameof(weaponsAndMagazinesToRemove) +
                " was null! Plane " + vehicleType + " not configured right? aborted: " + nameof(GenerateCommonBalanceInitForTheVehicle));
            return "[ERROR]";
        }

        // Magazines and weapons to add
        List<string> magazinesToAdd = GetAllMagazines(weaponsAndMagazinesToAdd)
            .Where(mag => !_vanillaLoadout.AmmunitionTypesWithCount.Keys
                .Select(a => EnumExtensions.GetEnumMemberAttrValue(a))
                .Contains(mag))
            .Distinct()  // Ensure unique magazines
            .ToList();

        // Magazines and weapons to remove
        List<string> magazinesToRemove = GetAllMagazines(weaponsAndMagazinesToRemove)
            .Where(mag => !_defaultLoadout.AmmunitionTypesWithCount.Keys
                .Select(a => EnumExtensions.GetEnumMemberAttrValue(a))
                .Contains(mag))
            .Distinct()  // Ensure unique magazines
            .ToList();

        List<string> weaponsToAdd = weaponsAndMagazinesToAdd.Keys
            .Where(weapon => magazinesToAdd.Any(mag => weaponsAndMagazinesToAdd[weapon].Contains(mag)))
            .Distinct()  // Ensure unique weapons
            .ToList();

        List<string> weaponsToRemove = weaponsAndMagazinesToRemove.Keys
            .Where(weapon => magazinesToRemove.Any(mag => weaponsAndMagazinesToRemove[weapon].Contains(mag)))
            .Distinct()  // Ensure unique weapons
            .ToList();

        weaponsToAdd.AddRange(extraWeaponsToAdd);
        
        // Remove duplicate entries from the weapons to remove
        foreach (var weapon in extraWeaponsToRemove)
        {
            if (!weaponsToRemove.Contains(weapon))
            {
                weaponsToRemove.Add(weapon);
            }
        }

        // Remove common elements from both lists
        var commonWeapons = weaponsToRemove.Intersect(weaponsToAdd).ToList();
        foreach (var commonWeapon in commonWeapons)
        {
            weaponsToRemove.Remove(commonWeapon);
            weaponsToAdd.Remove(commonWeapon);
        }

        Dictionary<string, int> magazinesToAddv2 = ConvertToMagazineDictionary(weaponsAndMagazinesToAdd);
        Dictionary<string, int> magazinesToRemovev2 = ConvertToMagazineDictionary(weaponsAndMagazinesToRemove);

        foreach (var key in magazinesToAddv2.Keys.ToList()) // Using ToList() to avoid collection modification error
        {
            if (magazinesToRemovev2.ContainsKey(key) && magazinesToRemovev2[key] == magazinesToAddv2[key])
            {
                magazinesToAddv2.Remove(key);
                magazinesToRemovev2.Remove(key);
            }
        }

        string addSQFCode = GenerateSQFCodeInner(magazinesToAddv2, weaponsToAdd, "add", _turret);
        string removeSQFCode = GenerateSQFCodeInner(magazinesToRemovev2, weaponsToRemove, "remove", _turret);

        return removeSQFCode + addSQFCode;
    }

    // Converts a dictionary mapping weapons to magazines into a dictionary mapping magazines to their counts.
    // Parameters:
    // weaponsAndMagazines: A dictionary mapping weapon types to their associated magazines.
    // Returns:
    // A dictionary where keys are magazine types and values are the counts of each magazine type.
    private Dictionary<string, int> ConvertToMagazineDictionary(Dictionary<string, List<string>> weaponsAndMagazines)
    {
        Dictionary<string, int> result = new Dictionary<string, int>();
        foreach (var weaponMagazines in weaponsAndMagazines)
        {
            foreach (var magazine in weaponMagazines.Value)
            {
                if (result.ContainsKey(magazine))
                {
                    result[magazine]++;
                }
                else
                {
                    result[magazine] = 1;
                }
            }
        }
        return result;
    }

    // Populates a dictionary with weapons and their associated magazines based on a given ammunition count.
    // Parameters:
    // _ammunitionTypesWithCount: A dictionary mapping ammunition types to their counts.
    // _weaponsAndMagazines: A dictionary to populate with weapon types and their associated magazines.
    // Returns:
    // A boolean indicating if an error occurred (true if error, false otherwise).
    private bool PopulateWeaponsAndMagazines(
        Dictionary<AmmunitionType, int> _ammunitionTypesWithCount,
        Dictionary<string, List<string>> _weaponsAndMagazines)
    {
        if (_ammunitionTypesWithCount == null)
        {
            Console.WriteLine("Error!!! " + nameof(_ammunitionTypesWithCount) + " was null! Plane " + vehicleType + " not configured right?");
            return true;
        }

        foreach (var ammo in _ammunitionTypesWithCount)
        {
            var ammoMapping = (InterfaceAmmunition)EnumExtensions.GetInstance(ammo.Key.ToString());
            var weaponMapping = (InterfaceWeapon)EnumExtensions.GetInstance(ammoMapping.weaponDefinition.WeaponType.ToString());

            List<string> magazines = new List<string>();
            for (int i = 0; i < ammo.Value; i++)
            {
                magazines.AddRange(ammoMapping.AmmunitionTypes.Select(a => EnumExtensions.GetEnumMemberAttrValue(a)));
            }

            string weaponTypeString = EnumExtensions.GetEnumMemberAttrValue(weaponMapping.WeaponType);

            if (_weaponsAndMagazines.ContainsKey(weaponTypeString))
            {
                _weaponsAndMagazines[weaponTypeString].AddRange(magazines);
            }
            else
            {
                _weaponsAndMagazines[weaponTypeString] = magazines;
            }
        }
        return false;
    }

    // Collects all the magazines from a dictionary that maps weapons to magazines.
    // Parameters:
    // _weaponsAndMagazines: A dictionary mapping weapon types to their associated magazines.
    // Returns:
    // A list containing all unique magazines from the dictionary.
    private List<string> GetAllMagazines(Dictionary<string, List<string>> _weaponsAndMagazines)
    {
        return _weaponsAndMagazines.Values.SelectMany(m => m).ToList();
    }

    // Generates the SQF code snippet for adding or removing magazines and weapons.
    // Parameters:
    // _magazines: A dictionary mapping magazine types to their counts.
    // _weapons: A list of weapons.
    // _action: The action to be performed, either "add" or "remove".
    // _turret: Optional parameter to specify if the operation is for a turret.
    // Returns:
    // A string containing the generated SQF code snippet.
    private string GenerateSQFCodeInner(Dictionary<string, int> _magazines, IEnumerable<string> _weapons, string _action, string _turret)
    {
        string magazineAction = _action == "add" ? "add" + "Magazine" + _turret : "remove" + "Magazine" + _turret;
        string weaponAction = _action == "add" ? "add" + "Weapon" + _turret : "remove" + "Weapon" + _turret;

        StringBuilder sqfCode = new StringBuilder();

        if (_magazines.Any())
        {
            foreach (var mags in _magazines)
            {
                for (int i = 0; i < mags.Value / 2; i++)
                {
                    if (string.IsNullOrEmpty(_turret))
                    {
                        sqfCode.AppendLine($"    _this {magazineAction} \"{mags.Key}\";");
                    }
                    else
                    {
                        sqfCode.AppendLine($"    _this {magazineAction} [\"{mags.Key}\", [{turretPos}]];");
                    }
                }
            }
        }

        if (_weapons.Any())
        {
            foreach (var weapon in _weapons)
            {
                if (string.IsNullOrEmpty(_turret))
                {
                    sqfCode.AppendLine($"    _this {weaponAction} \"{weapon}\";");
                }
                else
                {
                    sqfCode.AppendLine($"    _this {weaponAction} [\"{weapon}\", [{turretPos}]];");
                }
            }
        }

        return sqfCode.ToString();
    }

    // Compares two dictionaries mapping ammunition types to their counts and finds the different keys.
    // Parameters:
    // _firstDictionary: The first dictionary to compare.
    // _secondDictionary: The second dictionary to compare.
    // Returns:
    // A list of keys that are different between the two dictionaries.
    private List<string> CompareAmmunitionDictionaries(
        Dictionary<AmmunitionType, int> _firstDictionary,
        Dictionary<AmmunitionType, int> _secondDictionary)
    {
        var firstDictMapping = ConvertDictionaryAmmunutionTypeIntToDictionary(_firstDictionary);
        var secondDictMapping = ConvertDictionaryAmmunutionTypeIntToDictionary(_secondDictionary);

        return firstDictMapping
            .Where(kv1 => secondDictMapping.ContainsKey(kv1.Key) && secondDictMapping[kv1.Key] != kv1.Value) // Check if weapon types are different
            .Select(kv1 => kv1.Key)
            .ToList();
    }

    // Converts a dictionary mapping ammunition types to counts into another dictionary mapping ammunition type strings to weapon types.
    // Parameters:
    // _input: The input dictionary mapping ammunition types to their counts.
    // Returns:
    // A dictionary mapping ammunition type strings to their associated weapon types.
    private Dictionary<string, WeaponType> ConvertDictionaryAmmunutionTypeIntToDictionary(Dictionary<AmmunitionType, int> _input)
    {
        Dictionary<string, WeaponType> ammunitionTypeToWeaponType = new Dictionary<string, WeaponType>();

        foreach (var ammunitionType in _input)
        {
            var ammunitionTypeInterface = (InterfaceAmmunition)EnumExtensions.GetInstance(ammunitionType.Key.ToString());
            var weaponDefinition = (InterfaceWeapon)ammunitionTypeInterface.weaponDefinition;

            foreach (var item in ammunitionTypeInterface.AmmunitionTypes)
            {
                string ammunitionTypeString = EnumExtensions.GetEnumMemberAttrValue(item);
                ammunitionTypeToWeaponType[ammunitionTypeString] = weaponDefinition.WeaponType;
            }
        }

        return ammunitionTypeToWeaponType;
    }
}