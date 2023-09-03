using System;
using System.IO;

public class FileManager
{
    public static void CopyFilesFromSourceToDestination(string _source, string _destination)
    {
        EnsureDirectoryExists(_destination);
        CopyFiles(_source, _destination);
        RecursivelyCopySubdirectories(_source, _destination);
        DeleteExtraFiles(_source, _destination);
        DeleteExtraDirectories(_source, _destination);
    }

    private static void EnsureDirectoryExists(string _directoryPath)
    {
        Directory.CreateDirectory(_directoryPath);
    }

    private static void CopyFiles(string _source, string _destination)
    {
        foreach (var file in Directory.GetFiles(_source))
        {
            string fileName = Path.GetFileName(file);

            if (ShouldSkipFile(fileName))
            {
                continue;
            }

            string destFile = Path.Combine(_destination, fileName);
            File.Copy(file, destFile, true);
        }
    }

    private static bool ShouldSkipFile(string _fileName)
    {
        return _fileName.EndsWith("mission.sqm", StringComparison.OrdinalIgnoreCase) ||
               (_fileName.EndsWith("version.sqf", StringComparison.OrdinalIgnoreCase) &&
                !_fileName.EndsWith("Init_Version.sqf", StringComparison.OrdinalIgnoreCase));
    }

    private static void RecursivelyCopySubdirectories(string _source, string _destination)
    {
        foreach (var directory in Directory.GetDirectories(_source))
        {
            string dirName = Path.GetFileName(directory);
            if (dirName == null) continue;

            string destDir = Path.Combine(_destination, dirName);
            CopyFilesFromSourceToDestination(directory, destDir);
        }
    }

    private static void DeleteExtraFiles(string _source, string _destination)
    {
        foreach (var destFile in Directory.GetFiles(_destination))
        {
            string fileName = Path.GetFileName(destFile);

            if (ShouldSkipFile(fileName))
            {
                continue;
            }

            string correspondingSourceFile = Path.Combine(_source, fileName);
            if (!File.Exists(correspondingSourceFile))
            {
                File.Delete(destFile);
            }
        }
    }

    private static void DeleteExtraDirectories(string _source, string _destination)
    {
        foreach (var destDir in Directory.GetDirectories(_destination))
        {
            string dirName = Path.GetFileName(destDir);
            if (dirName == null) continue;

            string correspondingSourceDir = Path.Combine(_source, dirName);
            if (!Directory.Exists(correspondingSourceDir))
            {
                Directory.Delete(destDir, true);
            }
        }
    }
}
