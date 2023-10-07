ScriptName UC03_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group StagesAndIndices
  Int Property BloodstoneHuntStage = 810 Auto Const
  { Once this stage is set, start tracking the player's collection of Bloodstone }
  Int Property CompletionStage = 820 Auto Const
  { Stage to set once the player's got enough Bloodstone }
EndGroup

Group Objects
  MiscObject Property InorgUniqueBloodstone Auto Const mandatory
  { Bloodstone misc object }
EndGroup

Group Aliases
  ReferenceAlias Property HematiteQuestItem Auto Const mandatory
  { Holding alias for the Hematite misc object the player acquires }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:23
EndEvent

Function RegisterPlayerForBloodstoneCollection()
  Self.AddInventoryEventFilter(InorgUniqueBloodstone as Form) ; #DEBUG_LINE_NO:27
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer, Int aiTransferReason)
  If akBaseItem == InorgUniqueBloodstone as Form ; #DEBUG_LINE_NO:33
    Quest myInst = Self.GetOwningQuest() ; #DEBUG_LINE_NO:34
    Game.GetPlayer().RemoveItem(InorgUniqueBloodstone as Form, 1, True, None) ; #DEBUG_LINE_NO:36
    Game.GetPlayer().AddAliasedItem(InorgUniqueBloodstone as Form, HematiteQuestItem as Alias, 1, True) ; #DEBUG_LINE_NO:37
    Self.RemoveInventoryEventFilter(InorgUniqueBloodstone as Form) ; #DEBUG_LINE_NO:38
    If myInst.GetStageDone(BloodstoneHuntStage) ; #DEBUG_LINE_NO:39
      myInst.SetStage(CompletionStage) ; #DEBUG_LINE_NO:40
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:49
EndFunction
