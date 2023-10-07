ScriptName DefaultAliasOnDistanceLessThan Extends ReferenceAlias default
{ Sets a stage when the distance between this an a target alias is less than a target distance. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Required_Data
  ReferenceAlias Property TargetAlias Auto Const mandatory
  { The alias we're interested in }
  Float Property TargetDistance Auto Const mandatory
  { The needed distance between this and the target }
  Int Property StageToSet = -1 Auto Const mandatory
  { Stage to Set }
EndGroup

Group Optional_Data
  Int Property PrereqStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:29
  If PrereqStage > -1 && myQuest.GetStageDone(PrereqStage) == False ; #DEBUG_LINE_NO:30
    Self.RegisterForRemoteEvent(myQuest as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:31
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, TargetDistance, 0) ; #DEBUG_LINE_NO:34
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage ; #DEBUG_LINE_NO:42
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, TargetDistance, 0) ; #DEBUG_LINE_NO:43
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If StageToSet > -1 ; #DEBUG_LINE_NO:50
    Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndEvent
