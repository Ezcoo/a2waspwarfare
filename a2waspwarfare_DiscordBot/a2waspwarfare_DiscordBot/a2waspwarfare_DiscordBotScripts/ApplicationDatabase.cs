using System.Runtime.Serialization;

[DataContract]
public class ApplicationDatabase : Database
{
    public ApplicationDatabase()
    {
        dataDirectory = DatabasePaths.mainAppnameDataDirectory;
        dbTempPathWithFileName = dataDirectory + @"\" + "database.tmp";
    }
}
