[] spawn {
     "Running qipTPL_fnc_reassignCurator" remoteExec ["diag_log", 2];
    waitUntil {findDisplay 46};
    if (hasInterface and isVirtualCurator and isNull getAssignedCuratorLogic player) then {
        "Fixing broken Curator" remoteExec ["diag_log", 2];
        (allCurators select 0) remoteExec ["unassignCurator", 2];
        waitUntil {isNull getAssignedCuratorUnit (allCurators select 0)};
        [player, (allCurators select 0)] remoteExec ["assignCurator", 2];
        waitUntil {!isNull getAssignedCuratorLogic player; sleep 1;};
        openCuratorInterface;
    };
};
