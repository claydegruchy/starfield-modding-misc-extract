ScriptName FFLodge04QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ObjectReference Property PlaqueRef_Sam_Bar Auto Const
ObjectReference Property PlaqueRef_Andreja_Bar Auto Const
ObjectReference Property PlaqueRef_Barrett_Bar Auto Const
ObjectReference Property PlaqueRef_Sam_Garden Auto Const
ObjectReference Property PlaqueRef_Andreja_Garden Auto Const
ObjectReference Property PlaqueRef_Barrett_Garden Auto Const
ObjectReference Property PlaqueRef_Sam_Center Auto Const
ObjectReference Property PlaqueRef_Andreja_Center Auto Const
ObjectReference Property PlaqueRef_Barrett_Center Auto Const
ReferenceAlias Property DeadCompanion Auto Const
ReferenceAlias Property Andreja Auto Const
ReferenceAlias Property Barrett Auto Const
ReferenceAlias Property Sam Auto Const

;-- Functions ---------------------------------------

Function EnablePlaque()
  If DeadCompanion.GetActorReference() == Andreja.GetActorReference() ; #DEBUG_LINE_NO:28
    If Self.GetStageDone(10) ; #DEBUG_LINE_NO:31
      PlaqueRef_Andreja_Center.Enable(False) ; #DEBUG_LINE_NO:32
    ElseIf Self.GetStageDone(20) ; #DEBUG_LINE_NO:34
      PlaqueRef_Andreja_Garden.Enable(False) ; #DEBUG_LINE_NO:35
    ElseIf Self.GetStageDone(30) ; #DEBUG_LINE_NO:37
      PlaqueRef_Andreja_Bar.Enable(False) ; #DEBUG_LINE_NO:38
    Else ; #DEBUG_LINE_NO:
      PlaqueRef_Andreja_Center.Enable(False) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
  ElseIf DeadCompanion.GetActorReference() == Barrett.GetActorReference() ; #DEBUG_LINE_NO:44
    If Self.GetStageDone(10) ; #DEBUG_LINE_NO:45
      PlaqueRef_Barrett_Center.Enable(False) ; #DEBUG_LINE_NO:46
    ElseIf Self.GetStageDone(20) ; #DEBUG_LINE_NO:47
      PlaqueRef_Barrett_Garden.Enable(False) ; #DEBUG_LINE_NO:48
    ElseIf Self.GetStageDone(30) ; #DEBUG_LINE_NO:49
      PlaqueRef_Barrett_Bar.Enable(False) ; #DEBUG_LINE_NO:50
    Else ; #DEBUG_LINE_NO:
      PlaqueRef_Barrett_Garden.Enable(False) ; #DEBUG_LINE_NO:52
    EndIf ; #DEBUG_LINE_NO:
  ElseIf DeadCompanion.GetActorReference() == Sam.GetActorReference() ; #DEBUG_LINE_NO:54
    If Self.GetStageDone(10) ; #DEBUG_LINE_NO:55
      PlaqueRef_Sam_Center.Enable(False) ; #DEBUG_LINE_NO:56
    ElseIf Self.GetStageDone(20) ; #DEBUG_LINE_NO:57
      PlaqueRef_Sam_Garden.Enable(False) ; #DEBUG_LINE_NO:58
    ElseIf Self.GetStageDone(30) ; #DEBUG_LINE_NO:59
      PlaqueRef_Sam_Bar.Enable(False) ; #DEBUG_LINE_NO:60
    Else ; #DEBUG_LINE_NO:
      PlaqueRef_Sam_Bar.Enable(False) ; #DEBUG_LINE_NO:62
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(200) ; #DEBUG_LINE_NO:65
EndFunction
