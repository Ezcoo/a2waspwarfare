//_easaVehi = _easaVehi + ['Su34'];
//_easaDefault = _easaDefault + [[
//['R73Launcher_2', 'AirBombLauncher'],
//['R73_2Rnd','R73_2Rnd','R73_2Rnd','R73_2Rnd','2Rnd_FAB_250']
//]];
//_easaLoadout = _easaLoadout + [
// [
//  [2200,'R-73 (10)',[['R73Launcher_2','80mmLauncher'],['2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
//  [2900,'FAB-250 (6) | R-73 (8)',[['AirBombLauncher', 'R73Launcher_2'],['4Rnd_FAB_250', '2Rnd_FAB_250', '2Rnd_R73', '2Rnd_R73', '2Rnd_R73', '2Rnd_R73']]],
//  [2900,'FAB-250 (12) | R-73 (6)',[['AirBombLauncher','R73Launcher_2'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73','2Rnd_R73','2Rnd_R73']]],
//  [2900,'FAB-250 (18) | R-73 (4)',[['AirBombLauncher','R73Launcher_2'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250','2Rnd_R73','2Rnd_R73']]],
//  [2900,'FAB-250 (24) | R-73 (2)',[['AirBombLauncher','R73Launcher_2'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_R73']]],
//  [3500,'FAB-250 (30)',[['AirBombLauncher','80mmLauncher'],['4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','4Rnd_FAB_250','2Rnd_FAB_250']]]
// ]
//];

public class Loadout
{
    public Dictionary<AmmunitionType, int> AmmunitionTypesWithCount { get; set; }
}