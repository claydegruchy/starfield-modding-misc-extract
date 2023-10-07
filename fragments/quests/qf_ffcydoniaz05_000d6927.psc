ScriptName Fragments:Quests:QF_FFCydoniaZ05_000D6927 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Sivan Auto Const mandatory
ReferenceAlias Property Alias_RailLeanMarker Auto Const mandatory
Scene Property FFCydoniaZ05_Scene01_Space Auto Const mandatory
Scene Property FFCydoniaZ05_SceneIntro Auto Const mandatory
ActorBase Property SivanActorBase Auto Const mandatory
ReferenceAlias Property Alias_passengerMarker Auto Const mandatory
sq_followersscript Property SQ_Followers Auto Const mandatory
Quest Property City_NewAtlantis_Z_PartingGift Auto Const mandatory
Scene Property SQ_GuardShipsScene Auto Const mandatory
ReferenceAlias Property Alias_CaptainMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Self.SetStage(10) ; #DEBUG_LINE_NO:7
  Game.GetPlayer().MoveTo(Alias_RailLeanMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0002_Item_00()
  City_NewAtlantis_Z_PartingGift.Start() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0010_Item_00()
  Actor SivanRef = Alias_Sivan.GetActorRef() ; #DEBUG_LINE_NO:24
  ObjectReference RailRef = Alias_RailLeanMarker.GetRef() ; #DEBUG_LINE_NO:25
  RailRef.SetActorOwner(SivanActorBase, False) ; #DEBUG_LINE_NO:27
  SivanRef.EnableNoWait(False) ; #DEBUG_LINE_NO:28
  SivanRef.MoveTo(RailRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
  SivanRef.SnapIntoInteraction(RailRef) ; #DEBUG_LINE_NO:30
EndFunction

Function Fragment_Stage_0015_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:38
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_RailLeanMarker.GetRef().SetActorOwner(None, False) ; #DEBUG_LINE_NO:46
EndFunction

Function Fragment_Stage_0025_Item_00()
  Actor SivanRef = Alias_Sivan.GetActorRef() ; #DEBUG_LINE_NO:54
  SQ_Followers.SetRoleInactive(SivanRef, True, False, True) ; #DEBUG_LINE_NO:55
  SivanRef.MoveTo(Alias_passengerMarker.GetRef(), 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:56
  SivanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Stage_0025_Item_01()
  Self.SetStage(15) ; #DEBUG_LINE_NO:65
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:73
  FFCydoniaZ05_SceneIntro.Stop() ; #DEBUG_LINE_NO:74
  Actor SivanRef = Alias_Sivan.GetActorRef() ; #DEBUG_LINE_NO:75
  SQ_Followers.SetRoleActive(SivanRef, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:76
  SivanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:77
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:85
  SQ_GuardShipsScene.Stop() ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_CaptainMarker.RefillAlias() ; #DEBUG_LINE_NO:94
  ObjectReference ShipRef = Alias_CaptainMarker.GetRef() ; #DEBUG_LINE_NO:96
  ObjectReference PassengerRef = Alias_passengerMarker.GetRef() ; #DEBUG_LINE_NO:97
  ObjectReference SivanRef = Alias_Sivan.GetRef() ; #DEBUG_LINE_NO:99
  If SivanRef.GetDistance(ShipRef) > 10.0 && ShipRef != None ; #DEBUG_LINE_NO:101
    SivanRef.MoveTo(ShipRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:102
  ElseIf SivanRef.GetDistance(PassengerRef) > 10.0 && PassengerRef != None ; #DEBUG_LINE_NO:103
    SivanRef.MoveTo(PassengerRef, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:104
  EndIf ; #DEBUG_LINE_NO:
  SQ_GuardShipsScene.Stop() ; #DEBUG_LINE_NO:107
  FFCydoniaZ05_Scene01_Space.Start() ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0050_Item_00()
  FFCydoniaZ05_Scene01_Space.Stop() ; #DEBUG_LINE_NO:116
  Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:117
  Self.SetStage(40) ; #DEBUG_LINE_NO:118
EndFunction

Function Fragment_Stage_0060_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:126
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:127
EndFunction

Function Fragment_Stage_0066_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:135
EndFunction

Function Fragment_Stage_0070_Item_00()
  Actor SivanRef = Alias_Sivan.GetActorRef() ; #DEBUG_LINE_NO:143
  SQ_Followers.SetRoleInactive(SivanRef, True, False, True) ; #DEBUG_LINE_NO:144
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:146
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:147
EndFunction

Function Fragment_Stage_0070_Item_01()
  Actor SivanRef = Alias_Sivan.GetActorRef() ; #DEBUG_LINE_NO:155
  SivanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_0070_Item_02()
  Actor SivanRef = Alias_Sivan.GetActorRef() ; #DEBUG_LINE_NO:164
  SivanRef.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:165
  SivanRef.EvaluatePackage(False) ; #DEBUG_LINE_NO:166
EndFunction

Function Fragment_Stage_0100_Item_00()
  Alias_Sivan.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:174
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:175
EndFunction

Function Fragment_Stage_0200_Item_00()
  Alias_Sivan.GetActorRef().DisableNoWait(False) ; #DEBUG_LINE_NO:183
  Self.Stop() ; #DEBUG_LINE_NO:184
EndFunction
