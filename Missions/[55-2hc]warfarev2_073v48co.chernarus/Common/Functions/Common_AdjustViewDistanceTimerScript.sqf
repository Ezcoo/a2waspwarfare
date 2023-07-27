Private ["_timerDuration","_startTime","_remainingTime"];

// Set the duration of the timer in seconds (e.g., 1.5 seconds)
// Adjust this value to set the desired duration for your timer
_timerDuration = 1.5;

// Get the current time as the starting point of the timer
_startTime = time;

// Main loop for the timer
while {elapsedTimeGlobal < _timerDuration} do {
    // Calculate the elapsed time
    elapsedTimeGlobal = time - _startTime;

    // Show the remaining time as a hint
    _remainingTime = _timerDuration - elapsedTimeGlobal;
    hint format ["Timer: %1 seconds remaining", _remainingTime];

    // Adjust the sleep time for better accuracy (optional)
    // For example, using 10 milliseconds sleep gives better accuracy
    sleep 0.01;
};

setViewDistance newViewDistance;

(format ["Set the view distance to: %1", str(newViewDistance)]) call GroupChatMessage;

newViewDistance = 0;
elapsedTimeGlobal = 0;