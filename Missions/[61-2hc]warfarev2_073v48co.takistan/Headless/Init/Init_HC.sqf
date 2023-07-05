//--- Headless Client initialization...

//--- Client Functions.
WFBE_CL_FNC_DelegateTownAI = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateTownAI.sqf";
WFBE_CL_FNC_DelegateAI = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateAI.sqf";
WFBE_CL_FNC_DelegateAIStaticDefence = Compile preprocessFileLineNumbers "Client\Functions\Client_DelegateAIStaticDefence.sqf";
WFBE_CL_FNC_HandlePVF = Compile preprocessFileLineNumbers "Client\Functions\Client_HandlePVF.sqf";

["INITIALIZATION", "Init_HC.sqf: Running the headless client initialization."] Call WFBE_CO_FNC_LogContent;

//--- We wait for the server full init (just in case!).
sleep 20;

//--- Notify the server that our headless client is here.
["RequestSpecial", ["connected-hc", player]] Call WFBE_CO_FNC_SendToServer;