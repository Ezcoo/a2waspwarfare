using RGiesecke.DllExport;
using System.Runtime.InteropServices;
using System.Text;

namespace a2waspwarfare_Extension
{
    public class ExtensionMethods
    {
        [DllExport("_RVExtension@12", CallingConvention = CallingConvention.Winapi)]
        public static void RvExtension(StringBuilder _output, int _outputSize, [MarshalAs(UnmanagedType.LPStr)] string _function)
        {
            Log.WriteLine("Test-Extension v1.0: " + _function, LogLevel.DEBUG);
            Log.WriteLine(_function.ToString());
        }
    }
}