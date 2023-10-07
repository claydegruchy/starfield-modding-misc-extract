ScriptName DefaultAliasMakeAliasRefForInventory Extends ReferenceAlias default
{ WARNING: WILL NOT FUNCTION UNTIL: `TTP-25233: Papyrus: ObjectReference.MakeAliasedRefFromInventory needs to be ported from 76`
Will watch for an alias to acquire an item. When recieved, it'll be shoved into the specified alias
NOTE: This will NOT pick up items already in the alias's inventory when triggered. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group RequiredProperties
  Form Property TargetObject Auto Const mandatory
  { The object we're interested in. Must be an inventory object. }
  ReferenceAlias Property AliasToForce Auto Const
  { The alias we want the specified object shoved into. NOTE: This is exclusive with CollectionToAddTo. If this is set, whatever's in CollectionToAddTo will be ignored }
  RefCollectionAlias Property CollectionToAddTo Auto Const
  { The ref collection we want the specifed object shoves into. }
EndGroup

Group OptionalProperties
  Int Property PrereqStage = -1 Auto Const
  { Stage that must be set for this script's functionality to execute }
  Int Property TurnOffStageDone = -1 Auto Const
  { If this stage is specfically done, this script's functionality is ignored }
  Bool Property DoOnce = True Auto Const
  { Only execute this script's functionality once }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = False Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  If PrereqStage == -1 ; #DEBUG_LINE_NO:35
    Self.AddInventoryEventFilter(TargetObject) ; #DEBUG_LINE_NO:37
    If TurnOffStageDone > -1 ; #DEBUG_LINE_NO:39
      Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:40
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Quest.OnStageSet(Quest akSenderRef, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage ; #DEBUG_LINE_NO:50
    Self.AddInventoryEventFilter(TargetObject) ; #DEBUG_LINE_NO:51
  ElseIf TurnOffStageDone > -1 && auiStageID == TurnOffStageDone ; #DEBUG_LINE_NO:52
    Self.RemoveInventoryEventFilter(TargetObject) ; #DEBUG_LINE_NO:53
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == TargetObject ; #DEBUG_LINE_NO:59
    Self.ProcessMakingRef(akBaseItem) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ProcessMakingRef(Form akBaseItem)
  If DoOnce ; #DEBUG_LINE_NO:67
    Self.RemoveInventoryEventFilter(TargetObject) ; #DEBUG_LINE_NO:69
  EndIf ; #DEBUG_LINE_NO:
  If AliasToForce ; #DEBUG_LINE_NO:72
    Self.GetRef().MakeAliasedRefFromInventory(akBaseItem, AliasToForce as Alias) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  If CollectionToAddTo as Bool && AliasToForce == None ; #DEBUG_LINE_NO:77
    ObjectReference CreatedRef = Self.GetRef().MakeAliasedRefFromInventory(akBaseItem, CollectionToAddTo as Alias) ; #DEBUG_LINE_NO:78
  EndIf ; #DEBUG_LINE_NO:
EndFunction
