using System;

public class GLOBALGAMESTATS : BaseExtensionClass
{
    // Args:
    // [0] BLUFOR SCORE
    // [1] OPFOR SCORE
    // Todo:
    // [2] Uptime
    // [3] Current map
    // [4] Player count
    // [5] Match id etc
    public override void ActivateExtensionMethodOnTheDerivedClass(string[] _args)
    {
        try
        {
            Log.WriteLine("Exporting args on " + nameof(GLOBALGAMESTATS), LogLevel.DEBUG);

            GameData.Instance.exportedArgs = _args;

            Log.WriteLine("Done exporting args on " + nameof(GLOBALGAMESTATS), LogLevel.DEBUG);
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
    }
}