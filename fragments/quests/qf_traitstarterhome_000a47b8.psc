ScriptName Fragments:Quests:QF_TraitStarterHome_000A47B8 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property TraitStarterHome_Pointer Auto Const mandatory
Perk Property TRAIT_StarterHome Auto Const mandatory
MiscObject Property Credits Auto Const mandatory
ReferenceAlias Property Alias_MapMarker Auto Const mandatory
ReferenceAlias Property Alias_MapMarkerRename Auto Const mandatory
Keyword Property MapMarkerLinkedRefNameOverride Auto Const mandatory
GlobalVariable Property Trait_StarterHome_Mortgage Auto Const mandatory
ReferenceAlias Property Alias_HomeMarker Auto Const mandatory
RefCollectionAlias Property Alias_HomeDoors Auto Const mandatory
sq_playerhousescript Property PlayerHouseSystem Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0001_Item_00()
  ObjectReference mapMarkerRef = Alias_MapMarker.GetRef() ; #DEBUG_LINE_NO:7
  ObjectReference mapMarkerRenameRef = Alias_MapMarkerRename.GetRef() ; #DEBUG_LINE_NO:8
  mapMarkerRef.SetLinkedRef(mapMarkerRenameRef, MapMarkerLinkedRefNameOverride, True) ; #DEBUG_LINE_NO:10
  ObjectReference[] DoorRef = Alias_HomeDoors.GetArray() ; #DEBUG_LINE_NO:12
  Int I = 0 ; #DEBUG_LINE_NO:14
  While I < DoorRef.Length ; #DEBUG_LINE_NO:16
    DoorRef[I].BlockActivation(True, False) ; #DEBUG_LINE_NO:17
    I += 1 ; #DEBUG_LINE_NO:18
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:27
  Self.SetObjectiveDisplayedAtTop(100) ; #DEBUG_LINE_NO:28
  Self.SetStage(200) ; #DEBUG_LINE_NO:29
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:38
  Alias_HomeMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:39
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:42
    Self.SetStage(1000) ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:52
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:53
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:54
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:62
  Self.SetObjectiveDisplayed(500, False, False) ; #DEBUG_LINE_NO:63
  PlayerHouseSystem.PurchaseHouse(Trait_StarterHome_Mortgage, None) ; #DEBUG_LINE_NO:66
  If Self.GetStageDone(150) ; #DEBUG_LINE_NO:69
    Self.SetStage(1000) ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
  ObjectReference[] DoorRef = Alias_HomeDoors.GetArray() ; #DEBUG_LINE_NO:73
  Int I = 0 ; #DEBUG_LINE_NO:75
  While I < DoorRef.Length ; #DEBUG_LINE_NO:77
    DoorRef[I].BlockActivation(False, False) ; #DEBUG_LINE_NO:78
    DoorRef[I].Unlock(False) ; #DEBUG_LINE_NO:79
    I += 1 ; #DEBUG_LINE_NO:80
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:89
  If !Self.GetStageDone(150) ; #DEBUG_LINE_NO:90
    Self.SetObjectiveDisplayed(100, False, False) ; #DEBUG_LINE_NO:91
  EndIf ; #DEBUG_LINE_NO:
  Self.SetObjectiveDisplayed(400, False, False) ; #DEBUG_LINE_NO:93
  Game.GetPlayer().RemovePerk(TRAIT_StarterHome) ; #DEBUG_LINE_NO:96
  ObjectReference[] DoorRef = Alias_HomeDoors.GetArray() ; #DEBUG_LINE_NO:98
  Int I = 0 ; #DEBUG_LINE_NO:100
  While I < DoorRef.Length ; #DEBUG_LINE_NO:102
    DoorRef[I].BlockActivation(False, False) ; #DEBUG_LINE_NO:103
    DoorRef[I].SetLockLevel(254) ; #DEBUG_LINE_NO:104
    DoorRef[I].Lock(True, False, True) ; #DEBUG_LINE_NO:105
    I += 1 ; #DEBUG_LINE_NO:106
  EndWhile ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.SetStage(9000) ; #DEBUG_LINE_NO:117
EndFunction

Function Fragment_Stage_9000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:125
EndFunction
