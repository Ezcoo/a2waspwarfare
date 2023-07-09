using System;

public class TESTEXTENSIONCLASS : BaseExtensionClass
{
    public override void ActivateExtensionMethod(string[] _args)
    {
        try
        {
            Log.WriteLine("testing functionality of " + nameof(TESTEXTENSIONCLASS));
            Log.WriteLine("asd", LogLevel.DEBUG);
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message);
            throw new InvalidOperationException(_ex.Message);
        }
    }
}