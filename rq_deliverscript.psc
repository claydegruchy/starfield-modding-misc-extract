ScriptName RQ_DeliverScript Extends RQScript

;-- Variables ---------------------------------------
Bool Created

;-- Guards ------------------------------------------
;*** WARNING: Guard declaration syntax is EXPERIMENTAL, subject to change
Guard modifyItemGuard

;-- Properties --------------------------------------
Group Scan_Deliver
  ReferenceAlias Property ItemSpawnAt Auto Const mandatory
  { the alias that will the item will be spawned at/in }
  Bool Property SpawnIn = True Auto Const
  { if true (Default) ItemToCreate will be spawned IN the inventory of ItemSpawnAt. If false, will be spawned AT it. }
  ReferenceAlias Property Item Auto Const mandatory
  { the alias that will hold the item to deliver (Reference of ItemToCreate will be forced into this.) It will be initially disabled }
  Form Property ItemToCreate Auto Const mandatory
  { the item to deliver, will be created at StageToCreateItem }
  Int Property EnableItemStage = -1 Auto Const
  { When this stage is set, the item will be enabled }
  Int Property SpawnStage = 10 Auto Const
  { stage to set to trigger spawning - use a stage so we have a chance to register for spawn event }
  Int Property TurnOffQuestStage = -1 Auto Const
  { stage to set TurnOffQuestGlobal }
  GlobalVariable Property TurnOffQuestGlobal Auto Const
  { OPTIONAL - if included, this will be set to 1 when the player picks up the item (so it can be used as a condition to not run the quest again) }
EndGroup


;-- Functions ---------------------------------------

Function QuestStartedSpecific()
  defaultgroupspawnquestscript DefaultGroupSpawnQuestScriptIns = (Self as Quest) as defaultgroupspawnquestscript ; #DEBUG_LINE_NO:36
  Self.RegisterForCustomEvent(DefaultGroupSpawnQuestScriptIns as ScriptObject, "defaultgroupspawnquestscript_SpawnGroupDoneEvent") ; #DEBUG_LINE_NO:37
  Self.SetStage(SpawnStage) ; #DEBUG_LINE_NO:41
EndFunction

Event OnStageSet(Int auiStageID, Int auiItemID)
  If auiStageID == EnableItemStage ; #DEBUG_LINE_NO:45
    Self.EnableItemIfAppropriate() ; #DEBUG_LINE_NO:46
  ElseIf auiStageID == TurnOffQuestStage ; #DEBUG_LINE_NO:47
    If TurnOffQuestGlobal ; #DEBUG_LINE_NO:48
      TurnOffQuestGlobal.SetValueInt(1) ; #DEBUG_LINE_NO:49
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event DefaultGroupSpawnQuestScript.SpawnGroupDoneEvent(defaultgroupspawnquestscript akSender, Var[] akArgs)
  Self.CreateItem() ; #DEBUG_LINE_NO:57
EndEvent

Function CreateItem()
  Guard modifyItemGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:64
    ObjectReference spawnAtRef = ItemSpawnAt.GetReference() ; #DEBUG_LINE_NO:65
    If Created == False && spawnAtRef as Bool ; #DEBUG_LINE_NO:67
      Self.UnregisterForRemoteEvent(ItemSpawnAt as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:68
      Created = True ; #DEBUG_LINE_NO:70
      ObjectReference itemRef = ItemSpawnAt.GetReference().PlaceAtMe(ItemToCreate, 1, False, True, True, None, Item as Alias, True) ; #DEBUG_LINE_NO:72
      If SpawnIn ; #DEBUG_LINE_NO:76
        spawnAtRef.AddItem(itemRef as Form, 1, False) ; #DEBUG_LINE_NO:77
      Else ; #DEBUG_LINE_NO:
        Self.EnableItemIfAppropriate() ; #DEBUG_LINE_NO:80
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction

Function EnableItemIfAppropriate()
  If SpawnIn == False && (EnableItemStage == -1 || Self.GetStageDone(EnableItemStage)) ; #DEBUG_LINE_NO:87
    Item.TryToEnable() ; #DEBUG_LINE_NO:89
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CleanUpItem()
  Guard modifyItemGuard ;*** WARNING: Experimental syntax, may be incorrect: Guard  ; #DEBUG_LINE_NO:94
    If Created ; #DEBUG_LINE_NO:95
      If SpawnIn ; #DEBUG_LINE_NO:96
        ObjectReference spawnAtRef = ItemSpawnAt.GetReference() ; #DEBUG_LINE_NO:97
        spawnAtRef.RemoveItem(ItemToCreate, 1, False, None) ; #DEBUG_LINE_NO:98
      Else ; #DEBUG_LINE_NO:
        Item.TryToDisable() ; #DEBUG_LINE_NO:100
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndGuard ;*** WARNING: Experimental syntax, may be incorrect: EndGuard  ; #DEBUG_LINE_NO:
EndFunction
