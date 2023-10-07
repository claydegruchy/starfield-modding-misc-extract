ScriptName Fragments:Quests:QF_FFCydoniaZ08_0030B819 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_DevicePlaced Auto Const mandatory
Quest Property FFCydoniaZ08Misc Auto Const mandatory
ReferenceAlias Property Alias_DeviceActivator Auto Const mandatory
ReferenceAlias Property Alias_Device Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  If FFCydoniaZ08Misc.IsRunning() ; #DEBUG_LINE_NO:7
    FFCydoniaZ08Misc.SetStage(1000) ; #DEBUG_LINE_NO:8
  EndIf ; #DEBUG_LINE_NO:
  Alias_DeviceActivator.GetRef().Enable(False) ; #DEBUG_LINE_NO:13
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0200_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Device.GetRef() as Form, 1, False, None) ; #DEBUG_LINE_NO:23
  Alias_DevicePlaced.GetRef().Enable(False) ; #DEBUG_LINE_NO:24
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:25
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_2000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:42
EndFunction
