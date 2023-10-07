ScriptName UC08_TTMorphAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property PrereqStage = 450 Auto Const
{ Only start the teleportin' once this stage is set on UC08 }
ObjectReference Property TeleportMarker Auto Const mandatory
{ Marker to teleport this critter to }
ReferenceAlias Property NonHostileTT Auto Const mandatory
{ Alias used to keep the Transformed Morph friendly to the player }

;-- Functions ---------------------------------------

Event OnLoad()
  If Self.GetOwningQuest().GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:13
    Self.ProcessTTMorph() ; #DEBUG_LINE_NO:14
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnUnload()
  If Self.GetOwningQuest().GetStageDone(PrereqStage) ; #DEBUG_LINE_NO:19
    Self.ProcessTTMorph() ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ProcessTTMorph()
  Actor currACT = Self.GetActorRef() ; #DEBUG_LINE_NO:25
  NonHostileTT.Clear() ; #DEBUG_LINE_NO:26
  If currACT.IsGhost() ; #DEBUG_LINE_NO:28
    currACT.SetGhost(False) ; #DEBUG_LINE_NO:29
  EndIf ; #DEBUG_LINE_NO:
  If !currACT.IsDead() ; #DEBUG_LINE_NO:32
    currACT.MoveTo(TeleportMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndFunction
