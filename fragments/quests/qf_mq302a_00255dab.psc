ScriptName Fragments:Quests:QF_MQ302a_00255DAB Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_EmissaryShip Auto Const mandatory
ReferenceAlias Property Alias_HunterShip Auto Const mandatory
Faction Property MQ_HunterFaction Auto Const mandatory
Faction Property MQ_EmissaryFaction Auto Const mandatory
GlobalVariable Property MQ_SidedWithEmissary Auto Const mandatory
GlobalVariable Property MQ_SidedWithHunter Auto Const mandatory
Quest Property MQ303 Auto Const mandatory
Quest Property MQ304 Auto Const mandatory
ActorValue Property DockingPermission Auto Const mandatory
Faction Property MQ_HunterAllyFaction Auto Const mandatory
Faction Property MQ_EmissaryAllyFaction Auto Const mandatory
ObjectReference Property MQ302ScorpiusMoveMarker Auto Const mandatory
ObjectReference Property MQ302HelixMoveMarker Auto Const mandatory
ObjectReference Property MQ302_EmissaryShipLanding Auto Const mandatory
ObjectReference Property MQ302_HunterShipLanding Auto Const mandatory
ReferenceAlias Property Alias_Emissary Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
ObjectReference Property MQ302Start Auto Const mandatory
Quest Property MQ302b Auto Const mandatory
Quest Property MQ304b Auto Const mandatory
Quest Property MQ301 Auto Const mandatory
Location Property LC165BuriedTempleSpaceLocation Auto Const mandatory
Location Property LC165BuriedTempleLocation Auto Const mandatory
GlobalVariable Property MQ302_SidedWithChoice Auto Const mandatory
ObjectReference Property ScorpiusOborumMarker Auto Const mandatory
ObjectReference Property MQ207_EmissaryMarker01 Auto Const mandatory
ObjectReference Property HelixOborumMarker Auto Const mandatory
ObjectReference Property MQ207_HunterMarker01 Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property MQ303EmissaryMarker01 Auto Const mandatory
Scene Property MQ302_001_EmissaryHunter Auto Const mandatory
ObjectReference Property MQ301EmissaryHunterMoveToMarker Auto Const mandatory
Quest Property MQ207B Auto Const mandatory
Faction Property MQEmissaryHunterCrimeFaction Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Faction Property MQHunterCrimeFaction Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  Game.GetPlayer().moveto(MQ302Start, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  MQ301.SetStage(400) ; #DEBUG_LINE_NO:12
  Self.SetStage(10) ; #DEBUG_LINE_NO:13
  MQ207B.SetStage(10) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0010_Item_00()
  spaceshipreference HunterShipREF = Alias_HunterShip.GetShipReference() ; #DEBUG_LINE_NO:24
  spaceshipreference EmissaryShipREF = Alias_EmissaryShip.GetShipReference() ; #DEBUG_LINE_NO:25
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:26
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:27
  HunterShipREF.moveto(MQ302_HunterShipLanding, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:29
  EmissaryShipREF.moveto(MQ302_EmissaryShipLanding, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:30
  HunterShipREF.Enable(False) ; #DEBUG_LINE_NO:32
  EmissaryShipREF.Enable(False) ; #DEBUG_LINE_NO:33
  HunterREF.Disable(False) ; #DEBUG_LINE_NO:35
  HunterREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:36
  HunterREF.moveto(MQ301EmissaryHunterMoveToMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:37
  HunterREF.Enable(False) ; #DEBUG_LINE_NO:38
  EmissaryREF.Disable(False) ; #DEBUG_LINE_NO:39
  EmissaryREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:40
  EmissaryREF.moveto(MQ301EmissaryHunterMoveToMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:41
  EmissaryREF.Enable(False) ; #DEBUG_LINE_NO:42
  MQ304b.Start() ; #DEBUG_LINE_NO:45
  HunterREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:48
  EmissaryREF.SetCrimeFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:49
EndFunction

Function Fragment_Stage_0015_Item_00()
  spaceshipreference HunterShipREF = Alias_HunterShip.GetShipReference() ; #DEBUG_LINE_NO:58
  spaceshipreference EmissaryShipREF = Alias_EmissaryShip.GetShipReference() ; #DEBUG_LINE_NO:59
  HunterShipREF.Enable(False) ; #DEBUG_LINE_NO:61
  EmissaryShipREF.Enable(False) ; #DEBUG_LINE_NO:62
  Self.SetObjectiveDisplayed(15, True, False) ; #DEBUG_LINE_NO:64
EndFunction

Function Fragment_Stage_0020_Item_00()
  MQ302_001_EmissaryHunter.Start() ; #DEBUG_LINE_NO:72
EndFunction

Function Fragment_Stage_0100_Item_00()
  MQ302_SidedWithChoice.SetValueInt(0) ; #DEBUG_LINE_NO:80
  MQ301.SetStage(500) ; #DEBUG_LINE_NO:81
  spaceshipreference EmissaryShipREF = Alias_EmissaryShip.GetShipReference() ; #DEBUG_LINE_NO:84
  EmissaryShipREF.SetValue(DockingPermission, 1.0) ; #DEBUG_LINE_NO:85
  Game.GetPlayer().addtoFaction(MQ_EmissaryAllyFaction) ; #DEBUG_LINE_NO:86
  Self.SetStage(200) ; #DEBUG_LINE_NO:88
EndFunction

Function Fragment_Stage_0105_Item_00()
  MQ304b.SetStage(5) ; #DEBUG_LINE_NO:97
EndFunction

Function Fragment_Stage_0110_Item_00()
  MQ302_SidedWithChoice.SetValueInt(1) ; #DEBUG_LINE_NO:105
  MQ301.SetStage(500) ; #DEBUG_LINE_NO:106
  Self.SetStage(200) ; #DEBUG_LINE_NO:108
EndFunction

Function Fragment_Stage_0120_Item_00()
  Game.StopDialogueCamera(False, False) ; #DEBUG_LINE_NO:116
  MQ302_001_EmissaryHunter.Stop() ; #DEBUG_LINE_NO:117
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:119
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:120
  HunterREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:121
  EmissaryREF.PlaceAtMe(LC165_ScriptedTeleportSourceExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:122
  HunterREF.moveto(MQ207_HunterMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:124
  EmissaryREF.moveto(MQ303EmissaryMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:125
  MQ302_SidedWithChoice.SetValueInt(2) ; #DEBUG_LINE_NO:127
  MQ301.SetStage(500) ; #DEBUG_LINE_NO:128
  Self.SetStage(200) ; #DEBUG_LINE_NO:130
EndFunction

Function Fragment_Stage_0200_Item_00()
  spaceshipreference HunterShipREF = Alias_HunterShip.GetShipReference() ; #DEBUG_LINE_NO:138
  spaceshipreference EmissaryShipREF = Alias_EmissaryShip.GetShipReference() ; #DEBUG_LINE_NO:139
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:140
  Actor EmissaryREF = Alias_Emissary.GetActorRef() ; #DEBUG_LINE_NO:141
  HunterShipREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:143
  EmissaryShipREF.EvaluatePackage(False) ; #DEBUG_LINE_NO:144
  If Self.GetStageDone(110) == False ; #DEBUG_LINE_NO:147
    MQ304b.Stop() ; #DEBUG_LINE_NO:148
  EndIf ; #DEBUG_LINE_NO:
  HunterREF.SetCrimeFaction(MQHunterCrimeFaction) ; #DEBUG_LINE_NO:152
  EmissaryREF.SetCrimeFaction(None) ; #DEBUG_LINE_NO:153
  HunterREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:155
  EmissaryREF.RemoveFromFaction(MQEmissaryHunterCrimeFaction) ; #DEBUG_LINE_NO:156
EndFunction

Function Fragment_Stage_1000_Item_01()
  spaceshipreference HelixREF = Alias_EmissaryShip.GetShipRef() ; #DEBUG_LINE_NO:164
  spaceshipreference ScorpiusREF = Alias_HunterShip.GetShipRef() ; #DEBUG_LINE_NO:165
  ScorpiusREF.DisableNoWait(False) ; #DEBUG_LINE_NO:167
  HelixREF.moveto(HelixOborumMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:169
  HelixREF.Enable(False) ; #DEBUG_LINE_NO:170
  Alias_Emissary.GetActorRef().moveto(MQ207_EmissaryMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:173
EndFunction

Function Fragment_Stage_1000_Item_02()
  spaceshipreference ScorpiusREF = Alias_HunterShip.GetShipRef() ; #DEBUG_LINE_NO:181
  spaceshipreference HelixREF = Alias_EmissaryShip.GetShipRef() ; #DEBUG_LINE_NO:182
  HelixREF.DisableNoWait(False) ; #DEBUG_LINE_NO:184
  ScorpiusREF.moveto(ScorpiusOborumMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:186
  ScorpiusREF.Enable(False) ; #DEBUG_LINE_NO:187
  Alias_Hunter.GetActorRef().moveto(MQ207_HunterMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:190
EndFunction

Function Fragment_Stage_1000_Item_03()
  spaceshipreference ScorpiusREF = Alias_HunterShip.GetShipRef() ; #DEBUG_LINE_NO:198
  spaceshipreference HelixREF = Alias_EmissaryShip.GetShipRef() ; #DEBUG_LINE_NO:199
  ScorpiusREF.DisableNoWait(False) ; #DEBUG_LINE_NO:201
  HelixREF.DisableNoWait(False) ; #DEBUG_LINE_NO:202
EndFunction
