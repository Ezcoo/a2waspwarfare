while {true} do {
    if(isDedicated) then {
        // Send the current Server FPS to every client, stored in the variable "WFBE_VAR_SERVER_FPS".
        WFBE_VAR_SERVER_FPS = str (diag_fps);
        publicVariable "WFBE_VAR_SERVER_FPS";
        sleep 8;
    };
};