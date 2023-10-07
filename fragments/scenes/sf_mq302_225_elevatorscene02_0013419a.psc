ScriptName Fragments:Scenes:SF_MQ302_225_ElevatorScene02_0013419A Extends Scene Const hidden

;-- Functions ---------------------------------------

Function Fragment_Begin()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:7
  kmyQuest.SetPlayerControlsEnabled(False) ; #DEBUG_LINE_NO:11
EndFunction

Function Fragment_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:19
  kmyQuest.SetPlayerControlsEnabled(True) ; #DEBUG_LINE_NO:23
EndFunction

Function Fragment_Phase_01_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:33
  Actor allyRef = kmyQuest.Ally.GetActorRef() ; #DEBUG_LINE_NO:36
  If allyRef != None ; #DEBUG_LINE_NO:37
    allyRef.MoveToPackageLocation() ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  Actor companionRef = kmyQuest.Companion.GetActorRef() ; #DEBUG_LINE_NO:41
  If companionRef != None ; #DEBUG_LINE_NO:42
    companionRef.MoveToPackageLocation() ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Phase_03_End()
  lc165questscript kmyQuest = Self.GetOwningQuest() as lc165questscript ; #DEBUG_LINE_NO:52
  kmyQuest.PlayElevator02NoWait() ; #DEBUG_LINE_NO:56
  kmyQuest.SetStage(992) ; #DEBUG_LINE_NO:59
EndFunction
