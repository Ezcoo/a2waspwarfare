using System;
using System.Globalization;
using System.IO;
using System.Runtime.CompilerServices;

public static class Log
{
    public static string logsPath = @"C:\DiscordBotFramework\Logs\";

    public static void WriteLine(
        string _message,
        LogLevel _logLevel = LogLevel.VERBOSE,
        [CallerFilePath] string _filePath = "",
        [CallerMemberName] string _memberName = "",
        [CallerLineNumber] int _lineNumber = 0)
    {
        CultureInfo culture = CultureInfo.CurrentCulture;

        string date = DateTime.Now.Date.ToString("dd.MM.yyyy", culture);
        string time = DateTime.Now.ToString("hh:mm:ss.fff", culture);

        string callerMethod = ": " + _memberName + "()";
        if (_memberName == "") callerMethod = string.Empty;
        string scriptName = Path.GetFileName(_filePath);

        if (!LogLevelNormalization.logLevelNormalizationStrings.ContainsKey(_logLevel))
        {
            LogLevelNormalization.InitLogLevelNormalizationStrings();
        }

        string logMessageRaw = (date + " " + time + " {Thread: " + System.Environment.CurrentManagedThreadId + "} - [LOG | " + _logLevel + "] " +
            LogLevelNormalization.logLevelNormalizationStrings[_logLevel] + " " +
            scriptName + callerMethod +
            ", line " + _lineNumber + ": " + _message);

        WriteToFileLogFile(_logLevel, logMessageRaw, scriptName);

        Console.WriteLine(logMessageRaw);
    }

    private static void WriteToFileLogFile(LogLevel _logLevel, string _logMessage, string _scriptName)
    {
        CheckIfDirectoryExistsAndAppendToTheFile(logsPath, _logLevel.ToString(), _logMessage);
        CheckIfDirectoryExistsAndAppendToTheFile(logsPath, "EVERYTHING", _logMessage);

        if (_scriptName == "MatchScheduler.cs")
        {
            CheckIfDirectoryExistsAndAppendToTheFile(logsPath, _scriptName, _logMessage);
        }
    }


    // Move this out of the Log.cs file
    private static void CheckIfDirectoryExistsAndAppendToTheFile(string _directory, string _logLevel, string _content)
    {
        if (!Directory.Exists(_directory))
        {
            Directory.CreateDirectory(_directory);
        }

        string fileExtension = ".log";
        string pathToFile = _directory + _logLevel + fileExtension;

        string contentWithNewLine = Environment.NewLine + _content;

        FileManager.AppendText(pathToFile, contentWithNewLine);
    }
}