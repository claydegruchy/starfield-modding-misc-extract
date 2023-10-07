ScriptName DefaultCollectionAliasOnActivateGive Extends DefaultCollectionAliasOnActivate default
{ Adds item(s) to <RefToCheck> when THIS RefCollection's members are activated.
<QuestToSetOrCheck> is THIS Alias's GetOwningQuest()
<RefToCheck> is the reference activating each ref in THIS refcollection.
<LocationToCheck> is the current location of each ref in THIS collection. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Quest_Properties collapsedonbase collapsedonref
{ Double-Click to EXPAND }
  Bool Property xxxPlaceHolderForEmptyGroup2xxx Auto Const hidden
  { `TTP-27034: Papyrus: Need a way to manage groups across parents and children` }
EndGroup

Group Script_Specific_Properties
  Form Property ItemToGive Auto Const mandatory
  { Give this item to RefToCheck }
  Int Property AmountToGive = 1 Auto Const
  { The amount to give }
  Bool Property GiveSilently = False Auto Const
  { (Default false) If true, give the item silently. If true, show message when giving item. }
  ReferenceAlias Property ReferenceAliasToAddTo Auto Const
  { The item (or first item) will be put into this ref alias when it is given. }
  RefCollectionAlias Property ReferenceCollectionAliasToAddTo Auto Const
  { The item(s) will be put into this ref collection when they are given. }
EndGroup


;-- Functions ---------------------------------------

Function DoSpecificThing(defaultscriptfunctions:parentscriptfunctionparams ParentScriptFunctionParams, ObjectReference RefToDoThingWith, Bool LastRefToDoThingWith)
  ParentScriptFunctionParams.refToCheck.AddItem(ItemToGive, AmountToGive, GiveSilently) ; #DEBUG_LINE_NO:33
  Int I = 0 ; #DEBUG_LINE_NO:35
  While I < AmountToGive ; #DEBUG_LINE_NO:36
    ObjectReference refToCheck = ParentScriptFunctionParams.refToCheck ; #DEBUG_LINE_NO:37
    If ReferenceAliasToAddTo as Bool && I == 0 ; #DEBUG_LINE_NO:39
      refToCheck.AddAliasedItem(ItemToGive, ReferenceAliasToAddTo as Alias, 1, GiveSilently) ; #DEBUG_LINE_NO:40
    EndIf ; #DEBUG_LINE_NO:
    If ReferenceCollectionAliasToAddTo ; #DEBUG_LINE_NO:42
      refToCheck.AddAliasedItem(ItemToGive, ReferenceCollectionAliasToAddTo as Alias, 1, GiveSilently) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:46
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
