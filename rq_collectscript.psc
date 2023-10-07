ScriptName RQ_CollectScript Extends RQScript

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group CollectProperties
  RefCollectionAlias Property Creatures Auto Const
  RefCollectionAlias Property CollectedMeat Auto Const
  MiscObject Property RQS_CollectColonist_Meat Auto Const mandatory
  { misc item player takes from creatures }
  MiscObject Property RQS_CollectColonist_Meat_Player Auto Const mandatory
  { misc item that gets placed into player inventory - use different base object so we don't trigger OnItemAdded again }
  GlobalVariable Property RQS_CollectColonist_MaxMeat Auto Const mandatory
  Int Property MeatCollectedStage = 300 Auto Const
  { Stage to set when all meat has been collected. }
  Int Property ShutdownStage = 999 Auto Const
  { Stage to set when all minerals have been collected. }
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  Int MaxCreatures = Creatures.GetCount() ; #DEBUG_LINE_NO:24
  If MaxCreatures > 0 ; #DEBUG_LINE_NO:28
    RQS_CollectColonist_MaxMeat.SetValueInt(MaxCreatures) ; #DEBUG_LINE_NO:29
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(ShutdownStage) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartTrackingCollection()
  Self.AddInventoryEventFilter(RQS_CollectColonist_Meat as Form) ; #DEBUG_LINE_NO:36
  Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:38
EndFunction

Event ObjectReference.OnItemAdded(ObjectReference akSource, Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  akSource.RemoveItem(akBaseItem, 1, True, None) ; #DEBUG_LINE_NO:45
  akSource.AddAliasedItemSingle(RQS_CollectColonist_Meat_Player as Form, CollectedMeat as Alias, True) ; #DEBUG_LINE_NO:46
  If CollectedMeat.GetCount() >= RQS_CollectColonist_MaxMeat.GetValueInt() ; #DEBUG_LINE_NO:49
    Self.SetStage(MeatCollectedStage) ; #DEBUG_LINE_NO:50
    Self.UnregisterForRemoteEvent(akSource as ScriptObject, "OnItemAdded") ; #DEBUG_LINE_NO:51
  EndIf ; #DEBUG_LINE_NO:
EndEvent
