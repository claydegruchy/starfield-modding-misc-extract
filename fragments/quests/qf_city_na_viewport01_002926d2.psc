ScriptName Fragments:Quests:QF_City_NA_Viewport01_002926D2 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Maguffin Auto Const mandatory
ReferenceAlias Property Alias_StartMarker Auto Const mandatory
ReferenceAlias Property Alias_Door Auto Const mandatory
Quest Property City_NA_Viewport02 Auto Const mandatory
Quest Property MQ105 Auto Const mandatory
ReferenceAlias Property Alias_Keycard01 Auto Const mandatory
Quest Property City_NA_GuardPointer_Viewport Auto Const mandatory
ReferenceAlias Property Alias_EminMacar Auto Const mandatory
ReferenceAlias Property Alias_Keycard02 Auto Const mandatory
Faction Property UCSecurityFaction Auto Const mandatory
Potion Property SupernovaDrink Auto Const mandatory
ObjectReference Property vendorContainerRef Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_1500_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0000_Item_00()
  Game.GetPlayer().MoveTo(Alias_StartMarker.GetReference(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0001_Item_00()
  Alias_Door.GetReference().lock(True, False, True) ; #DEBUG_LINE_NO:16
  Alias_Door.GetReference().SetOpen(False) ; #DEBUG_LINE_NO:17
  Alias_EminMacar.GetReference().Enable(False) ; #DEBUG_LINE_NO:19
  Alias_Keycard02.getref().SetFactionOwner(UCSecurityFaction, False) ; #DEBUG_LINE_NO:21
  Self.SetStage(10) ; #DEBUG_LINE_NO:22
EndFunction

Function Fragment_Stage_0050_Item_00()
  If Self.IsObjectivedisplayed(20) ; #DEBUG_LINE_NO:30
    Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:33
  City_NA_GuardPointer_Viewport.SetStage(200) ; #DEBUG_LINE_NO:36
  Alias_EminMacar.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:37
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_EminMacar.GetActorReference().EvaluatePackage(False) ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_0210_Item_00()
  Alias_Door.GetReference().lock(False, False, True) ; #DEBUG_LINE_NO:53
  Alias_Door.GetReference().SetOpen(True) ; #DEBUG_LINE_NO:54
  Self.SetStage(400) ; #DEBUG_LINE_NO:55
EndFunction

Function Fragment_Stage_0350_Item_00()
  Game.GetPlayer().Additem(Alias_Keycard01.GetReference() as Form, 1, False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:71
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:80
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:81
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().RemoveItem(Alias_Maguffin.GetReference() as Form, 1, False, None) ; #DEBUG_LINE_NO:89
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:90
  Alias_EminMacar.GetReference().Disable(False) ; #DEBUG_LINE_NO:91
  vendorContainerRef.Additem(SupernovaDrink as Form, 5, False) ; #DEBUG_LINE_NO:94
  If MQ105.GetStageDone(2000) ; #DEBUG_LINE_NO:97
    Self.SetStage(1500) ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_2000_Item_00()
  City_NA_Viewport02.Start() ; #DEBUG_LINE_NO:117
  Self.Stop() ; #DEBUG_LINE_NO:118
EndFunction
