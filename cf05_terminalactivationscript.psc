ScriptName CF05_TerminalActivationScript Extends ReferenceAlias
{ Script to prevent player from taking item that Guard is standing right in front of }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property BlockingScene Auto Const mandatory
Int Property AlarmStage Auto Const mandatory
ReferenceAlias Property Alias_Guard Auto Const mandatory
Float Property DistanceCheck = 8.0 Auto Const
Faction Property LC043SY01Faction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:16
EndEvent

Event OnActivate(ObjectReference akActionRef)
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:21
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:22
  If akActionRef == PlayerRef as ObjectReference ; #DEBUG_LINE_NO:23
    If !PlayerRef.IsInFaction(LC043SY01Faction) && !myQuest.GetStageDone(AlarmStage) && Self.GetRef().GetDistance(Alias_Guard.GetRef()) < DistanceCheck ; #DEBUG_LINE_NO:24
      BlockingScene.Start() ; #DEBUG_LINE_NO:25
    Else ; #DEBUG_LINE_NO:
      Self.GetRef().Activate(PlayerRef as ObjectReference, True) ; #DEBUG_LINE_NO:27
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
