using System;

public class ACTUALEXTENSIONCLASS : BaseExtensionClass
{
    public override void ActivateExtensionMethod(string[] _args)
    {
        try
        {
            Log.WriteLine("testing functionality of " + nameof(ACTUALEXTENSIONCLASS));
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message);
            throw new InvalidOperationException(_ex.Message);
        }
    }
}