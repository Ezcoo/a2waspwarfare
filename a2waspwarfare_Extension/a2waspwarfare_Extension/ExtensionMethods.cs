using System;
using System.Text;
using RGiesecke.DllExport;
using System.Runtime.InteropServices;

// https://community.bistudio.com/wiki/Extensions

public class ExtensionMethods
{
    [DllExport("_RVExtension@12", CallingConvention = CallingConvention.Winapi)]
    public static void RvExtension(
        StringBuilder _output, int _outputSize, [MarshalAs(UnmanagedType.LPStr)] string _argsAsString)
    {
        try
        {
            Log.WriteLine("Received args as: " + _argsAsString, LogLevel.DEBUG);

            var splitArgsArray = ArrayTools.SplitArgsToArray(_argsAsString);
            var extensionNameAsString = splitArgsArray[0];
            splitArgsArray = ArrayTools.RemoveFirstElement(splitArgsArray);

            Log.WriteLine("Reveived args count: " + splitArgsArray.Length +
                " with " + nameof(BaseExtensionClass));
            foreach (var item in splitArgsArray)
            {
                Log.WriteLine(item);
            }

            if (!Enum.TryParse(extensionNameAsString, out ExtensionName _extensionName))
            {
                Log.WriteLine("Invalid extension name: " + extensionNameAsString, LogLevel.CRITICAL);
                return;
            }

            BaseExtensionClass extensionClass = (BaseExtensionClass)GetExtensionInstance(_extensionName);
            extensionClass.ActivateExtensionMethodAndSerialize(splitArgsArray);
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message);
            return;
        }
    }

    private static InterfaceExtension GetExtensionInstance(ExtensionName _extensionName)
    {
        try
        {
            Log.WriteLine("Getting instance: " + _extensionName, LogLevel.DEBUG);
            return (InterfaceExtension)EnumExtensions.GetInstance(_extensionName.ToString());
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
    }
}
