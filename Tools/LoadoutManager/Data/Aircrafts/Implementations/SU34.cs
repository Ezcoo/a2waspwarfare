public class SU34 : BaseAircraft
{
    public SU34()
    {
        Type = AircraftType.SU34;
        PylonAmount = 10;

        var loadoutDefault = new Loadout
        {
            Weapons = new List<List<string>>
            {
                new List<string> { "Ch29Launcher_Su34", "R73Launcher_2", "80mmLauncher" },
                new List<string> { "6Rnd_Ch29", "2Rnd_R73", "2Rnd_R73", "2Rnd_R73", "2Rnd_R73", "2Rnd_R73" }
            }
        };

        DefaultLoadout = loadoutDefault;
        //EASALoadouts = easaLoadouts;
    }

    public AircraftType Type { get; }
}