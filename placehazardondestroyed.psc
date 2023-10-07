ScriptName PlaceHazardOnDestroyed Extends ObjectReference Const
{ Places the selected hazard when this reference is destroyed. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Hazard Property HazardToPlace Auto Const mandatory
Float Property xOffset = 0.0 Auto Const
Float Property yOffset = 0.0 Auto Const
Float Property zOffset = 0.0 Auto Const
Bool Property SnapOffsetToNavmesh = False Auto Const

;-- Functions ---------------------------------------

Event OnDestroyed(ObjectReference akDestroyer)
  Float[] Offset = new Float[3] ; #DEBUG_LINE_NO:13
  Offset[0] = xOffset ; #DEBUG_LINE_NO:14
  Offset[1] = yOffset ; #DEBUG_LINE_NO:15
  Offset[2] = zOffset ; #DEBUG_LINE_NO:16
  Self.PlaceAtMe(HazardToPlace as Form, 1, False, False, True, Offset, None, SnapOffsetToNavmesh) ; #DEBUG_LINE_NO:17
EndEvent
