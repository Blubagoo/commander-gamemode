/*
Function: fn_manageMarkers
Description:
    Manages the creation and updating of town markers based on enemy presence.
Parameters:
    _townName - String: Name of the town marker.
    _enemyPresent - Boolean: Presence of enemy forces.
*/

params ["_townName", "_enemyPresent"];

// Check if the marker already exists
if (isNil { _townName call BIS_fnc_markerExists }) then {
    // Create a new marker
    private _marker = createMarker [_townName, _townPos];
    _marker setMarkerShape "ELLIPSE";
    _marker setMarkerSize [500, 500]; // Adjust radius as needed
    _marker setMarkerAlpha 0.5; // Set transparency (0 = fully transparent, 1 = fully opaque)
};

// Update marker color based on enemy presence
if (_enemyPresent) then {
    _townName setMarkerColor "ColorRed";
} else {
    _townName setMarkerColor "ColorGreen";
};
