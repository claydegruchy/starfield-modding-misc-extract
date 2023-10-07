ScriptName DialogueFCNeonAdvertScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard sceneGuard

;-- Properties --------------------------------------
Scene[] Property AdvertScenes Auto Const
{ array of scenes we want to stop/start when the player is in Neon }
Location Property CityNeonLocation Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
  If akOldLoc == CityNeonLocation ; #DEBUG_LINE_NO:12
    Self.UpdateScenes(False) ; #DEBUG_LINE_NO:14
  ElseIf akNewLoc == CityNeonLocation ; #DEBUG_LINE_NO:15
    Self.UpdateScenes(True) ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateScenes(Bool bStart)
  Guard sceneGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:23
    Int I = 0 ; #DEBUG_LINE_NO:24
    While I < AdvertScenes.Length ; #DEBUG_LINE_NO:25
      Scene theScene = AdvertScenes[I] ; #DEBUG_LINE_NO:26
      If theScene ; #DEBUG_LINE_NO:27
        If bStart ; #DEBUG_LINE_NO:28
          theScene.Start() ; #DEBUG_LINE_NO:29
        Else ; #DEBUG_LINE_NO:
          theScene.Stop() ; #DEBUG_LINE_NO:31
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:34
    EndWhile ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
