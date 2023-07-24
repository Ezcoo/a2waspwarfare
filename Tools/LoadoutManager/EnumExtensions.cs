using System;
using System.Linq;
using System.Runtime.Serialization;

public static class EnumExtensions
{
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

    public static string GetEnumMemberAttrValue(object _enumVal)
    {
        string? enumValString = _enumVal.ToString();
        if (enumValString == null)
        {
            return "null";
        }

        var type = _enumVal.GetType();
        if (type == typeof(string))
        {
            // You can handle this case separately if needed.
        }
        else
        {
            // You can log or handle the type information differently if needed.
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
