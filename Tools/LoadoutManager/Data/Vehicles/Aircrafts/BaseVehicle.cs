using System.Linq;
using System.Runtime.Serialization;
using System.Text;

public abstract class BaseVehicle : InterfaceVehicle
{
    public VehicleType VehicleType { get => vehicleType; set => vehicleType = value; }
    string InterfaceVehicle.InGameDisplayName { get => inGameDisplayName ; set => inGameDisplayName = value; }
    public int InGameFactoryLevel { get => inGameFactoryLevel; set => inGameFactoryLevel = value; }

    protected VehicleType vehicleType { get; set; }

    protected Loadout defaultLoadout { get; set; }
    protected Loadout defaultLoadoutOnTurret { get; set; }
    protected Loadout vanillaGameDefaultLoadout { get; set; }
    protected Loadout vanillaGameDefaultLoadoutOnTurret { get; set; }
    protected int inGameFactoryLevel { get; set; }
    // Add vehicle factory type
    protected string inGameDisplayName { get; set; }

    // Add price etc here for more advanced SQF generation

    protected BaseVehicle()
    {
        vanillaGameDefaultLoadout = new Loadout();
        vanillaGameDefaultLoadout.AmmunitionTypesWithCount = new();
        vanillaGameDefaultLoadoutOnTurret = new Loadout();
        vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount = new();
    }

    public void StartGeneratingCommonBalanceInitForTheVehicle()
    {
        string finalSQFCode = GenerateCommonBalanceInitForTheVehicle(vanillaGameDefaultLoadout, defaultLoadout);
        if (defaultLoadoutOnTurret.AmmunitionTypesWithCount.Keys.Count > 0 ||
            vanillaGameDefaultLoadoutOnTurret.AmmunitionTypesWithCount.Keys.Count > 0)
        {
            string finalTurretSQFCode =
                GenerateCommonBalanceInitForTheVehicle(vanillaGameDefaultLoadoutOnTurret, defaultLoadoutOnTurret, "Turret");
            finalSQFCode += finalTurretSQFCode;
        }

        Console.WriteLine($"case \"{VehicleType}\": {{\n" + finalSQFCode + "};");
    }

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

        var commonKeys = CompareDictionaries(_vanillaLoadout.AmmunitionTypesWithCount, _defaultLoadout.AmmunitionTypesWithCount);

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

        weaponsToRemove.AddRange(extraWeaponsToRemove);
        weaponsToAdd.AddRange(extraWeaponsToAdd);


        Dictionary<string, int> magazinesToAddv2 = ConvertToMagazineDictionary(weaponsAndMagazinesToAdd);
        Dictionary<string, int> magazinesToRemovev2 = ConvertToMagazineDictionary(weaponsAndMagazinesToRemove);

        string addSQFCode = GenerateSQFCodeInner(magazinesToAddv2, weaponsToAdd, "add", _turret);
        string removeSQFCode = GenerateSQFCodeInner(magazinesToRemovev2, weaponsToRemove, "remove", _turret);

        return addSQFCode + removeSQFCode;
    }

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

    private List<string> GetAllMagazines(Dictionary<string, List<string>> _weaponsAndMagazines)
    {
        return _weaponsAndMagazines.Values.SelectMany(m => m).ToList();
    }

    private string GenerateSQFCodeInner(Dictionary<string, int> _magazines, IEnumerable<string> _weapons, string _action, string _turret)
    {
        string magazineAction = _action == "add" ? "add" + _turret + "Magazine" : "remove" + _turret + "Magazine";
        string weaponAction = _action == "add" ? "add" + _turret + "Weapon" : "remove" + _turret + "Weapon";

        StringBuilder sqfCode = new StringBuilder();

        if (_magazines.Any())
        {
            foreach (var mags in _magazines)
            {
                for (int i = 0; i < mags.Value/2; i++)
                {
                    sqfCode.AppendLine($"    _this {magazineAction} \"{string.Join($"\";\n    _this {magazineAction} \"", mags.Key)}\";");
                }
            }
        }

        if (_weapons.Any())
        {
            sqfCode.AppendLine($"    _this {weaponAction} \"{string.Join($"\";\n    _this {weaponAction} \"", _weapons)}\";");
        }

        if (_action == "remove")
        {

        }

        return sqfCode.ToString();
    }

    private List<string> CompareDictionaries(
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