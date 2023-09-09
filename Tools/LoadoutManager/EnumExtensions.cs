using System.Runtime.Serialization;

// This class serves as a utility for working with enums.
public static class EnumExtensions
{
    // The GetInstance method aims to get the instance of a class, by given string.
    public static object GetInstance(string _string)
    {
        Type? t = Type.GetType(_string.ToUpper());

        if (t == null)
        {
            throw new InvalidOperationException("type was null for: " + _string.ToUpper());
        }

        var instance = Activator.CreateInstance(t);
        if (instance == null)
        {
            throw new InvalidOperationException("instance was null for: " + _string.ToUpper());
        }

        return instance;
    }

    // The GetEnumMemberAttrValue method aims to get the members Enum name, such as the vehicle's SQF config name
    public static string GetEnumMemberAttrValue(object _enumVal)
    {
        string? enumValString = _enumVal.ToString();
        if (enumValString == null)
        {
            return "null";
        }

        var memInfo = _enumVal.GetType().GetMember(enumValString);
        var attr = memInfo[0].GetCustomAttributes(false).OfType<EnumMemberAttribute>().FirstOrDefault();

        if (attr == null)
        {
            return "null";
        }

        if (attr.Value == null)
        {
            return "null";
        }

        return attr.Value;
    }
}