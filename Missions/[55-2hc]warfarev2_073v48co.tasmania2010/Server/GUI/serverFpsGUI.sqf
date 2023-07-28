while {true} do
{
    // Check that it's being run on the server
    if (isDedicated) then
    {
        // Get the fps variable from the server, insert to get from the missionNamespace as public variable
        SERVER_FPS_GUI = round(diag_fps);
        publicVariable "SERVER_FPS_GUI";

        sleep 1; // Update frequency
    }
}