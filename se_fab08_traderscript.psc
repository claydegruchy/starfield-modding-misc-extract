ScriptName SE_FAB08_TraderScript Extends ReferenceAlias
{ Handles setting globals that prevent the respawn of Legendary Weapons from the Starborn Trader Ship Vendor. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group required
  FormList Property SE_FAB08_LegendaryWeaponTypes Auto Const mandatory
  { Formlist of weapon types to filter by. }
  Keyword[] Property LegendaryWeaponKeywords Auto Const mandatory
  { An array of keywords attached to Legendary weapons that we wish to handle. }
  GlobalVariable[] Property LegendaryWeaponGlobals Auto Const mandatory
  { An array of globals that prevent the corresponding weapon from spawning again. }
EndGroup


;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.AddInventoryEventFilter(SE_FAB08_LegendaryWeaponTypes as Form) ; #DEBUG_LINE_NO:17
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer, Int aiTransferReason)
  Int I = 0 ; #DEBUG_LINE_NO:23
  Bool keywordFound = False ; #DEBUG_LINE_NO:24
  While I < LegendaryWeaponKeywords.Length && !keywordFound ; #DEBUG_LINE_NO:25
    Keyword myKeyword = LegendaryWeaponKeywords[I] ; #DEBUG_LINE_NO:26
    GlobalVariable myGlobal = LegendaryWeaponGlobals[I] ; #DEBUG_LINE_NO:27
    If akItemReference.HasKeyword(myKeyword) ; #DEBUG_LINE_NO:29
      myGlobal.SetValueInt(100) ; #DEBUG_LINE_NO:31
      keywordFound = True ; #DEBUG_LINE_NO:32
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:35
  EndWhile ; #DEBUG_LINE_NO:
EndEvent
