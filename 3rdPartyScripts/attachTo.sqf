_object = _this select 0;
_Target = _this select 1;
sleep 0.1;
_object attachTo [_target, (_object worldToModel getPosASLW _target)];
