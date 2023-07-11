using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.IO;
using System.Runtime.Serialization;
using System.Threading;
using System.Linq;

public static class SerializationManager
{
    static string dbPath = @"C:\a2waspwarfare\Data";
    static string dbFileName = "database.json";
    static string dbPathWithFileName = dbPath + @"\" + dbFileName;

    static string dbTempFileName = "database.tmp";
    static string dbTempPathWithFileName = dbPath + @"\" + dbTempFileName;
    static SemaphoreSlim semaphore = new SemaphoreSlim(1);

    public static async void SerializeDB()
    {
        await semaphore.WaitAsync();
        try
        {
            Log.WriteLine("SERIALIZING DB", LogLevel.SERIALIZATION);

            Newtonsoft.Json.JsonSerializer serializer = new Newtonsoft.Json.JsonSerializer();

            Log.WriteLine("Created serializer");

            serializer.Converters.Add(new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter());
            serializer.NullValueHandling = Newtonsoft.Json.NullValueHandling.Include;
            serializer.TypeNameHandling = Newtonsoft.Json.TypeNameHandling.All;
            serializer.Formatting = Newtonsoft.Json.Formatting.Indented;
            serializer.ObjectCreationHandling = ObjectCreationHandling.Replace;
            serializer.ContractResolver = new DataMemberContractResolver();

            Log.WriteLine("Writing to temp file");

            FileManager.CheckIfFileAndPathExistsAndCreateItIfNecessary(dbPath, dbTempFileName);

            using (StreamWriter sw = new StreamWriter(dbTempPathWithFileName))
            using (JsonWriter writer = new JsonTextWriter(sw))
            {
                serializer.Serialize(writer, GameData.Instance, typeof(GameData));
                writer.Close();
                sw.Close();
            }

            Log.WriteLine("Writing to temp file is complete");

            FileManager.CheckIfFileAndPathExistsAndCreateItIfNecessary(dbPath, dbFileName);

            // Atomic file replacement
            File.Replace(dbTempPathWithFileName, dbPathWithFileName, null);

            Log.WriteLine("DONE SERIALIZING DB", LogLevel.SERIALIZATION);
        }
        catch (Exception _ex)
        {
            Log.WriteLine(_ex.Message, LogLevel.CRITICAL);
            throw new InvalidOperationException(_ex.Message);
        }
        finally
        {
            semaphore.Release();
        }
    }

    public class DataMemberContractResolver : DefaultContractResolver
    {
        protected override IList<JsonProperty> CreateProperties(Type type, MemberSerialization memberSerialization)
        {
            var properties = base.CreateProperties(type, memberSerialization);
            return properties.Where(p => p.AttributeProvider.GetAttributes(typeof(DataMemberAttribute), true).Any()).ToList();
        }
    }

    //public static Task DeSerializeDB()
    //{
    //    Log.WriteLine("DESERIALIZATION STARTING!", LogLevel.SERIALIZATION);

    //    FileManager.CheckIfFileAndPathExistsAndCreateItIfNecessary(dbPath, dbFileName);

    //    string json = File.ReadAllText(dbPathWithFileName);

    //    HandleDatabaseCreationOrLoading(json);

    //    Log.WriteLine("DB DESERIALIZATION DONE!", LogLevel.SERIALIZATION);

    //    // Move to method when necessary
    //    foreach (var item in Database.Instance.Leagues.StoredLeagues)
    //    {
    //        Log.WriteLine("Loop on: " + item.LeagueCategoryName);
    //        item.LeagueData.SetReferences(item);
    //    }

    //    Log.WriteLine("DB DESERIALIZATION DONE with setting references", LogLevel.SERIALIZATION);

    //    return Task.CompletedTask;
    //}

    //// _json param to 0 to force creation of the new db
    //public static Task HandleDatabaseCreationOrLoading(string _json)
    //{
    //    if (_json == "0")
    //    {
    //        //FileManager.CheckIfFileAndPathExistsAndCreateItIfNecessary(dbPath, dbFileName);
    //        Database.Instance = new();
    //        Log.WriteLine("json was " + _json + ", creating a new db instance", LogLevel.DEBUG);

    //        return Task.CompletedTask;
    //    }

    //    JsonSerializerSettings settings = new JsonSerializerSettings();
    //    settings.TypeNameHandling = TypeNameHandling.Auto;
    //    settings.NullValueHandling = NullValueHandling.Include;
    //    settings.ObjectCreationHandling = ObjectCreationHandling.Replace;

    //    var newDeserializedObject = JsonConvert.DeserializeObject<Database>(_json, settings);

    //    if (newDeserializedObject == null)
    //    {
    //        return Task.CompletedTask;
    //    }

    //    Database.Instance = newDeserializedObject;

    //    return Task.CompletedTask;
    //}
}