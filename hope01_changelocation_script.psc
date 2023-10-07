ScriptName Hope01_ChangeLocation_Script Extends Quest Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group FailQuest
  sq_parentscript Property SQ_Parent Auto Const mandatory
  Int Property Hope01_StageRequired = 100 Auto Const
  Int Property Hope01_StageToSet = 8900 Auto Const
EndGroup

Location Property AkilaCityLocation Auto Const mandatory
Keyword Property Contraband Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const

;-- Functions ---------------------------------------

Event OnQuestInit()
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:15
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  Actor aPlayer = Game.GetPlayer() ; #DEBUG_LINE_NO:21
  If akSender == aPlayer && akNewLoc == AkilaCityLocation && Self.GetStageDone(100) ; #DEBUG_LINE_NO:22
    If Game.GetPlayer().GetItemCount(Contraband as Form) > 0 || PlayerShip.GetReference().GetItemCount(Contraband as Form) > 0 ; #DEBUG_LINE_NO:24
      Self.SetStage(300) ; #DEBUG_LINE_NO:26
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == Hope01_StageRequired ; #DEBUG_LINE_NO:32
    Self.RegisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_ContrabandConfiscated") ; #DEBUG_LINE_NO:33
  ElseIf auiStageID == Hope01_StageToSet ; #DEBUG_LINE_NO:34
    Self.UnregisterForCustomEvent(SQ_Parent as ScriptObject, "sq_parentscript_SQ_ContrabandConfiscated") ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SQ_ParentScript.SQ_ContrabandConfiscated(sq_parentscript akSource, Var[] akArgs)
  If Self.GetStageDone(Hope01_StageRequired) && Self.GetStageDone(Hope01_StageToSet) == False ; #DEBUG_LINE_NO:42
    Self.SetStage(Hope01_StageToSet) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent
