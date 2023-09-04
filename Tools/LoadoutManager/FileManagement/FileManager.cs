// The FileManager class serves as a comprehensive utility for managing files and directories.
// It provides methods to copy files and directories from a source to a destination while ensuring the destination directory exists.
// It also has methods for recursively copying subdirectories and for cleaning up extra files and directories at the destination.
public class FileManager

{
    // Orchestrates the process of copying files and directories from the source to the destination.
    // Ensures the destination directory exists, copies the files, and cleans up any extra files and directories.
    public static void CopyFilesFromSourceToDestination(string _source, string _destination)
    {
        EnsureDirectoryExists(_destination);
        CopyFiles(_source, _destination);
        RecursivelyCopySubdirectories(_source, _destination);
        DeleteExtraFiles(_source, _destination);
        DeleteExtraDirectories(_source, _destination);
    }

    // Ensures that the directory exists at the specified path. Creates the directory if it doesn't exist.
    private static void EnsureDirectoryExists(string _directoryPath)
    {
        Directory.CreateDirectory(_directoryPath);
    }

    // Copies each file from the source directory to the destination directory. Overwrites existing files.
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

    // Determines whether the given file should be skipped based on its name. Skips files with specific extensions
    // or naming conventions (the ones that are unique to each of the terrains)
    private static bool ShouldSkipFile(string _fileName)
    {
        return _fileName.EndsWith("mission.sqm", StringComparison.OrdinalIgnoreCase) ||
               (_fileName.EndsWith("version.sqf", StringComparison.OrdinalIgnoreCase) &&
                !_fileName.EndsWith("Init_Version.sqf", StringComparison.OrdinalIgnoreCase));
    }

    // Recursively copies all subdirectories from the source to the destination using the main orchestrator method.
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

    // Deletes extra files in the destination directory that do not exist in the source directory, skipping files based on naming conventions.
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

    // Deletes extra directories in the destination that do not have corresponding directories in the source.
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

    // Ensures that the program is being ran in the correct directory, throws error if this is not the case.
    public static DirectoryInfo FindA2WaspWarfareDirectory()
    {
        string currentDirectory = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location);
        DirectoryInfo dir = new DirectoryInfo(currentDirectory);

        while (dir.Name != "a2waspwarfare" && dir.Parent != null)
        {
            dir = dir.Parent;
        }

        if (dir.Name != "a2waspwarfare")
        {
            throw new Exception("Could not find the 'a2waspwarfare' directory.");
        }

        return dir;
    }
}