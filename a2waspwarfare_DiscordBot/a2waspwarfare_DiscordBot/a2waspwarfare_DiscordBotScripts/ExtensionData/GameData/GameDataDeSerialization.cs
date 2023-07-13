using Discord.WebSocket;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System.Runtime.Serialization;

public static class GameDataDeSerialization
{
    public static Task DeSerializeGameDataFromExtension()
    {
        Log.WriteLine(nameof(GameData) + " DESERIALIZATION STARTING!", LogLevel.SERIALIZATION);

        FileManager.CheckIfFileAndPathExistsAndCreateItIfNecessary(GameData.dbPath, GameData.dbFileName);

        string json = File.ReadAllText(GameData.dbPathWithFileName);

        HandleGameDataCreationOrLoading(json);

        Log.WriteLine(nameof(GameData) + " DESERIALIZATION DONE!", LogLevel.SERIALIZATION);

        return Task.CompletedTask;
    }

    // _json param to 0 to force creation of the new db
    public static Task HandleGameDataCreationOrLoading(string _json)
    {
        if (_json == "0")
        {
            //FileManager.CheckIfFileAndPathExistsAndCreateItIfNecessary(dbPath, dbFileName);
            GameData.Instance = new();
            Log.WriteLine("json was " + _json + ", creating a new db instance", LogLevel.DEBUG);

            return Task.CompletedTask;
        }

        JsonSerializerSettings settings = new JsonSerializerSettings();
        settings.TypeNameHandling = TypeNameHandling.Auto;
        settings.NullValueHandling = NullValueHandling.Include;
        settings.ObjectCreationHandling = ObjectCreationHandling.Replace;

        var newDeserializedObject = JsonConvert.DeserializeObject<GameData>(_json, settings);

        if (newDeserializedObject == null)
        {
            return Task.CompletedTask;
        }

        GameData.Instance = newDeserializedObject;

        return Task.CompletedTask;
    }

    public class DataMemberContractResolver : DefaultContractResolver
    {
        protected override IList<JsonProperty> CreateProperties(Type type, MemberSerialization memberSerialization)
        {
            var properties = base.CreateProperties(type, memberSerialization);
            return properties.Where(p => p.AttributeProvider.GetAttributes(typeof(DataMemberAttribute), true).Any()).ToList();
        }
    }
}