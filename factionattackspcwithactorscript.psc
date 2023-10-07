ScriptName FactionAttacksPCWithActorScript Extends Actor conditional
{ If the Actor enters a given location then the specified faction goes temporarily hostile to the player }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Location Property pLocation Auto
Faction Property pFactionToGoHostile Auto conditional
Message Property pMessage Auto conditional

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akNewLoc == pLocation ; #DEBUG_LINE_NO:6
    pMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:7
    pFactionToGoHostile.SetPlayerEnemy(True) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
EndEvent
