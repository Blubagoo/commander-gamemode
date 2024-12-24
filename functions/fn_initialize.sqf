/*
Function: fn_initialize
Description:
    Initializes the Commander game mode by setting up town detection and marker management.
*/

// Define the center of the map and a large radius to encompass the entire map
private _mapCenter = [worldSize / 2, worldSize / 2, 0];
private _radius = worldSize;

// Retrieve all town locations
private _towns = nearestLocations [_mapCenter, ["NameCityCapital", "NameCity", "NameVillage"], _radius];

// Function to periodically check town occupation
private _checkOccupation = {
    while {true} do {
        [_towns] call CommanderMod_fnc_detectTownOccupation;
        sleep 60; // Check every 60 seconds; adjust as needed
    };
};

// Start the occupation check in a separate thread
[] spawn _checkOccupation;
