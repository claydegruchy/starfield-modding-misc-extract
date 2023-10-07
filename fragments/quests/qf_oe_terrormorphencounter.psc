ScriptName Fragments:Quests:QF_OE_TerrormorphEncounter Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_CenterMarker Auto Const mandatory
ReferenceAlias Property Alias_SpawnFurniture Auto Const mandatory
Potion Property Aid_MedPack Auto Const mandatory
ReferenceAlias Property Alias_Terrormorph Auto Const mandatory
ReferenceAlias Property Alias_TerrormorphCorpse Auto Const mandatory
ReferenceAlias Property Alias_VanguardCommander Auto Const mandatory
ReferenceAlias Property Alias_Aceles Auto Const mandatory
ReferenceAlias Property Alias_VanguardAcelesHandler Auto Const mandatory
ReferenceAlias Property Alias_VanguardInjured Auto Const mandatory
ReferenceAlias Property Alias_VanguardVendor Auto Const mandatory
ReferenceAlias Property Alias_MarkerAmbush Auto Const mandatory
Scene Property Scene_InjuredVanguardDies Auto Const mandatory
Scene Property Scene_CommanderArrived Auto Const mandatory
ReferenceAlias Property Alias_RewardContainer Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  Self.SetStage(75) ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0100_Item_00()
  Actor Vanguard = Alias_VanguardCommander.GetActorRef() ; #DEBUG_LINE_NO:15
  Actor Aceles = Alias_Aceles.GetActorRef() ; #DEBUG_LINE_NO:16
  Actor Terrormorph = Alias_Terrormorph.GetActorRef() ; #DEBUG_LINE_NO:17
  Alias_RewardContainer.GetRef().Lock(True, False, True) ; #DEBUG_LINE_NO:19
  Terrormorph.EvaluatePackage(False) ; #DEBUG_LINE_NO:20
  If Vanguard != None ; #DEBUG_LINE_NO:22
    Vanguard.EvaluatePackage(False) ; #DEBUG_LINE_NO:23
  EndIf ; #DEBUG_LINE_NO:
  If Aceles != None ; #DEBUG_LINE_NO:26
    Aceles.EvaluatePackage(False) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
  If Alias_VanguardCommander.GetRef() == None ; #DEBUG_LINE_NO:30
    Self.SetStage(999) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(75) ; #DEBUG_LINE_NO:34
EndFunction

Function Fragment_Stage_0110_Item_00()
  Alias_VanguardInjured.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:42
  Self.SetStage(210) ; #DEBUG_LINE_NO:43
EndFunction

Function Fragment_Stage_0115_Item_00()
  Self.SetStage(110) ; #DEBUG_LINE_NO:51
EndFunction

Function Fragment_Stage_0120_Item_00()
  If Game.GetPlayer().GetItemCount(Aid_MedPack as Form) >= 1 ; #DEBUG_LINE_NO:59
    Game.GetPlayer().RemoveItem(Aid_MedPack as Form, 1, False, None) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
  Self.SetStage(110) ; #DEBUG_LINE_NO:63
EndFunction

Function Fragment_Stage_0130_Item_00()
  Actor InjuredVanguard = None ; #DEBUG_LINE_NO:71
  InjuredVanguard = Alias_VanguardInjured.GetActorReference() ; #DEBUG_LINE_NO:72
  If InjuredVanguard ; #DEBUG_LINE_NO:74
    Scene_InjuredVanguardDies.Start() ; #DEBUG_LINE_NO:75
    InjuredVanguard.Kill(None) ; #DEBUG_LINE_NO:76
    InjuredVanguard.EvaluatePackage(False) ; #DEBUG_LINE_NO:77
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0150_Item_00()
  Self.SetObjectiveDisplayed(150, True, False) ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Stage_0200_Item_00()
  Actor Vanguard00 = Alias_VanguardCommander.GetActorRef() ; #DEBUG_LINE_NO:94
  Actor Vanguard01 = Alias_VanguardAcelesHandler.GetActorRef() ; #DEBUG_LINE_NO:95
  Actor Vanguard02 = Alias_VanguardVendor.GetActorRef() ; #DEBUG_LINE_NO:96
  Actor Vanguard03 = Alias_VanguardInjured.GetActorRef() ; #DEBUG_LINE_NO:97
  Actor Aceles = Alias_Aceles.GetActorRef() ; #DEBUG_LINE_NO:98
  Self.SetObjectiveCompleted(150, True) ; #DEBUG_LINE_NO:100
  Aceles.EvaluatePackage(False) ; #DEBUG_LINE_NO:102
  Vanguard00.EvaluatePackage(False) ; #DEBUG_LINE_NO:103
  Vanguard01.EvaluatePackage(False) ; #DEBUG_LINE_NO:104
  Vanguard02.EvaluatePackage(False) ; #DEBUG_LINE_NO:105
  Vanguard03.EvaluatePackage(False) ; #DEBUG_LINE_NO:106
EndFunction

Function Fragment_Stage_0250_Item_00()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:114
  Alias_VanguardInjured.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:115
  Alias_VanguardVendor.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:116
  Alias_VanguardAcelesHandler.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:117
  Alias_Aceles.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:118
  Self.SetStage(220) ; #DEBUG_LINE_NO:120
EndFunction

Function Fragment_Stage_0290_Item_00()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:128
  Alias_VanguardCommander.GetActorRef().SetProtected(False) ; #DEBUG_LINE_NO:129
  Alias_Aceles.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:130
  Self.SetStage(250) ; #DEBUG_LINE_NO:132
EndFunction

Function Fragment_Stage_0300_Item_00()
  Self.SetStage(600) ; #DEBUG_LINE_NO:140
EndFunction

Function Fragment_Stage_0400_Item_00()
  Self.SetObjectiveDisplayed(400, True, False) ; #DEBUG_LINE_NO:148
  Self.SetStage(600) ; #DEBUG_LINE_NO:149
EndFunction

Function Fragment_Stage_0500_Item_00()
  Self.SetObjectiveDisplayed(500, True, False) ; #DEBUG_LINE_NO:157
  Self.SetStage(600) ; #DEBUG_LINE_NO:158
EndFunction

Function Fragment_Stage_0600_Item_00()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:166
  Alias_Aceles.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:167
  Self.SetStage(250) ; #DEBUG_LINE_NO:168
EndFunction

Function Fragment_Stage_0600_Item_01()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:176
  Alias_Aceles.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:177
  Self.SetStage(250) ; #DEBUG_LINE_NO:178
EndFunction

Function Fragment_Stage_0600_Item_02()
  Alias_VanguardCommander.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:186
  Alias_Aceles.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:187
  Float WaitTime = Utility.RandomFloat(4.5, 15.5) ; #DEBUG_LINE_NO:189
  Utility.Wait(WaitTime) ; #DEBUG_LINE_NO:191
  Self.SetStage(700) ; #DEBUG_LINE_NO:192
EndFunction

Function Fragment_Stage_0610_Item_00()
  If Self.GetStageDone(400) ; #DEBUG_LINE_NO:200
    Scene_CommanderArrived.Start() ; #DEBUG_LINE_NO:201
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0620_Item_00()
  Int PlayerLevel = Game.GetPlayer().GetLevel() ; #DEBUG_LINE_NO:210
  PlayerLevel = Math.Max(PlayerLevel as Float, 1.0) as Int ; #DEBUG_LINE_NO:212
  PlayerLevel = Math.Min(PlayerLevel as Float, 100.0) as Int ; #DEBUG_LINE_NO:213
  If Utility.RandomInt(0, PlayerLevel) > 50 ; #DEBUG_LINE_NO:215
    Self.SetStage(630) ; #DEBUG_LINE_NO:216
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0630_Item_00()
  Self.SetStage(790) ; #DEBUG_LINE_NO:225
EndFunction

Function Fragment_Stage_0700_Item_00()
  Actor SpawnedTerrormorph = None ; #DEBUG_LINE_NO:233
  Actor Commander = None ; #DEBUG_LINE_NO:234
  Actor Aceles = None ; #DEBUG_LINE_NO:235
  SpawnedTerrormorph = Alias_Terrormorph.GetActorReference() ; #DEBUG_LINE_NO:237
  Commander = Alias_VanguardCommander.GetActorRef() ; #DEBUG_LINE_NO:238
  Aceles = Alias_Aceles.GetActorRef() ; #DEBUG_LINE_NO:239
  Self.SetObjectiveCompleted(400, True) ; #DEBUG_LINE_NO:241
  Self.SetObjectiveCompleted(500, True) ; #DEBUG_LINE_NO:242
  Self.SetObjectiveDisplayed(700, True, False) ; #DEBUG_LINE_NO:243
  SpawnedTerrormorph.Enable(False) ; #DEBUG_LINE_NO:245
  SpawnedTerrormorph.EvaluatePackage(False) ; #DEBUG_LINE_NO:247
  Commander.EvaluatePackage(False) ; #DEBUG_LINE_NO:248
  Aceles.EvaluatePackage(False) ; #DEBUG_LINE_NO:249
  If !Self.GetStageDone(110) ; #DEBUG_LINE_NO:252
    Self.SetStage(130) ; #DEBUG_LINE_NO:253
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0710_Item_00()
  Actor SpawnedTerrormorph = None ; #DEBUG_LINE_NO:262
  SpawnedTerrormorph = Alias_Terrormorph.GetActorReference() ; #DEBUG_LINE_NO:263
  SpawnedTerrormorph.Enable(False) ; #DEBUG_LINE_NO:265
  SpawnedTerrormorph.EvaluatePackage(False) ; #DEBUG_LINE_NO:266
  If !Self.GetStageDone(110) ; #DEBUG_LINE_NO:269
    Self.SetStage(130) ; #DEBUG_LINE_NO:270
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0790_Item_00()
  If !Self.GetStageDone(700) ; #DEBUG_LINE_NO:279
    Self.SetStage(700) ; #DEBUG_LINE_NO:280
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0800_Item_00()
  If !Self.GetStageDone(810) || !Self.GetStageDone(811) || !Self.GetStageDone(812) || !Self.GetStageDone(813) ; #DEBUG_LINE_NO:289
    Self.SetStage(900) ; #DEBUG_LINE_NO:290
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(990) ; #DEBUG_LINE_NO:292
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0810_Item_00()
  If !Self.GetStageDone(820) && Alias_Aceles.GetActorRef() != None ; #DEBUG_LINE_NO:301
    Alias_Aceles.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:302
  EndIf ; #DEBUG_LINE_NO:
  If Self.IsObjectiveDisplayed(150) ; #DEBUG_LINE_NO:305
    Self.SetObjectiveFailed(150, True) ; #DEBUG_LINE_NO:306
  EndIf ; #DEBUG_LINE_NO:
  If !Self.GetStageDone(790) ; #DEBUG_LINE_NO:310
    Self.SetStage(710) ; #DEBUG_LINE_NO:311
    Self.SetStage(980) ; #DEBUG_LINE_NO:312
  EndIf ; #DEBUG_LINE_NO:
  If Self.GetStageDone(811) && Self.GetStageDone(812) && Self.GetStageDone(813) ; #DEBUG_LINE_NO:315
    Self.SetStage(985) ; #DEBUG_LINE_NO:316
    Self.SetStage(700) ; #DEBUG_LINE_NO:317
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0811_Item_00()
  If Self.GetStageDone(810) && Self.GetStageDone(812) && Self.GetStageDone(813) ; #DEBUG_LINE_NO:326
    Self.SetStage(985) ; #DEBUG_LINE_NO:327
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0812_Item_00()
  If Self.GetStageDone(810) && Self.GetStageDone(811) && Self.GetStageDone(813) ; #DEBUG_LINE_NO:336
    Self.SetStage(985) ; #DEBUG_LINE_NO:337
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0813_Item_00()
  If Self.GetStageDone(810) && Self.GetStageDone(811) && Self.GetStageDone(812) ; #DEBUG_LINE_NO:346
    Self.SetStage(985) ; #DEBUG_LINE_NO:347
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0820_Item_00()
  If !Self.GetStageDone(810) ; #DEBUG_LINE_NO:356
    If Alias_VanguardCommander.GetActorRef() != None ; #DEBUG_LINE_NO:357
      Alias_VanguardCommander.GetActorRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:358
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0850_Item_00()
  Self.SetObjectiveCompleted(700, True) ; #DEBUG_LINE_NO:368
  Self.SetStage(790) ; #DEBUG_LINE_NO:369
  Self.SetStage(800) ; #DEBUG_LINE_NO:370
EndFunction

Function Fragment_Stage_0900_Item_00()
  If Self.GetStageDone(810) && Self.GetStageDone(811) && Self.GetStageDone(812) && Self.GetStageDone(813) ; #DEBUG_LINE_NO:378
    Self.SetStage(990) ; #DEBUG_LINE_NO:379
  Else ; #DEBUG_LINE_NO:
    Self.SetObjectiveDisplayed(900, True, False) ; #DEBUG_LINE_NO:381
  EndIf ; #DEBUG_LINE_NO:
  Actor Vanguard00 = Alias_VanguardCommander.GetActorRef() ; #DEBUG_LINE_NO:384
  Actor Vanguard01 = Alias_VanguardAcelesHandler.GetActorRef() ; #DEBUG_LINE_NO:385
  Actor Vanguard02 = Alias_VanguardVendor.GetActorRef() ; #DEBUG_LINE_NO:386
  Actor Vanguard03 = Alias_VanguardInjured.GetActorRef() ; #DEBUG_LINE_NO:387
  Vanguard00.EvaluatePackage(False) ; #DEBUG_LINE_NO:388
  Vanguard01.EvaluatePackage(False) ; #DEBUG_LINE_NO:389
  Vanguard02.EvaluatePackage(False) ; #DEBUG_LINE_NO:390
  Vanguard03.EvaluatePackage(False) ; #DEBUG_LINE_NO:391
EndFunction

Function Fragment_Stage_0980_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:399
  Self.SetStage(999) ; #DEBUG_LINE_NO:400
EndFunction

Function Fragment_Stage_0985_Item_00()
  Self.FailAllObjectives() ; #DEBUG_LINE_NO:408
  Self.SetStage(999) ; #DEBUG_LINE_NO:409
EndFunction

Function Fragment_Stage_0990_Item_00()
  Actor Vanguard00 = Alias_VanguardCommander.GetActorRef() ; #DEBUG_LINE_NO:417
  Actor Vanguard01 = Alias_VanguardAcelesHandler.GetActorRef() ; #DEBUG_LINE_NO:418
  Actor Vanguard02 = Alias_VanguardVendor.GetActorRef() ; #DEBUG_LINE_NO:419
  Actor Vanguard03 = Alias_VanguardInjured.GetActorRef() ; #DEBUG_LINE_NO:420
  Actor Aceles = Alias_Aceles.GetActorRef() ; #DEBUG_LINE_NO:421
  Aceles.EvaluatePackage(False) ; #DEBUG_LINE_NO:423
  Vanguard00.EvaluatePackage(False) ; #DEBUG_LINE_NO:424
  Vanguard01.EvaluatePackage(False) ; #DEBUG_LINE_NO:425
  Vanguard02.EvaluatePackage(False) ; #DEBUG_LINE_NO:426
  Vanguard03.EvaluatePackage(False) ; #DEBUG_LINE_NO:427
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:429
EndFunction

Function Fragment_Stage_0995_Item_00()
  Self.SetStage(990) ; #DEBUG_LINE_NO:437
EndFunction

Function Fragment_Stage_0999_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:445
EndFunction
