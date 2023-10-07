ScriptName Fragments:Quests:QF_TestKurtQuest_0000188F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_NPC01 Auto Const mandatory
RefCollectionAlias Property Alias_CreatedItems Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Int I = Alias_CreatedItems.GetCount() ; #DEBUG_LINE_NO:7
  ObjectReference theContainer = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:8
  While I >= 0 ; #DEBUG_LINE_NO:9
    ObjectReference theRef = Alias_CreatedItems.GetAt(I) ; #DEBUG_LINE_NO:10
    theContainer.RemoveItem(theRef as Form, 1, False, None) ; #DEBUG_LINE_NO:12
    I += -1 ; #DEBUG_LINE_NO:13
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
