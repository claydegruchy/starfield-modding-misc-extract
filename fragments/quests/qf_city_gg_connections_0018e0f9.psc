ScriptName Fragments:Quests:QF_City_GG_Connections_0018E0F9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CourierSlate Auto Const mandatory
ReferenceAlias Property Alias_CourierCorpse Auto Const mandatory
ObjectReference Property UC_GG_Connect_DebugMarker01 Auto Const mandatory
ObjectReference Property UC_GG_Connect_DebugMarker02 Auto Const mandatory
ReferenceAlias Property Alias_Bonifac Auto Const mandatory
Message Property UC_GG_Connect_Debug_RoomFullOfBlood Auto Const mandatory
Quest Property City_GG_Mark Auto Const mandatory
Scene Property City_GG_Connections_Helena_110_IntercomScene Auto Const mandatory
ReferenceAlias Property Alias_Package Auto Const mandatory
Scene Property City_GG_Connections_Companion_250_RxnToCorpse Auto Const mandatory
Quest Property UC_GG_Connect_Misc Auto Const mandatory
RefCollectionAlias Property Alias_ScanPoints Auto Const mandatory
GlobalVariable Property UC_GG_Connect_HelenaKnowsCourierIsDead Auto Const mandatory
ReferenceAlias Property Alias_MurderEnableMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  Game.GetPlayer().Moveto(UC_GG_Connect_DebugMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0002_Item_00()
  Self.SetStage(200) ; #DEBUG_LINE_NO:15
  Game.GetPlayer().Moveto(UC_GG_Connect_DebugMarker02, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:16
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0100_Item_00()
  If UC_GG_Connect_Misc.IsRunning() ; #DEBUG_LINE_NO:25
    UC_GG_Connect_Misc.SetStage(1000) ; #DEBUG_LINE_NO:26
  EndIf ; #DEBUG_LINE_NO:
  Alias_CourierCorpse.GetRef().Enable(False) ; #DEBUG_LINE_NO:28
  Alias_MurderEnableMarker.GetRef().Enable(False) ; #DEBUG_LINE_NO:29
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0110_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:38
  Self.SetObjectiveDisplayed(110, True, False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0120_Item_00()
  Self.SetObjectiveCompleted(110, True) ; #DEBUG_LINE_NO:47
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Stage_0200_Item_00()
  Self.SetObjectiveCompleted(120, True) ; #DEBUG_LINE_NO:56
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:57
  (Alias_ScanPoints as uc_gg_connect_scannerrefcolscript).BlockScannerState(False) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_Bonifac.GetRef().Disable(False) ; #DEBUG_LINE_NO:68
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:70
  Self.SetObjectiveDisplayed(250, True, False) ; #DEBUG_LINE_NO:71
  City_GG_Connections_Companion_250_RxnToCorpse.Start() ; #DEBUG_LINE_NO:73
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:81
  Self.SetObjectiveCompleted(250, True) ; #DEBUG_LINE_NO:82
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:83
EndFunction

Function Fragment_Stage_0310_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Package.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:91
EndFunction

Function Fragment_Stage_0315_Item_00()
  UC_GG_Connect_HelenaKnowsCourierIsDead.SetValue(1.0) ; #DEBUG_LINE_NO:99
EndFunction

Function Fragment_Stage_1000_Item_00()
  (Alias_ScanPoints as uc_gg_connect_scannerrefcolscript).BlockScannerState(True) ; #DEBUG_LINE_NO:108
  City_GG_Mark.Start() ; #DEBUG_LINE_NO:110
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:111
  Self.Stop() ; #DEBUG_LINE_NO:112
EndFunction
