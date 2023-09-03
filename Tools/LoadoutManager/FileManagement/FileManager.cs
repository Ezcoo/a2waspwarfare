class FileManager
{
    public static void CopyFilesFromSourceToDestination(string _source, string _destination)
    {
        // Ensure the destination directory exists
        Directory.CreateDirectory(_destination);

        // Copy files from source to destination
        foreach (var file in Directory.GetFiles(_source))
        {
            string fileName = Path.GetFileName(file);

            if (fileName.EndsWith("mission.sqm", StringComparison.OrdinalIgnoreCase) ||
                (fileName.EndsWith("version.sqf", StringComparison.OrdinalIgnoreCase) &&
                !fileName.EndsWith("Init_Version.sqf", StringComparison.OrdinalIgnoreCase)))
            {
                continue;
            }

            string destFile = Path.Combine(_destination, fileName);
            File.Copy(file, destFile, true);  // true to overwrite existing files
        }

        // Recursively copy subdirectories
        foreach (var directory in Directory.GetDirectories(_source))
        {
            string dirName = Path.GetFileName(directory);
            if (dirName == null) continue;

            string destDir = Path.Combine(_destination, dirName);
            CopyFilesFromSourceToDestination(directory, destDir);
        }

        // Delete extra files in destination that are not in source
        foreach (var destFile in Directory.GetFiles(_destination))
        {
            string fileName = Path.GetFileName(destFile);

            if (fileName.EndsWith("mission.sqm") ||
                (fileName.EndsWith("version.sqf", StringComparison.OrdinalIgnoreCase) &&
                !fileName.EndsWith("Init_Version.sqf", StringComparison.OrdinalIgnoreCase)))
            {
                continue;
            }

            string correspondingSourceFile = Path.Combine(_source, fileName);
            if (!File.Exists(correspondingSourceFile))
            {
                File.Delete(destFile);
            }
        }

        // Delete extra directories in destination that are not in source
        foreach (var destDir in Directory.GetDirectories(_destination))
        {
            string dirName = Path.GetFileName(destDir);
            if (dirName == null) continue;

            string correspondingSourceDir = Path.Combine(_source, dirName);
            if (!Directory.Exists(correspondingSourceDir))
            {
                Directory.Delete(destDir, true);  // true to remove all files and subdirectories
            }
        }
    }
}