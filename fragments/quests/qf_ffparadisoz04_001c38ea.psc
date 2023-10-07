ScriptName Fragments:Quests:QF_FFParadisoZ04_001C38EA Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Guest Auto Const mandatory
Topic Property FFParadisoZ04_0250_Guest_Say_Surrender Auto Const mandatory
Scene Property FFParadisoZ04_0100_Guest_Greeting_Confront Auto Const mandatory
ReferenceAlias Property Alias_RoomKey Auto Const mandatory
Quest Property FFParadisoZ04Misc Auto Const mandatory
ReferenceAlias Property Alias_GuestMarker Auto Const mandatory
Faction Property ParadisoFaction Auto Const mandatory
Faction Property CrimeFactionParadiso Auto Const mandatory
ReferenceAlias Property Alias_Security Auto Const mandatory
ActorValue Property FFParadisoZ04_Foreknowledge_AV Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0100_Item_00()
  FFParadisoZ04Misc.SetStage(1000) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().AddItem(Alias_RoomKey.GetRef() as Form, 1, False) ; #DEBUG_LINE_NO:9
  Self.SetObjectiveDisplayed(100, True, False) ; #DEBUG_LINE_NO:11
  ObjectReference myGuest = Alias_Guest.GetRef() ; #DEBUG_LINE_NO:12
  myGuest.MoveTo(Alias_GuestMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:13
  myGuest.Enable(False) ; #DEBUG_LINE_NO:14
  (myGuest as Actor).RemoveFromFaction(ParadisoFaction) ; #DEBUG_LINE_NO:15
  (myGuest as Actor).RemoveFromFaction(CrimeFactionParadiso) ; #DEBUG_LINE_NO:16
  (myGuest as Actor).SetNoBleedoutRecovery(True) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0150_Item_00()
  Alias_Guest.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:25
  FFParadisoZ04_0100_Guest_Greeting_Confront.Start() ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor myGuest = Alias_Guest.GetActorRef() ; #DEBUG_LINE_NO:34
  myGuest.StartCombat(Game.GetPlayer() as ObjectReference, True) ; #DEBUG_LINE_NO:35
  myGuest.EvaluatePackage(False) ; #DEBUG_LINE_NO:36
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:38
  Self.SetObjectiveDisplayed(200, True, False) ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Stage_0250_Item_00()
  Actor myGuest = Alias_Guest.GetActorRef() ; #DEBUG_LINE_NO:47
  myGuest.Say(FFParadisoZ04_0250_Guest_Say_Surrender, None, False, None) ; #DEBUG_LINE_NO:48
  Self.SetStage(300) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0300_Item_00()
  Actor mySecurity = Alias_Security.GetActorRef() ; #DEBUG_LINE_NO:57
  mySecurity.Enable(False) ; #DEBUG_LINE_NO:58
  mySecurity.EvaluatePackage(False) ; #DEBUG_LINE_NO:59
  Alias_Guest.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:60
  Self.SetObjectiveCompleted(100, True) ; #DEBUG_LINE_NO:61
  Self.SetObjectiveCompleted(200, True) ; #DEBUG_LINE_NO:62
  Self.SetObjectiveDisplayed(300, True, False) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_10000_Item_00()
  Alias_Guest.GetRef().Disable(False) ; #DEBUG_LINE_NO:71
  Alias_Security.GetRef().Disable(False) ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_1000_Item_00()
  Game.GetPlayer().SetValue(FFParadisoZ04_Foreknowledge_AV, 1.0) ; #DEBUG_LINE_NO:80
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:82
  Self.Stop() ; #DEBUG_LINE_NO:83
EndFunction
