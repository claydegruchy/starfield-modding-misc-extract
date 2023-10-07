ScriptName MQ_TutorialQuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property Tutorial_LockpickingMSGBox Auto Const mandatory
Message Property Tutorial_IndustrialMSGBox Auto Const mandatory
Message Property Tutorial_ResearchMSGBox Auto Const mandatory
Message Property Tutorial_SpeechMSGBox Auto Const mandatory
Message Property Tutorial_InventoryDetail_MSGBox Auto Const mandatory
Message Property Tutorial_SkillsMenu_MSGBox Auto Const mandatory
Message Property Tutorial_SkillsMenu_MSGBox_PC Auto Const mandatory
Message Property Tutorial_ScannerDetail_MSGBox Auto Const mandatory
Message Property Tutorial_MissionMenu_MSGBox Auto Const mandatory
Message Property Tutorial_ShipMenu_MSGBox Auto Const mandatory
Message Property Tutorial_CrewMenu_MSGBox Auto Const mandatory
Message Property Tutorial_StarMap_MSGBox Auto Const mandatory
Message Property Tutorial_StarMap_MSGBox_PC Auto Const mandatory
Message Property MQ104APowerTutorial02MSG Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Int Property StarMapPreReqStage = 510 Auto Const
Int Property StarMapPostStage = 605 Auto Const
Int Property CompanionEMWeapon = 20 Auto Const
ReferenceAlias Property Companion Auto Const mandatory
ReferenceAlias Property EliteCrew Auto Const mandatory
Keyword Property WeaponTypeEM Auto Const mandatory
conditionform Property UC04_WeaponIsTypeEM Auto Const mandatory
ReferenceAlias Property PlayerShip Auto Const mandatory
Int Property ShipLowHealthStage = 30 Auto Const
Int Property ShipDamagedSystemStage = 40 Auto Const
ActorValue Property Health Auto Const mandatory
Message Property Tutorial_ShipBuilderUpgrade_MSGBox Auto Const mandatory
Message Property Tutorial_ShipBuilderModify_MSGBox Auto Const mandatory
Message Property Tutorial_ShipBuilderModify_MSGBox_PC Auto Const mandatory
Message Property Tutorial_SocialSkills Auto Const mandatory
Message Property Tutorial_SocialSkills_PC Auto Const mandatory
Perk Property Skill_Instigation Auto Const mandatory
Perk Property Skill_Intimidation Auto Const mandatory
Perk Property Skill_Manipulation Auto Const mandatory
Perk Property Skill_Diplomacy Auto Const mandatory
Int Property ScannerTutorialStage = 60 Auto Const
Int Property MissionsTutorialStage = 70 Auto Const
Message Property Tutorial_StarbornPower01 Auto Const mandatory
Message Property Tutorial_StarbornPower02 Auto Const mandatory
Message Property Tutorial_StarbornPower03 Auto Const mandatory
Message Property Tutorial_StarbornPower04 Auto Const mandatory
Keyword Property Artifact_Power Auto Const mandatory
ActorValue Property SpaceshipRegistration Auto Const mandatory
Message Property Tutorial_UnregisteredShip Auto Const mandatory
Message Property Tutorial_FailedJump01 Auto Const mandatory
Message Property Tutorial_FailedJump02 Auto Const mandatory
Message Property Tutorial_FailedJump03 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnQuestInit()
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:49
  Self.RegisterForMenuOpenCloseEvent("SecurityMenu") ; #DEBUG_LINE_NO:50
  Self.RegisterForMenuOpenCloseEvent("IndustrialCraftingMenu") ; #DEBUG_LINE_NO:51
  Self.RegisterForMenuOpenCloseEvent("ResearchMenu") ; #DEBUG_LINE_NO:52
  Self.RegisterForMenuOpenCloseEvent("InventoryMenu") ; #DEBUG_LINE_NO:53
  Self.RegisterForMenuOpenCloseEvent("SkillsMenu") ; #DEBUG_LINE_NO:54
  Self.RegisterForMenuOpenCloseEvent("MonocleMenu") ; #DEBUG_LINE_NO:55
  Self.RegisterForMenuOpenCloseEvent("BSMissionMenu") ; #DEBUG_LINE_NO:56
  Self.RegisterForMenuOpenCloseEvent("SpaceshipInfoMenu") ; #DEBUG_LINE_NO:57
  Self.RegisterForMenuOpenCloseEvent("SpaceshipEditorMenu") ; #DEBUG_LINE_NO:58
  Self.RegisterForMenuOpenCloseEvent("ShipCrewMenu") ; #DEBUG_LINE_NO:59
  Self.RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu") ; #DEBUG_LINE_NO:60
  Self.RegisterForTutorialEvent("Dialogue_PersuasionStart") ; #DEBUG_LINE_NO:61
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnItemEquipped") ; #DEBUG_LINE_NO:62
  Self.RegisterForRemoteEvent(Companion as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:63
  Self.RegisterForRemoteEvent(EliteCrew as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:64
  Self.RegisterForRemoteEvent(PlayerShip as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:65
  Self.ShipLowHealth() ; #DEBUG_LINE_NO:66
  Self.RegisterForRemoteEvent(PlayerShip.GetShipRef() as ScriptObject, "OnShipSystemDamaged") ; #DEBUG_LINE_NO:67
  Self.RegisterForTutorialEvent("ShipbuilderUpgradeModeEntered") ; #DEBUG_LINE_NO:68
  Self.RegisterForTutorialEvent("ShipbuilderModifyModeEntered") ; #DEBUG_LINE_NO:69
  Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnPlayerFailedPlotRoute") ; #DEBUG_LINE_NO:70
EndEvent

Function ShipLowHealth()
  spaceshipreference PlayerShipREF = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:75
  Float iLowHealth = PlayerShipREF.GetValue(Health) / 2.0 ; #DEBUG_LINE_NO:76
  Self.RegisterForActorValueLessThanEvent(PlayerShipREF as ObjectReference, Health, iLowHealth) ; #DEBUG_LINE_NO:77
EndFunction

Event OnActorValueLessThan(ObjectReference akObjRef, ActorValue akActorValue)
  spaceshipreference PlayerShipREF = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:82
  If (akObjRef as spaceshipreference == PlayerShipREF) && Self.GetStageDone(ShipLowHealthStage) == False ; #DEBUG_LINE_NO:83
    Self.SetStage(ShipLowHealthStage) ; #DEBUG_LINE_NO:84
    Self.UnRegisterForRemoteEvent(PlayerShip as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:85
  ElseIf (akObjRef as spaceshipreference != PlayerShipREF) && Self.GetStageDone(ShipLowHealthStage) == False ; #DEBUG_LINE_NO:86
    Self.ShipLowHealth() ; #DEBUG_LINE_NO:87
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event SpaceshipReference.OnShipSystemDamaged(spaceshipreference akSender, ActorValue akSystem, Int aBlocksLost, Bool aElectromagneticDamage, Bool aFullyDamaged)
  spaceshipreference PlayerShipREF = PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:92
  If akSender == PlayerShipREF && Self.GetStageDone(ShipDamagedSystemStage) == False ; #DEBUG_LINE_NO:93
    Self.UnRegisterForRemoteEvent(akSender as ScriptObject, "OnShipSystemDamaged") ; #DEBUG_LINE_NO:94
    Self.SetStage(ShipDamagedSystemStage) ; #DEBUG_LINE_NO:95
  ElseIf akSender != PlayerShipREF && Self.GetStageDone(ShipDamagedSystemStage) == False ; #DEBUG_LINE_NO:96
    Self.UnRegisterForRemoteEvent(akSender as ScriptObject, "OnShipSystemDamaged") ; #DEBUG_LINE_NO:97
    Self.RegisterForRemoteEvent(PlayerShipREF as ScriptObject, "OnShipSystemDamaged") ; #DEBUG_LINE_NO:98
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnMenuOpenCloseEvent(String asMenuName, Bool abOpening)
  Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:103
  If asMenuName == "SecurityMenu" ; #DEBUG_LINE_NO:104
    If abOpening ; #DEBUG_LINE_NO:105
      Tutorial_LockpickingMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:106
      Self.UnRegisterForMenuOpenCloseEvent("SecurityMenu") ; #DEBUG_LINE_NO:107
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "IndustrialCraftingMenu" ; #DEBUG_LINE_NO:109
    If abOpening ; #DEBUG_LINE_NO:110
      Tutorial_IndustrialMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:111
      Self.UnRegisterForMenuOpenCloseEvent("IndustrialCraftingMenu") ; #DEBUG_LINE_NO:112
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "ResearchMenu" ; #DEBUG_LINE_NO:114
    If abOpening ; #DEBUG_LINE_NO:115
      Tutorial_ResearchMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:116
      Self.UnRegisterForMenuOpenCloseEvent("ResearchMenu") ; #DEBUG_LINE_NO:117
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "InventoryMenu" ; #DEBUG_LINE_NO:119
    If abOpening ; #DEBUG_LINE_NO:120
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:121
      Self.UnRegisterForMenuOpenCloseEvent("InventoryMenu") ; #DEBUG_LINE_NO:123
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "SkillsMenu" ; #DEBUG_LINE_NO:125
    If abOpening ; #DEBUG_LINE_NO:126
      If Game.UsingGamepad() ; #DEBUG_LINE_NO:127
        Tutorial_SkillsMenu_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:128
      Else ; #DEBUG_LINE_NO:
        Tutorial_SkillsMenu_MSGBox_PC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:130
      EndIf ; #DEBUG_LINE_NO:
      Self.UnRegisterForMenuOpenCloseEvent("SkillsMenu") ; #DEBUG_LINE_NO:132
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "MonocleMenu" ; #DEBUG_LINE_NO:134
    If abOpening && Self.GetStageDone(ScannerTutorialStage) == False ; #DEBUG_LINE_NO:135
      Self.SetStage(ScannerTutorialStage) ; #DEBUG_LINE_NO:136
      Tutorial_ScannerDetail_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:137
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "BSMissionMenu" ; #DEBUG_LINE_NO:139
    If abOpening && Self.GetStageDone(MissionsTutorialStage) == False ; #DEBUG_LINE_NO:140
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:141
      Self.SetStage(MissionsTutorialStage) ; #DEBUG_LINE_NO:142
      Tutorial_MissionMenu_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:143
      Self.UnRegisterForMenuOpenCloseEvent("BSMissionMenu") ; #DEBUG_LINE_NO:144
    Else ; #DEBUG_LINE_NO:
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:146
      Self.UnRegisterForMenuOpenCloseEvent("BSMissionMenu") ; #DEBUG_LINE_NO:147
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "SpaceshipInfoMenu" ; #DEBUG_LINE_NO:149
    If abOpening ; #DEBUG_LINE_NO:150
      Tutorial_ShipMenu_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:151
      Self.UnRegisterForMenuOpenCloseEvent("SpaceshipInfoMenu") ; #DEBUG_LINE_NO:152
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "ShipCrewMenu" ; #DEBUG_LINE_NO:154
    If abOpening ; #DEBUG_LINE_NO:155
      Tutorial_CrewMenu_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:156
      Self.UnRegisterForMenuOpenCloseEvent("ShipCrewMenu") ; #DEBUG_LINE_NO:157
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "GalaxyStarMapMenu" ; #DEBUG_LINE_NO:159
    If abOpening && MQ101.GetStageDone(StarMapPreReqStage) && MQ101.GetStageDone(StarMapPostStage) == False ; #DEBUG_LINE_NO:160
      If Game.UsingGamepad() ; #DEBUG_LINE_NO:161
        Tutorial_StarMap_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:162
      Else ; #DEBUG_LINE_NO:
        Tutorial_StarMap_MSGBox_PC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:164
      EndIf ; #DEBUG_LINE_NO:
      Self.UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu") ; #DEBUG_LINE_NO:166
    ElseIf !abOpening ; #DEBUG_LINE_NO:167
      Message.ClearHelpMessages() ; #DEBUG_LINE_NO:168
      Self.UnRegisterForMenuOpenCloseEvent("GalaxyStarMapMenu") ; #DEBUG_LINE_NO:169
    EndIf ; #DEBUG_LINE_NO:
  ElseIf asMenuName == "SpaceshipEditorMenu" ; #DEBUG_LINE_NO:171
    If abOpening ; #DEBUG_LINE_NO:172
      spaceshipreference[] AllPlayerShips = Game.GetPlayerOwnedShips() ; #DEBUG_LINE_NO:173
      Int iNumShips = AllPlayerShips.Length ; #DEBUG_LINE_NO:174
      Bool bUnregisteredShip = False ; #DEBUG_LINE_NO:175
      Int iCurrentIndex = 0 ; #DEBUG_LINE_NO:176
      While iCurrentIndex < iNumShips ; #DEBUG_LINE_NO:179
        If AllPlayerShips[iCurrentIndex].GetValue(SpaceshipRegistration) == 0.0 ; #DEBUG_LINE_NO:180
          bUnregisteredShip = True ; #DEBUG_LINE_NO:181
        EndIf ; #DEBUG_LINE_NO:
        iCurrentIndex += 1 ; #DEBUG_LINE_NO:183
      EndWhile ; #DEBUG_LINE_NO:
      If bUnregisteredShip ; #DEBUG_LINE_NO:186
        Tutorial_UnregisteredShip.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:187
        Self.UnRegisterForMenuOpenCloseEvent("SpaceshipEditorMenu") ; #DEBUG_LINE_NO:188
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If asMenuName == "DataMenu" ; #DEBUG_LINE_NO:194
    If abOpening ; #DEBUG_LINE_NO:195
      If Self.GetStageDone(100) && !Self.GetStageDone(130) ; #DEBUG_LINE_NO:196
        Message.ClearHelpMessages() ; #DEBUG_LINE_NO:197
        Tutorial_StarbornPower02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:198
        Self.SetStage(110) ; #DEBUG_LINE_NO:199
      EndIf ; #DEBUG_LINE_NO:
    ElseIf !abOpening ; #DEBUG_LINE_NO:201
      If Self.GetStageDone(100) && !Self.GetStageDone(130) ; #DEBUG_LINE_NO:202
        Message.ClearHelpMessages() ; #DEBUG_LINE_NO:203
        Tutorial_StarbornPower01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:204
      EndIf ; #DEBUG_LINE_NO:
      If Self.GetStageDone(130) && !Self.GetStageDone(140) ; #DEBUG_LINE_NO:207
        If PlayerREF.GetEquippedSpell(2).HasKeyword(Artifact_Power) ; #DEBUG_LINE_NO:208
          Message.ClearHelpMessages() ; #DEBUG_LINE_NO:209
          Tutorial_StarbornPower04.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:210
          Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:211
        EndIf ; #DEBUG_LINE_NO:
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If asMenuName == "PowersMenu" ; #DEBUG_LINE_NO:217
    If abOpening ; #DEBUG_LINE_NO:218
      If !Self.GetStageDone(130) ; #DEBUG_LINE_NO:219
        Message.ClearHelpMessages() ; #DEBUG_LINE_NO:220
        Tutorial_StarbornPower03.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:221
        Self.RegisterForRemoteEvent(PlayerREF as ScriptObject, "OnItemEquipped") ; #DEBUG_LINE_NO:222
        Self.SetStage(120) ; #DEBUG_LINE_NO:223
      EndIf ; #DEBUG_LINE_NO:
    ElseIf !abOpening ; #DEBUG_LINE_NO:225
      If !Self.GetStageDone(130) ; #DEBUG_LINE_NO:226
        Message.ClearHelpMessages() ; #DEBUG_LINE_NO:227
        Tutorial_StarbornPower02.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:228
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If asMenuName == "MonocleMenu" ; #DEBUG_LINE_NO:234
    If PlayerREF.HasPerk(Skill_Diplomacy) || PlayerREF.HasPerk(Skill_Instigation) || PlayerREF.HasPerk(Skill_Intimidation) || PlayerREF.HasPerk(Skill_Manipulation) ; #DEBUG_LINE_NO:235
      If abOpening ; #DEBUG_LINE_NO:236
        Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:237
        If Game.UsingGamepad() ; #DEBUG_LINE_NO:238
          Tutorial_SocialSkills.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:239
        Else ; #DEBUG_LINE_NO:
          Tutorial_SocialSkills_PC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:241
        EndIf ; #DEBUG_LINE_NO:
        Self.UnRegisterForMenuOpenCloseEvent("MonocleMenu") ; #DEBUG_LINE_NO:243
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTutorialEvent(String asEventName, Message aMessage)
  If asEventName == "Dialogue_PersuasionStart" ; #DEBUG_LINE_NO:250
    Tutorial_SpeechMSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:251
    Self.UnregisterForTutorialEvent("Dialogue_PersuasionStart") ; #DEBUG_LINE_NO:252
  EndIf ; #DEBUG_LINE_NO:
  If asEventName == "ShipbuilderUpgradeModeEntered" ; #DEBUG_LINE_NO:255
    Tutorial_ShipBuilderUpgrade_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:256
    Self.UnregisterForTutorialEvent("ShipbuilderUpgradeModeEntered") ; #DEBUG_LINE_NO:257
  EndIf ; #DEBUG_LINE_NO:
  If asEventName == "ShipbuilderModifyModeEntered" ; #DEBUG_LINE_NO:260
    If Game.UsingGamepad() ; #DEBUG_LINE_NO:261
      Tutorial_ShipBuilderModify_MSGBox.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:262
    Else ; #DEBUG_LINE_NO:
      Tutorial_ShipBuilderModify_MSGBox_PC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:264
    EndIf ; #DEBUG_LINE_NO:
    Self.UnregisterForTutorialEvent("ShipbuilderModifyModeEntered") ; #DEBUG_LINE_NO:266
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ObjectReference.OnSpellCast(ObjectReference akSender, Form akSpell)
  If akSpell.HasKeyword(Artifact_Power) ; #DEBUG_LINE_NO:272
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:273
    Tutorial_StarbornPower04.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:274
    Self.UnRegisterForRemoteEvent(PlayerREF as ScriptObject, "OnItemEquipped") ; #DEBUG_LINE_NO:275
    Self.UnRegisterForRemoteEvent(PlayerREF as ScriptObject, "OnSpellCast") ; #DEBUG_LINE_NO:276
    Self.UnRegisterForMenuOpenCloseEvent("PowersMenu") ; #DEBUG_LINE_NO:277
    Self.UnRegisterForMenuOpenCloseEvent("DataMenu") ; #DEBUG_LINE_NO:278
    Self.SetStage(140) ; #DEBUG_LINE_NO:279
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnItemEquipped(Actor akSender, Form akBaseObject, ObjectReference akReference)
  Self.ProcessCompanionEMWeaponTutorial(akSender) ; #DEBUG_LINE_NO:284
  If akBaseObject.HasKeyword(Artifact_Power) ; #DEBUG_LINE_NO:285
    Tutorial_StarbornPower03.UnshowAsHelpMessage() ; #DEBUG_LINE_NO:286
    Self.SetStage(130) ; #DEBUG_LINE_NO:287
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, Bool abRemove)
  If akSender == Companion || akSender == EliteCrew ; #DEBUG_LINE_NO:292
    Self.ProcessCompanionEMWeaponTutorial(Game.GetPlayer()) ; #DEBUG_LINE_NO:293
  EndIf ; #DEBUG_LINE_NO:
  If akSender == PlayerShip ; #DEBUG_LINE_NO:296
    Self.ShipLowHealth() ; #DEBUG_LINE_NO:297
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ProcessCompanionEMWeaponTutorial(Actor akTriggeringActor)
  If !Self.GetStageDone(CompanionEMWeapon) && akTriggeringActor == Game.GetPlayer() && UC04_WeaponIsTypeEM.IsTrue(None, None) && (Companion.GetRef() != None || EliteCrew.GetRef() != None) ; #DEBUG_LINE_NO:303
    Self.UnRegisterForRemoteEvent(akTriggeringActor as ScriptObject, "OnItemEquipped") ; #DEBUG_LINE_NO:304
    Self.UnRegisterForRemoteEvent(Companion as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:305
    Self.UnRegisterForRemoteEvent(EliteCrew as ScriptObject, "OnAliasChanged") ; #DEBUG_LINE_NO:306
    Self.SetStage(CompanionEMWeapon) ; #DEBUG_LINE_NO:307
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function StartPowerTutorial()
  Tutorial_StarbornPower01.ShowAsHelpMessage("None", 0.0, 0.0, 0, "", 0, None) ; #DEBUG_LINE_NO:312
  Self.RegisterForMenuOpenCloseEvent("DataMenu") ; #DEBUG_LINE_NO:313
  Self.RegisterForMenuOpenCloseEvent("PowersMenu") ; #DEBUG_LINE_NO:314
EndFunction

Event Actor.OnPlayerFailedPlotRoute(Actor akSender, Int aeFailedPlotReason)
  Message.ClearHelpMessages() ; #DEBUG_LINE_NO:322
  Self.RegisterForMenuOpenCloseEvent("GalaxyStarMapMenu") ; #DEBUG_LINE_NO:323
  Self.RegisterForMenuOpenCloseEvent("BSMissionMenu") ; #DEBUG_LINE_NO:324
  If aeFailedPlotReason == 1 ; #DEBUG_LINE_NO:326
    Tutorial_FailedJump01.ShowAsHelpMessage("None", 30.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:328
  ElseIf aeFailedPlotReason == 2 ; #DEBUG_LINE_NO:329
    Tutorial_FailedJump02.ShowAsHelpMessage("None", 30.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:331
  ElseIf aeFailedPlotReason == 3 ; #DEBUG_LINE_NO:332
    Tutorial_FailedJump03.ShowAsHelpMessage("None", 30.0, 0.0, 1, "", 0, None) ; #DEBUG_LINE_NO:334
  EndIf ; #DEBUG_LINE_NO:
EndEvent
