private["_playerStats","_playerScore","_playerPrevStats","_playerPrevScoreTotal","_playerPrevTimePlayedTotal","_result","_oldScore","_playerScoreDiff","_playerNewScore","_playerNewScoreTotal"];

scopeName "GameOver";

while {!WFBE_Gameover} do {

	[0.1] call WFBE_DB_CountPlayerScores;

	for "_i" from 0 to 300 step 2 do {
		if (!WFBE_GameOver) then {
			uiSleep 2;
		} else {
			breakTo "gameOver";
		};
	};
};

// Do the final score update when game ends

[0] call WFBE_DB_CountPlayerScores;