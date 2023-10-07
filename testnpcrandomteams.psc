ScriptName TestNPCRandomTeams Extends ObjectReference Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property SpawnController Auto Const
{ Either fill this with the spawn controller, or use a default linkedRef to the spawn controller }
Bool Property instantSpawn = False Auto Const
{ If true, will randomize and spawn NPCs with a single activation }
Bool Property onlyRedTeam = False Auto Const
Int Property teamSizeMinimum = -1 Auto Const
Int Property teamSizeMaximum = -1 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  ObjectReference SpawnControllerFromLink = Self.GetLinkedRef(None) ; #DEBUG_LINE_NO:16
  If SpawnControllerFromLink ; #DEBUG_LINE_NO:17
    If teamSizeMaximum > -1 && teamSizeMinimum > -1 ; #DEBUG_LINE_NO:18
      (SpawnControllerFromLink as testnpcarenascript).SetRandomTeams(instantSpawn, onlyRedTeam, Self as ObjectReference, teamSizeMinimum, teamSizeMaximum) ; #DEBUG_LINE_NO:19
    Else ; #DEBUG_LINE_NO:
      (SpawnControllerFromLink as testnpcarenascript).SetRandomTeams(instantSpawn, onlyRedTeam, Self as ObjectReference, 3, 6) ; #DEBUG_LINE_NO:21
    EndIf ; #DEBUG_LINE_NO:
  ElseIf SpawnController ; #DEBUG_LINE_NO:
    (SpawnController as testnpcarenascript).SetRandomTeams(instantSpawn, onlyRedTeam, Self as ObjectReference, 3, 6) ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent
