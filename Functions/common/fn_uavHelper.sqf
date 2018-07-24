// Draws an icon at current via uav lased position and draws a line between the uav and the icon

private ['_connectedUav', '_intersects', '_laserPos', '_validLaserPos', '_targetIcon', '_targetIconColor'];

// Want to check if the laser targeting anything but the sky, but doesn't work yet
//_intersects = (lineIntersects [getPosASL _connectedUav, getPosASL laserTarget _connectedUav] || terrainIntersectASL [getPosASL _connectedUav, getPosASL laserTarget _connectedUav]);
_connectedUav = getConnectedUAV player;
_laserPos = getPosASL laserTarget _connectedUav;
_validLaserPos = !(_laserPos isEqualTo [0,0,0]);
// Alternative icon for locked camera when I get it to work
//_targetIcon = 'a3\ui_f_curator\data\cfgwrapperui\cursors\curatorplacewaypoint_ca.paa';
_targetIcon = 'a3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa';
_targetIconColor = [1,0,0,0.5];

if (_validLaserPos) then {
	_this select 0 drawIcon [_targetIcon, _targetIconColor, _laserPos, 24, 24, 0, '', 1, 0.03, 'TahomaB', 'center'];
	_this select 0 drawLine [_connectedUav, _laserPos, [1,0,0,0.5]];
};
