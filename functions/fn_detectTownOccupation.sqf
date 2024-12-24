/*
Function: fn_detectTownOccupation
Description:
    Detects enemy presence in predefined town areas and updates markers accordingly.
Parameters:
    _towns - Array of town locations.
*/

params ["_towns"];

// Iterate through each town
{
    private _town = _x;
    private _townPos = locationPosition _town;
    private _townName = format ["Town_%1", locationName _town];

    // Define the detection radius (adjust as needed)
    private _detectionRadius = 500;

    // Find enemy units within the radius
    private _enemies = nearestObjects [_townPos, ["Man"], _detectionRadius];
    private _enemyPresent = false;

    {
        if (side _x == east) then { // Assuming 'east' represents enemy side
            _enemyPresent = true;
        };
    } forEach _enemies;

    // Update marker based on enemy presence
    [_townName, _enemyPresent] call fn_manageMarkers;

} forEach _towns;
