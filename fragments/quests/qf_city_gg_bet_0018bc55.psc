ScriptName Fragments:Quests:QF_City_GG_Bet_0018BC55 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_AgGoods Auto Const mandatory
ReferenceAlias Property Alias_ShipContainer Auto Const mandatory
ReferenceAlias Property Alias_DebugMarker Auto Const mandatory
ObjectReference Property UC_GG_Bet_DebugMarker01 Auto Const mandatory
MiscObject Property UC_GG_Bet_Liquor Auto Const mandatory
GlobalVariable Property UC_GG_Bet_PlayerNegotiatedBonus Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().MoveTo(Alias_DebugMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  Int I = 0 ; #DEBUG_LINE_NO:16
  Int iCount = Alias_AgGoods.GetCount() ; #DEBUG_LINE_NO:17
  ObjectReference PlayINV = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:18
  While I < iCount ; #DEBUG_LINE_NO:20
    ObjectReference currGood = Alias_AgGoods.GetAt(I) ; #DEBUG_LINE_NO:21
    If currGood != None ; #DEBUG_LINE_NO:23
      PlayINV.AddItem(currGood as Form, 1, False) ; #DEBUG_LINE_NO:24
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:27
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0003_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:36
  Game.GetPlayer().MoveTo(UC_GG_Bet_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:37
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:54
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0300_Item_00()
  UC_GG_Bet_PlayerNegotiatedBonus.SetValue(1.0) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(UC_GG_Bet_Liquor as Form, 1, False, None) ; #DEBUG_LINE_NO:71
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:72
  Self.Stop() ; #DEBUG_LINE_NO:73
EndFunction
