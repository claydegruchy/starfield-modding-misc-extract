ScriptName Fragments:Quests:QF_AspirationalItems_001991B3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property VendorCyUCExchange Auto Const mandatory
ObjectReference Property CYDenisContainerRef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If !VendorCyUCExchange.GetRef() ; #DEBUG_LINE_NO:8
    VendorCyUCExchange.ForceRefTo(CYDenisContainerRef) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndFunction
