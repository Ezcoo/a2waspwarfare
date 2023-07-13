using System;

public static class ArrayTools
{
    public static string[] SplitArgsToArray(string _argsString)
    {
        try
        {
            Log.WriteLine("Splitting args to array: " + _argsString);
            return _argsString.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
    }

    public static string[] RemoveFirstElement(string[] _array)
    {
        try
        {
            string[] newArray = new string[_array.Length - 1];
            Array.Copy(_array, 1, newArray, 0, _array.Length - 1);
            return newArray;
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
    }
}