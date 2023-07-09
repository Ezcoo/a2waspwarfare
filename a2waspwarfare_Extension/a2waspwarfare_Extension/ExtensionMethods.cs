﻿using System;
using System.Text;
using RGiesecke.DllExport;
using System.Runtime.InteropServices;

namespace a2waspwarfare_Extension
{
    public enum ExtensionName
    {
        TESTEXTENSIONCLASS,
        ACTUALEXTENSIONCLASS,
    }

    public interface InterfaceExtension
    {
        // Define interface methods here (if any)
        void ActivateExtensionMethod(string[] _args);
    }

    public abstract class BaseExtensionClass : InterfaceExtension
    {
        public abstract void ActivateExtensionMethod(string[] _args);
        // Add other abstract methods or properties here if needed
    }

    public class TestExtensionClass : BaseExtensionClass
    {
        public override void ActivateExtensionMethod(string[] _args)
        {
            Log.WriteLine("testing functionality of " + nameof(TestExtensionClass));
            Log.WriteLine("asd", LogLevel.DEBUG);
            // Implement specific functionality for TestExtensionClass here
            // Use _args parameter as needed
        }

        // Add any additional methods or properties specific to TestExtensionClass
    }

    public class ActualExtensionClass : BaseExtensionClass
    {
        public override void ActivateExtensionMethod(string[] _args)
        {
            Log.WriteLine("testing functionality of " + nameof(ActualExtensionClass));
        }
    }


    public class ExtensionMethods
    {
        [DllExport("_RVExtension@12", CallingConvention = CallingConvention.Winapi)]
        public static void RvExtension(StringBuilder _output, int _outputSize, [MarshalAs(UnmanagedType.LPStr)] string _argsAsString)
        {
            Log.WriteLine("Received args as: " + _argsAsString);

            var splitArgsArray = SplitArgsToArray(_argsAsString);
            var extensionNameAsString = splitArgsArray[0];
            splitArgsArray = RemoveFirstElement(splitArgsArray);

            Log.WriteLine("Reveived args count: " + splitArgsArray.Length + " with " + nameof(BaseExtensionClass));
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
            extensionClass.ActivateExtensionMethod(splitArgsArray);
        }

        private static InterfaceExtension GetExtensionInstance(ExtensionName _extensionName)
        {
            Log.WriteLine("Getting instance: " + _extensionName, LogLevel.DEBUG);
            try
            {
                return (InterfaceExtension)EnumExtensions.GetInstance(_extensionName.ToString());
            }
            catch (Exception ex)
            {
                Log.WriteLine(ex.Message, LogLevel.CRITICAL);
                throw new InvalidOperationException(ex.Message);
            }
        }

        public static string[] SplitArgsToArray(string _argsString)
        {
            Log.WriteLine("Splitting args to array: " + _argsString);
            return _argsString.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
        }

        public static string[] RemoveFirstElement(string[] _array)
        {
            string[] newArray = new string[_array.Length - 1];
            Array.Copy(_array, 1, newArray, 0, _array.Length - 1);
            return newArray;
        }
    }
}