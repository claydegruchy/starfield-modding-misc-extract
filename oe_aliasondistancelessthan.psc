ScriptName OE_AliasOnDistanceLessThan Extends ReferenceAlias default
{ Sets a stage when the distance between this an a target alias is less than a target distance. }

;-- Variables ---------------------------------------
Actor Player

;-- Properties --------------------------------------
Group Required_Data
  ReferenceAlias Property TargetAlias Auto Const mandatory
  { The Alias to check versus the Owning Alias }
  Bool Property CheckPlayer Auto Const mandatory
  { This checks the Player to see if they are }
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
  Player = Game.GetPlayer() ; #DEBUG_LINE_NO:32
  Quest myQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:35
  If PrereqStage > -1 && myQuest.GetStageDone(PrereqStage) == False ; #DEBUG_LINE_NO:36
    Self.RegisterForRemoteEvent(myQuest as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:37
  Else ; #DEBUG_LINE_NO:
    If CheckPlayer ; #DEBUG_LINE_NO:40
      Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, TargetDistance, 0) ; #DEBUG_LINE_NO:41
    EndIf ; #DEBUG_LINE_NO:
    If TargetAlias ; #DEBUG_LINE_NO:44
      Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, TargetDistance, 0) ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage ; #DEBUG_LINE_NO:54
    Self.RegisterForDistanceLessThanEvent(Self as ScriptObject, TargetAlias as ScriptObject, TargetDistance, 0) ; #DEBUG_LINE_NO:55
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:56
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, Float afDistance, Int aiEventID)
  If StageToSet > -1 ; #DEBUG_LINE_NO:62
    Self.GetOwningQuest().SetStage(StageToSet) ; #DEBUG_LINE_NO:63
  EndIf ; #DEBUG_LINE_NO:
EndEvent
