ScriptName RI07_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
MiscObject Property RI07_Prototype Auto Const mandatory
ReferenceAlias Property Prototype Auto Const mandatory
RefCollectionAlias Property RDEngineers Auto Const mandatory
Faction Property LC051InfinityLTDPEnemyFaction Auto Const mandatory

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(RI07_Prototype as Form) ; #DEBUG_LINE_NO:9
EndEvent

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == RI07_Prototype as Form ; #DEBUG_LINE_NO:16
    Self.RemoveInventoryEventFilter(RI07_Prototype as Form) ; #DEBUG_LINE_NO:17
    Game.GetPlayer().AddAliasedItem(RI07_Prototype as Form, Prototype as Alias, 1, True) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
  Int iCurrentCount = 0 ; #DEBUG_LINE_NO:22
  Int iTotalCount = RDEngineers.GetCount() ; #DEBUG_LINE_NO:23
  While iCurrentCount < iTotalCount ; #DEBUG_LINE_NO:25
    Actor EngineerRef = RDEngineers.GetAt(iCurrentCount) as Actor ; #DEBUG_LINE_NO:27
    Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:28
    If EngineerRef.HasDetectionLOS(PlayerRef as ObjectReference) ; #DEBUG_LINE_NO:30
      PlayerRef.AddToFaction(LC051InfinityLTDPEnemyFaction) ; #DEBUG_LINE_NO:32
    Else ; #DEBUG_LINE_NO:
      iCurrentCount += 1 ; #DEBUG_LINE_NO:35
    EndIf ; #DEBUG_LINE_NO:
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
