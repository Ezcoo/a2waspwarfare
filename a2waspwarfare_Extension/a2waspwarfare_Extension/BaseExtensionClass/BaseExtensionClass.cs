using System;

public abstract class BaseExtensionClass : InterfaceExtension
{
    public void ActivateExtensionMethodAndSerialize(string[] _args)
    {
        try
        {
            Log.WriteLine("Activating extension method on: " + this.GetType() +
                " with args count: " + _args.Length, LogLevel.DEBUG);

            ActivateExtensionMethodOnTheDerivedClass(_args);

            Log.WriteLine("Finished activating method on the derived class");

            SerializationManager.SerializeDB();
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message);
            throw new InvalidOperationException(_ex.Message);
        }
    }

    public abstract void ActivateExtensionMethodOnTheDerivedClass(string[] _args);
}