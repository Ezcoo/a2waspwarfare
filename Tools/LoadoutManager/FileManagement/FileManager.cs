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
        return (_fileName.EndsWith("mission.sqm", StringComparison.OrdinalIgnoreCase) ||
               _fileName.EndsWith("version.sqf", StringComparison.OrdinalIgnoreCase) ||
               // Convert to list to not to convert from Cherno to takistan,
               // use as parameter to add to the list above
               _fileName.EndsWith("GUI_Menu_Help.sqf", StringComparison.OrdinalIgnoreCase) ||
               _fileName.EndsWith("Init_Server.sqf", StringComparison.OrdinalIgnoreCase) ||
               _fileName.EndsWith("texHeaders.bin", StringComparison.OrdinalIgnoreCase) ||
               _fileName.EndsWith("StartVeh.sqf", StringComparison.OrdinalIgnoreCase) ||
               _fileName.EndsWith("Parameters.hpp", StringComparison.OrdinalIgnoreCase) ||
               _fileName.EndsWith("loadScreen.jpg", StringComparison.OrdinalIgnoreCase)
               )&&


               !_fileName.EndsWith("Init_Version.sqf", StringComparison.OrdinalIgnoreCase); // because there's version.sqf
    }

    // Recursively copies all subdirectories from the source to the destination using the main orchestrator method.
    private static void RecursivelyCopySubdirectories(string _source, string _destination)
    {
        List<string> blacklistedDirectories = new List<string>
        {
            "Textures",
            @"Server\Config"
        };

        foreach (var directory in Directory.GetDirectories(_source))
        {
            string directoryName = Path.GetFileName(directory);
            bool shouldSkipDirectory = blacklistedDirectories.Any(blacklist => directory.EndsWith(blacklist));

            // Check if directoryName ends with any string in blacklistedDirectories
            // Only when copying to takistan
            if (shouldSkipDirectory && _destination.Contains("co.Takistan"))
            {
                continue; // Exit the method if the directory is blacklisted
            }

            if (directoryName == null) continue;

            string destinationDirectory = Path.Combine(_destination, directoryName);
            CopyFilesFromSourceToDestination(directory, destinationDirectory);
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

    // This method traverses a directory and lists all the file paths.
    // It takes in a directory path and an optional file type.
    // If a file type is specified, it will only list files of that type.
    public static List<string> ListFilesInDirectory(string _directoryPath, string _fileType = "")
    {
        // Initialize the list to store file paths
        List<string> _filePaths = new List<string>();

        // Check if the directory exists
        if (!Directory.Exists(_directoryPath))
        {
            Console.WriteLine("The specified directory does not exist.");
            return _filePaths; // Return an empty list
        }

        // Traverse the directory and add file paths to the list
        foreach (string _filePath in Directory.EnumerateFiles(
            _directoryPath, "*", SearchOption.AllDirectories))
        {
            // If a file type is specified, filter the files
            if (!string.IsNullOrEmpty(_fileType) &&
                !Path.GetExtension(_filePath).Equals(_fileType, StringComparison.OrdinalIgnoreCase))
            {
                continue;
            }

            _filePaths.Add(_filePath);
        }

        // Return the list of file paths
        return _filePaths;
    }
}