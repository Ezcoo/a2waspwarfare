using System.Runtime.Serialization;

[DataContract]
public class GameData
{
    public static GameData Instance
    {
        get
        {
            lock (padlock)
            {
                if (instance == null)
                {
                    instance = new GameData();
                }
                return instance;
            }
        }
        set
        {
            instance = value;
        }
    }

    // Singleton stuff
    private static GameData instance;
    private static readonly object padlock = new object();

    [DataMember] public string[] exportedArgs = new string[2];
}