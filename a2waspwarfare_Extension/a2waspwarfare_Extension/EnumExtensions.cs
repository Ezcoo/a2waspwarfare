using System;
using System.Linq;
using System.Runtime.Serialization;

public static class EnumExtensions
{
    public static object GetInstance(string _string)
    {
        Log.WriteLine("GetInstance string: " + _string);

        Type t = Type.GetType(_string.ToUpper());

        if (t == null)
        {
            Log.WriteLine("type was null for: " + _string.ToUpper(), LogLevel.CRITICAL);
            throw new InvalidOperationException("type was null for: " + _string.ToUpper());
        }
        Log.WriteLine("Generated type: " + t);

        var instance = Activator.CreateInstance(t);
        if (instance == null)
        {
            Log.WriteLine("instance was null for: " + _string.ToUpper(), LogLevel.CRITICAL);
            throw new InvalidOperationException("instance was null for: " + _string.ToUpper());
        }
        Log.WriteLine("Generated instance: " + instance);

        return instance;
    }

    //public static string GetEnumMemberAttrValue(object _enumVal)
    //{
    //    string? enumValString = _enumVal.ToString();
    //    if (enumValString == null)
    //    {
    //        return "null";
    //    }

    //    Log.WriteLine("enumValString: " + enumValString);

    //    var type = _enumVal.GetType();
    //    if (type == typeof(string))
    //    {
    //        Log.WriteLine("Trying to insert a string to: " + nameof(GetEnumMemberAttrValue), LogLevel.WARNING);
    //    }
    //    else
    //    {
    //        Log.WriteLine(nameof(type) + ": " + type.ToString());
    //    }

    //    var memInfo = _enumVal.GetType().GetMember(enumValString);

    //    Log.WriteLine(nameof(memInfo) + ": " + memInfo.ToString());

    //    var attr = memInfo[0].GetCustomAttributes(false).OfType<EnumMemberAttribute>().FirstOrDefault();

    //    if (attr == null)
    //    {
    //        Log.WriteLine("attr was null!", LogLevel.CRITICAL);
    //        return "null";
    //    }

    //    if (attr.Value == null)
    //    {
    //        Log.WriteLine("attr.value was null!", LogLevel.CRITICAL);
    //        return "null";
    //    }
    //    Log.WriteLine("returning attr.value: " + attr.Value);

    //    return attr.Value;
    //}
}