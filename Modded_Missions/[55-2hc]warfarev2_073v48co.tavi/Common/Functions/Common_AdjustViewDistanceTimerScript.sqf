Private ["_timerInstance","_timerDuration","_startTime","_elapsedTime","_remainingTime","_changeTheViewDistance"];

timerInstanceCount = timerInstanceCount + 1;
_timerInstance = timerInstanceCount;

// Set the duration of the timer in seconds (e.g., 1.5 seconds)
// Adjust this value to set the desired duration for your timer
_timerDuration = 1.5;

_elapsedTime = 0;
_changeTheViewDistance = true;

// Get the current time as the starting point of the timer
_startTime = time;

// Main loop for the timer
while {_elapsedTime < _timerDuration} do {
    // New timer was issued by the player
    if (timerInstanceCount != _timerInstance) exitWith{_changeTheViewDistance = false};

    // Calculate the elapsed time
    _elapsedTime = time - _startTime;

    // Show the remaining time as a hint
    _remainingTime = _timerDuration - _elapsedTime;
    //hint format ["Timer: %1 seconds remaining", _remainingTime];

    // Adjust the sleep time for better accuracy (optional)
    // For example, using 10 milliseconds sleep gives better accuracy
    sleep 0.01;
};

if (_changeTheViewDistance) then {
    setViewDistance newViewDistance;

    (format ["Set the view distance to: %1", str(newViewDistance)]) call GroupChatMessage;

    newViewDistance = 0;
};

