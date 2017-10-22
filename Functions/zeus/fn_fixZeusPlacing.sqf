_pos = AGLtoASL screenToWorld getMousePosition;	//ASL pos of cursor into the world, getting mouse 2D coords
_intersections = lineIntersectsSurfaces [getPosASL curatorCamera, _pos];

if((group PREVIOUS_PLACED) == (group (_this select 1))) then {
    _pos = getPosASL PREVIOUS_PLACED;
    (_this select 1) setPosASL [(_pos select 0) + random [-1.5, 0, 1.5], (_pos select 1) + random [-1.5, 0, 1.5], (_pos select 2)];
} else {
    if((count _intersections) != 0) then {	//Prevent out of bounds exception
        _placePos = ((_intersections select 0) select 0);
        (_this select 1) setPosASL [_placePos select 0, _placePos select 1, (_placePos select 2) + 0.2];
    } else {
        (_this select 1) setPosASL [_pos select 0, _pos select 1, (_pos select 2) + 0.2];	//Add some elevation, the placed thing might be placed inside a surface.
    };
};

PREVIOUS_PLACED = (_this select 1);	//Set new "previous placed"
