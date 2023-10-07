ScriptName Fragments:Quests:QF_LC139_00281FFC Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_LC139MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Alias_LC139MapMarker.GetRef().AddToMapScanned(False) ; #DEBUG_LINE_NO:7
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:8
EndFunction
