ScriptName CF05_ActivateCardScript Extends ReferenceAlias
{ Script to prevent player from taking item that Guard is standing right in front of }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BlockingScene Auto Const mandatory
Int Property StageToCheck Auto Const mandatory
Int Property AlarmStage Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Float Property DistanceCheck = 4.0 Auto Const

;-- State -------------------------------------------
State Busy
EndState

;-- State -------------------------------------------
Auto State Waiting

  Event OnActivate(ObjectReference akActionRef)
    Self.GotoState("Busy") ; #DEBUG_LINE_NO:
    Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:
    If !myQuest.GetStageDone(StageToCheck) && !myQuest.GetStageDone(AlarmStage) && Self.GetRef().GetDistance(Alias_Guard.GetRef()) < DistanceCheck && !Game.GetPlayer().IsinFaction(LC043SY01Faction) ; #DEBUG_LINE_NO:
      BlockingScene.Start() ; #DEBUG_LINE_NO:
      Self.GotoState("Waiting") ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      Game.GetPlayer().AddItem(Self.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndEvent

  Event OnAliasInit()
    Self.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:19
  EndEvent
EndState
