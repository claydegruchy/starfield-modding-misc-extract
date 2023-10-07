ScriptName Fragments:Quests:QF_MQ305_0024EF9C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Emissary Auto Const mandatory
ObjectReference Property UnityMovetoMarker Auto Const mandatory
ReferenceAlias Property Alias_Andreja Auto Const mandatory
ReferenceAlias Property Alias_Barrett Auto Const mandatory
ReferenceAlias Property Alias_SamCoe Auto Const mandatory
ReferenceAlias Property Alias_SarahMorgan Auto Const mandatory
Message Property MQ305_MSG_Romance Auto Const mandatory
ActorValue Property COM_IsRomantic Auto Const mandatory
Message Property MQ305_MSG_CF Auto Const mandatory
GlobalVariable Property MQ305_CF_SysDefEnding Auto Const mandatory
GlobalVariable Property MQ305_CF_PirateEnding Auto Const mandatory
Message Property MQ305_MSG_FSC Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeBribeAccepted Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeJailed Auto Const mandatory
GlobalVariable Property MQ305_FSC_RonHopeKilled Auto Const mandatory
Message Property MQ305_MSG_RI Auto Const mandatory
GlobalVariable Property MQ305_RI_NeuroampNotPromoted Auto Const mandatory
GlobalVariable Property MQ305_RI_NeuroampPromoted Auto Const mandatory
Message Property MQ305_MSG_UC Auto Const mandatory
GlobalVariable Property MQ305_UC_AcelesEnding Auto Const mandatory
GlobalVariable Property MQ305_UC_PlagueEnding Auto Const mandatory
Quest Property MQ206C Auto Const mandatory
Message Property MQ305JumpToUnityMSG Auto Const mandatory
ReferenceAlias Property Alias_CoraCoe Auto Const mandatory
GlobalVariable Property MQ101Debug Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
Quest Property MQ102 Auto Const mandatory
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const
VoiceType Property NPCFSarahMorgan Auto Const mandatory
VoiceType Property NPCMSamCoe Auto Const mandatory
VoiceType Property NPCFAndreja Auto Const mandatory
VoiceType Property NPCMBarrett Auto Const mandatory
Message Property TestMQ206AMSG Auto Const mandatory
ObjectReference Property LodgeStartMarker Auto Const mandatory
ObjectReference Property TestMQ303Marker01 Auto Const mandatory
ObjectReference Property MQ303_StarbornHunterMarker01 Auto Const mandatory
ReferenceAlias Property Alias_HunterShip Auto Const mandatory
ReferenceAlias Property Alias_EmissaryShip Auto Const mandatory
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Quest Property MQ304_PostQuestDialogue Auto Const mandatory
Quest Property MQ303 Auto Const mandatory
Faction Property AvailableCompanionFaction Auto Const mandatory
GlobalVariable Property COM_SamCoeRecruited Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ObjectReference Property MQ303EmissaryMarker01 Auto Const mandatory
MiscObject Property Mfg_Structural_Frame Auto Const mandatory
LeveledItem Property MQAllArtifacts Auto Const mandatory
Scene Property MQ305_002_Unity_01 Auto Const mandatory
Scene Property MQ305_002_Unity_04 Auto Const mandatory
Message Property MQ305_MSG_Starborn Auto Const mandatory
GlobalVariable Property MQ302_SidedWithChoice Auto Const mandatory
Scene Property MQ305_Unity_01b Auto Const mandatory
ReferenceAlias Property Alias_UnityChair Auto Const mandatory
ReferenceAlias Property Alias_UnityDoor Auto Const mandatory
ObjectReference Property ScorpiusOborumMarker Auto Const mandatory
ObjectReference Property HelixOborumMarker Auto Const mandatory
ObjectReference Property MQ207_EmissaryMarker01 Auto Const mandatory
ObjectReference Property MQ207_HunterMarker01 Auto Const mandatory
Faction Property EyeBoardingFaction Auto Const mandatory
RefCollectionAlias Property MQ00_ArtifactsHolder Auto Const
Message Property MQ305ReturnFromUnityMSG Auto Const mandatory
Quest Property SQ_ENV Auto Const mandatory
GlobalVariable Property MQAlllowArmillaryGravDrive Auto Const mandatory
ReferenceAlias Property Alias_PlayerShipArmillary Auto Const mandatory
GlobalVariable Property MQ305_UC_SterilizationEnding Auto Const mandatory
ObjectReference Property MQ305InitialCollisionEnableMarker Auto Const mandatory
Scene Property MQ305_002_Unity_05 Auto Const mandatory
Scene Property MQ305_002_Unity_06 Auto Const mandatory
ObjectReference Property Frontier_ModularREF Auto Const mandatory
ObjectReference Property NewAtlantisShipLandingMarker Auto Const mandatory
Keyword Property SpaceshipEnabledLandingLink Auto Const mandatory
Quest Property SQ_PlayerShip Auto Const mandatory
GlobalVariable Property MQ_CompanionDead Auto Const mandatory
GlobalVariable Property COM_CompanionID_Andreja Auto Const mandatory
GlobalVariable Property COM_CompanionID_Barrett Auto Const mandatory
GlobalVariable Property COM_CompanionID_SamCoe Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
Quest Property MQ304b Auto Const mandatory
GlobalVariable Property MQ401_SkipMQ Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:7
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:8
  MQ101.SetStage(1810) ; #DEBUG_LINE_NO:9
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:10
  Frontier_ModularREF.moveto(NewAtlantisShipLandingMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:13
  Frontier_ModularREF.setlinkedref(NewAtlantisShipLandingMarker, SpaceshipEnabledLandingLink, True) ; #DEBUG_LINE_NO:14
  Frontier_ModularREF.Enable(False) ; #DEBUG_LINE_NO:15
  (SQ_PlayerShip as sq_playershipscript).ResetHomeShip(Frontier_ModularREF as spaceshipreference) ; #DEBUG_LINE_NO:16
  Game.GetPlayer().addITem(Mfg_Structural_Frame as Form, 12, False) ; #DEBUG_LINE_NO:20
  Game.GetPlayer().addITem(MQAllArtifacts as Form, 1, False) ; #DEBUG_LINE_NO:21
  Game.GetPlayer().addtoFaction(EyeBoardingFaction) ; #DEBUG_LINE_NO:23
  Int iRomance = MQ305_MSG_Romance.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:25
  If iRomance == 0 ; #DEBUG_LINE_NO:26
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:27
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:28
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:29
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:30
  ElseIf iRomance == 1 ; #DEBUG_LINE_NO:31
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:32
  ElseIf iRomance == 2 ; #DEBUG_LINE_NO:33
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:34
  ElseIf iRomance == 3 ; #DEBUG_LINE_NO:35
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:36
  ElseIf iRomance == 4 ; #DEBUG_LINE_NO:37
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:40
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:42
  If ButtonPressed == 0 ; #DEBUG_LINE_NO:43
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:44
    Alias_SarahMorgan.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:45
    Alias_SarahMorgan.GetActorRef().disable(False) ; #DEBUG_LINE_NO:46
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFSarahMorgan) ; #DEBUG_LINE_NO:47
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) ; #DEBUG_LINE_NO:48
  ElseIf ButtonPressed == 1 ; #DEBUG_LINE_NO:49
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:50
    Alias_SamCoe.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:51
    Alias_SamCoe.GetActorRef().disable(False) ; #DEBUG_LINE_NO:52
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMSamCoe) ; #DEBUG_LINE_NO:53
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) ; #DEBUG_LINE_NO:54
  ElseIf ButtonPressed == 2 ; #DEBUG_LINE_NO:55
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:56
    Alias_Andreja.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:57
    Alias_Andreja.GetActorRef().disable(False) ; #DEBUG_LINE_NO:58
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFAndreja) ; #DEBUG_LINE_NO:59
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt()) ; #DEBUG_LINE_NO:60
  ElseIf ButtonPressed == 3 ; #DEBUG_LINE_NO:61
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:62
    Alias_Barrett.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:63
    Alias_Barrett.GetActorRef().disable(False) ; #DEBUG_LINE_NO:64
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMBarrett) ; #DEBUG_LINE_NO:65
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) ; #DEBUG_LINE_NO:66
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:68
  Int iCFEnding = MQ305_MSG_CF.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:70
  If iCFEnding == 0 ; #DEBUG_LINE_NO:71
    MQ305_CF_SysDefEnding.SetValueInt(1) ; #DEBUG_LINE_NO:72
  ElseIf iCFEnding == 1 ; #DEBUG_LINE_NO:73
    MQ305_CF_PirateEnding.SetValueInt(1) ; #DEBUG_LINE_NO:74
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:76
  Int iFSCEnding = MQ305_MSG_FSC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:78
  If iFSCEnding == 0 ; #DEBUG_LINE_NO:79
    MQ305_FSC_RonHopeKilled.SetValueInt(1) ; #DEBUG_LINE_NO:80
  ElseIf iFSCEnding == 1 ; #DEBUG_LINE_NO:81
    MQ305_FSC_RonHopeBribeAccepted.SetValueInt(1) ; #DEBUG_LINE_NO:82
  ElseIf iFSCEnding == 2 ; #DEBUG_LINE_NO:83
    MQ305_FSC_RonHopeJailed.SetValueInt(1) ; #DEBUG_LINE_NO:84
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:86
  Int iRIEnding = MQ305_MSG_RI.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:88
  If iRIEnding == 0 ; #DEBUG_LINE_NO:89
    MQ305_RI_NeuroampPromoted.SetValueInt(1) ; #DEBUG_LINE_NO:90
  ElseIf iRIEnding == 1 ; #DEBUG_LINE_NO:91
    MQ305_RI_NeuroampNotPromoted.SetValueInt(1) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:94
  Int iUCEnding = MQ305_MSG_UC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:96
  If iUCEnding == 0 ; #DEBUG_LINE_NO:97
    MQ305_UC_PlagueEnding.SetValueInt(1) ; #DEBUG_LINE_NO:98
  ElseIf iUCEnding == 1 ; #DEBUG_LINE_NO:99
    MQ305_UC_AcelesEnding.SetValueInt(1) ; #DEBUG_LINE_NO:100
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:103
  Int iStarbornEnding = MQ305_MSG_Starborn.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:104
  If iStarbornEnding == 0 ; #DEBUG_LINE_NO:105
    MQ302_SidedWithChoice.SetValueInt(0) ; #DEBUG_LINE_NO:106
  ElseIf iStarbornEnding == 1 ; #DEBUG_LINE_NO:107
    MQ302_SidedWithChoice.SetValueInt(1) ; #DEBUG_LINE_NO:108
  ElseIf iStarbornEnding == 2 ; #DEBUG_LINE_NO:109
    MQ302_SidedWithChoice.SetValueInt(2) ; #DEBUG_LINE_NO:110
  EndIf ; #DEBUG_LINE_NO:
  Alias_SamCoe.GetActorRef().addtoFaction(AvailableCompanionFaction) ; #DEBUG_LINE_NO:114
  Alias_Andreja.GetActorRef().addtoFaction(AvailableCompanionFaction) ; #DEBUG_LINE_NO:115
  COM_SamCoeRecruited.SetValue(1.0) ; #DEBUG_LINE_NO:116
  Alias_Barrett.GetActorRef().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:118
  Alias_EmissaryShip.GetRef().Enable(False) ; #DEBUG_LINE_NO:120
  Alias_HunterShip.GetRef().Enable(False) ; #DEBUG_LINE_NO:121
  Alias_Emissary.GetActorRef().moveto(MQ303EmissaryMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:124
  Alias_Hunter.GetActorRef().moveto(MQ303_StarbornHunterMarker01, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:125
  MQ206C.SetStage(1000) ; #DEBUG_LINE_NO:127
  Self.SetStage(10) ; #DEBUG_LINE_NO:128
  MQ304_PostQuestDialogue.Start() ; #DEBUG_LINE_NO:130
  MQ303.SetStage(210) ; #DEBUG_LINE_NO:131
  Game.ShowRaceMenu(None, 0, None, None, None) ; #DEBUG_LINE_NO:133
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:135
  Game.GetPlayer().moveto(LodgeStartMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:137
EndFunction

Function Fragment_Stage_0001_Item_00()
  Int iRomance = MQ305_MSG_Romance.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:149
  If iRomance == 0 ; #DEBUG_LINE_NO:150
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:151
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:152
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:153
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:154
  ElseIf iRomance == 1 ; #DEBUG_LINE_NO:155
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:156
  ElseIf iRomance == 2 ; #DEBUG_LINE_NO:157
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:158
  ElseIf iRomance == 3 ; #DEBUG_LINE_NO:159
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:160
  ElseIf iRomance == 4 ; #DEBUG_LINE_NO:161
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:164
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:166
  If ButtonPressed == 0 ; #DEBUG_LINE_NO:167
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:168
    Alias_SarahMorgan.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:169
    Alias_SarahMorgan.GetActorRef().disable(False) ; #DEBUG_LINE_NO:170
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFSarahMorgan) ; #DEBUG_LINE_NO:171
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) ; #DEBUG_LINE_NO:172
  ElseIf ButtonPressed == 1 ; #DEBUG_LINE_NO:173
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:174
    Alias_SamCoe.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:175
    Alias_SamCoe.GetActorRef().disable(False) ; #DEBUG_LINE_NO:176
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMSamCoe) ; #DEBUG_LINE_NO:177
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) ; #DEBUG_LINE_NO:178
  ElseIf ButtonPressed == 2 ; #DEBUG_LINE_NO:179
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:180
    Alias_Andreja.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:181
    Alias_Andreja.GetActorRef().disable(False) ; #DEBUG_LINE_NO:182
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFAndreja) ; #DEBUG_LINE_NO:183
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt()) ; #DEBUG_LINE_NO:184
  ElseIf ButtonPressed == 3 ; #DEBUG_LINE_NO:185
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:186
    Alias_Barrett.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:187
    Alias_Barrett.GetActorRef().disable(False) ; #DEBUG_LINE_NO:188
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMBarrett) ; #DEBUG_LINE_NO:189
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) ; #DEBUG_LINE_NO:190
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:192
  Int iCFEnding = MQ305_MSG_CF.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:194
  If iCFEnding == 0 ; #DEBUG_LINE_NO:195
    MQ305_CF_SysDefEnding.SetValueInt(1) ; #DEBUG_LINE_NO:196
  ElseIf iCFEnding == 1 ; #DEBUG_LINE_NO:197
    MQ305_CF_PirateEnding.SetValueInt(1) ; #DEBUG_LINE_NO:198
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:200
  Int iFSCEnding = MQ305_MSG_FSC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:202
  If iFSCEnding == 0 ; #DEBUG_LINE_NO:203
    MQ305_FSC_RonHopeKilled.SetValueInt(1) ; #DEBUG_LINE_NO:204
  ElseIf iFSCEnding == 1 ; #DEBUG_LINE_NO:205
    MQ305_FSC_RonHopeBribeAccepted.SetValueInt(1) ; #DEBUG_LINE_NO:206
  ElseIf iFSCEnding == 2 ; #DEBUG_LINE_NO:207
    MQ305_FSC_RonHopeJailed.SetValueInt(1) ; #DEBUG_LINE_NO:208
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:210
  Int iRIEnding = MQ305_MSG_RI.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:212
  If iRIEnding == 0 ; #DEBUG_LINE_NO:213
    MQ305_RI_NeuroampPromoted.SetValueInt(1) ; #DEBUG_LINE_NO:214
  ElseIf iRIEnding == 1 ; #DEBUG_LINE_NO:215
    MQ305_RI_NeuroampNotPromoted.SetValueInt(1) ; #DEBUG_LINE_NO:216
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:218
  Int iUCEnding = MQ305_MSG_UC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:220
  If iUCEnding == 0 ; #DEBUG_LINE_NO:221
    MQ305_UC_PlagueEnding.SetValueInt(1) ; #DEBUG_LINE_NO:222
  ElseIf iUCEnding == 1 ; #DEBUG_LINE_NO:223
    MQ305_UC_AcelesEnding.SetValueInt(1) ; #DEBUG_LINE_NO:224
  ElseIf iUCEnding == 2 ; #DEBUG_LINE_NO:225
    MQ305_UC_SterilizationEnding.SetValueInt(1) ; #DEBUG_LINE_NO:226
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:229
  Int iStarbornEnding = MQ305_MSG_Starborn.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:230
  If iStarbornEnding == 0 ; #DEBUG_LINE_NO:231
    MQ302_SidedWithChoice.SetValueInt(0) ; #DEBUG_LINE_NO:232
  ElseIf iStarbornEnding == 1 ; #DEBUG_LINE_NO:233
    MQ302_SidedWithChoice.SetValueInt(1) ; #DEBUG_LINE_NO:234
  ElseIf iStarbornEnding == 2 ; #DEBUG_LINE_NO:235
    MQ302_SidedWithChoice.SetValueInt(2) ; #DEBUG_LINE_NO:236
  EndIf ; #DEBUG_LINE_NO:
  Game.ShowRaceMenu(None, 0, None, None, None) ; #DEBUG_LINE_NO:239
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:241
  Game.GetPlayer().moveto(UnityMovetoMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:243
  (SQ_ENV as sq_env_afflictionsscript).CureAllAfflictions() ; #DEBUG_LINE_NO:245
  Game.GetPlayer().ResetHealthAndLimbs() ; #DEBUG_LINE_NO:246
  Self.SetStage(100) ; #DEBUG_LINE_NO:248
EndFunction

Function Fragment_Stage_0002_Item_00()
  MQ101Debug.SetValueInt(2) ; #DEBUG_LINE_NO:256
  MQ101.SetStage(1800) ; #DEBUG_LINE_NO:257
  MQ102.CompleteQuest() ; #DEBUG_LINE_NO:258
  Int iRomance = MQ305_MSG_Romance.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:260
  If iRomance == 0 ; #DEBUG_LINE_NO:261
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:262
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:263
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:264
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:265
  ElseIf iRomance == 1 ; #DEBUG_LINE_NO:266
    Alias_SarahMorgan.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:267
  ElseIf iRomance == 2 ; #DEBUG_LINE_NO:268
    Alias_SamCoe.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:269
  ElseIf iRomance == 3 ; #DEBUG_LINE_NO:270
    Alias_Andreja.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:271
  ElseIf iRomance == 4 ; #DEBUG_LINE_NO:272
    Alias_Barrett.GetActorRef().SetValue(COM_IsRomantic, 1.0) ; #DEBUG_LINE_NO:273
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:275
  Int ButtonPressed = TestMQ206AMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:277
  If ButtonPressed == 0 ; #DEBUG_LINE_NO:278
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SarahMorgan.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:279
    Alias_SarahMorgan.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:280
    Alias_SarahMorgan.GetActorRef().disable(False) ; #DEBUG_LINE_NO:281
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFSarahMorgan) ; #DEBUG_LINE_NO:282
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SarahMorgan.GetValueInt()) ; #DEBUG_LINE_NO:283
  ElseIf ButtonPressed == 1 ; #DEBUG_LINE_NO:284
    MQ00_CompanionWhoDies.ForceRefTo(Alias_SamCoe.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:285
    Alias_SamCoe.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:286
    Alias_SamCoe.GetActorRef().disable(False) ; #DEBUG_LINE_NO:287
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMSamCoe) ; #DEBUG_LINE_NO:288
    MQ_CompanionDead.SetValueInt(COM_CompanionID_SamCoe.GetValueInt()) ; #DEBUG_LINE_NO:289
  ElseIf ButtonPressed == 2 ; #DEBUG_LINE_NO:290
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Andreja.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:291
    Alias_Andreja.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:292
    Alias_Andreja.GetActorRef().disable(False) ; #DEBUG_LINE_NO:293
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCFAndreja) ; #DEBUG_LINE_NO:294
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Andreja.GetValueInt()) ; #DEBUG_LINE_NO:295
  ElseIf ButtonPressed == 3 ; #DEBUG_LINE_NO:296
    MQ00_CompanionWhoDies.ForceRefTo(Alias_Barrett.GetActorRef() as ObjectReference) ; #DEBUG_LINE_NO:297
    Alias_Barrett.GetActorRef().KillEssential(None) ; #DEBUG_LINE_NO:298
    Alias_Barrett.GetActorRef().disable(False) ; #DEBUG_LINE_NO:299
    Alias_Emissary.GetActorRef().SetOverrideVoicetype(NPCMBarrett) ; #DEBUG_LINE_NO:300
    MQ_CompanionDead.SetValueInt(COM_CompanionID_Barrett.GetValueInt()) ; #DEBUG_LINE_NO:301
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:303
  Int iCFEnding = MQ305_MSG_CF.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:305
  If iCFEnding == 0 ; #DEBUG_LINE_NO:306
    MQ305_CF_SysDefEnding.SetValueInt(1) ; #DEBUG_LINE_NO:307
  ElseIf iCFEnding == 1 ; #DEBUG_LINE_NO:308
    MQ305_CF_PirateEnding.SetValueInt(1) ; #DEBUG_LINE_NO:309
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:311
  Int iFSCEnding = MQ305_MSG_FSC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:313
  If iFSCEnding == 0 ; #DEBUG_LINE_NO:314
    MQ305_FSC_RonHopeKilled.SetValueInt(1) ; #DEBUG_LINE_NO:315
  ElseIf iFSCEnding == 1 ; #DEBUG_LINE_NO:316
    MQ305_FSC_RonHopeBribeAccepted.SetValueInt(1) ; #DEBUG_LINE_NO:317
  ElseIf iFSCEnding == 2 ; #DEBUG_LINE_NO:318
    MQ305_FSC_RonHopeJailed.SetValueInt(1) ; #DEBUG_LINE_NO:319
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:321
  Int iRIEnding = MQ305_MSG_RI.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:323
  If iRIEnding == 0 ; #DEBUG_LINE_NO:324
    MQ305_RI_NeuroampPromoted.SetValueInt(1) ; #DEBUG_LINE_NO:325
  ElseIf iRIEnding == 1 ; #DEBUG_LINE_NO:326
    MQ305_RI_NeuroampNotPromoted.SetValueInt(1) ; #DEBUG_LINE_NO:327
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:329
  Int iUCEnding = MQ305_MSG_UC.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:331
  If iUCEnding == 0 ; #DEBUG_LINE_NO:332
    MQ305_UC_PlagueEnding.SetValueInt(1) ; #DEBUG_LINE_NO:333
  ElseIf iUCEnding == 1 ; #DEBUG_LINE_NO:334
    MQ305_UC_AcelesEnding.SetValueInt(1) ; #DEBUG_LINE_NO:335
  EndIf ; #DEBUG_LINE_NO:
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:338
  Int iStarbornEnding = MQ305_MSG_Starborn.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:339
  If iStarbornEnding == 0 ; #DEBUG_LINE_NO:340
    MQ302_SidedWithChoice.SetValueInt(0) ; #DEBUG_LINE_NO:341
  ElseIf iStarbornEnding == 1 ; #DEBUG_LINE_NO:342
    MQ302_SidedWithChoice.SetValueInt(1) ; #DEBUG_LINE_NO:343
  ElseIf iStarbornEnding == 2 ; #DEBUG_LINE_NO:344
    MQ302_SidedWithChoice.SetValueInt(2) ; #DEBUG_LINE_NO:345
  EndIf ; #DEBUG_LINE_NO:
  Game.ShowRaceMenu(None, 0, None, None, None) ; #DEBUG_LINE_NO:348
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:349
  Game.GetPlayer().moveto(UnityMovetoMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:351
  Game.SetCharGenHUDMode(1) ; #DEBUG_LINE_NO:352
  Self.SetStage(200) ; #DEBUG_LINE_NO:353
EndFunction

Function Fragment_Stage_0003_Item_00()
  Game.GetPlayer().moveto(UnityMovetoMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:361
EndFunction

Function Fragment_Stage_0010_Item_00()
  MQAlllowArmillaryGravDrive.SetValueInt(1) ; #DEBUG_LINE_NO:370
  Self.SetObjectiveDisplayed(30, True, False) ; #DEBUG_LINE_NO:372
  Self.SetObjectiveDisplayedAtTop(30) ; #DEBUG_LINE_NO:373
  If MQ401_SkipMQ.GetValueInt() == 0 ; #DEBUG_LINE_NO:375
    Self.SetObjectiveDisplayed(50, True, False) ; #DEBUG_LINE_NO:376
  EndIf ; #DEBUG_LINE_NO:
  Self.SetActive(True) ; #DEBUG_LINE_NO:379
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetStage(40) ; #DEBUG_LINE_NO:387
EndFunction

Function Fragment_Stage_0040_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:395
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:396
  spaceshipreference PlayerShipREF = Alias_PlayerShip.GetShipRef() ; #DEBUG_LINE_NO:399
  PlayerShipREF.LockPowerAllocation(3, -1, True) ; #DEBUG_LINE_NO:403
  PlayerShipREF.SetPartPower(3, -1, 0) ; #DEBUG_LINE_NO:404
  MQ305JumpToUnityMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:406
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:408
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:410
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:411
  Self.SetObjectiveDisplayed(60, True, False) ; #DEBUG_LINE_NO:412
  Self.SetObjectiveDisplayedAtTop(60) ; #DEBUG_LINE_NO:413
  Self.SetObjectiveDisplayed(70, True, False) ; #DEBUG_LINE_NO:414
  kmyQuest.UpdateFriendTalkCount() ; #DEBUG_LINE_NO:416
EndFunction

Function Fragment_Stage_0050_Item_00()
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:424
EndFunction

Function Fragment_Stage_0051_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:432
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:433
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:436
EndFunction

Function Fragment_Stage_0053_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:444
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:445
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:448
EndFunction

Function Fragment_Stage_0054_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:456
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:457
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:460
EndFunction

Function Fragment_Stage_0055_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:468
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:469
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:472
EndFunction

Function Fragment_Stage_0056_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:480
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:481
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:484
EndFunction

Function Fragment_Stage_0057_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:492
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:493
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:496
EndFunction

Function Fragment_Stage_0058_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:504
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:505
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:508
EndFunction

Function Fragment_Stage_0059_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:516
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:517
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:520
EndFunction

Function Fragment_Stage_0060_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:528
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:529
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:532
EndFunction

Function Fragment_Stage_0061_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:540
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:541
  kmyQuest.CheckFriendUnityTalks() ; #DEBUG_LINE_NO:544
EndFunction

Function Fragment_Stage_0100_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:552
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:553
  kmyQuest.LockPlayerControlsUnity() ; #DEBUG_LINE_NO:556
  Self.SetObjectiveCompleted(30, True) ; #DEBUG_LINE_NO:558
  Self.SetObjectiveCompleted(40, True) ; #DEBUG_LINE_NO:559
  Self.SetObjectiveCompleted(50, True) ; #DEBUG_LINE_NO:560
  Self.SetObjectiveCompleted(60, True) ; #DEBUG_LINE_NO:561
  Self.SetObjectiveCompleted(70, True) ; #DEBUG_LINE_NO:562
  Self.SetObjectiveCompleted(80, True) ; #DEBUG_LINE_NO:563
  If Alias_SamCoe.GetActorRef().IsDead() ; #DEBUG_LINE_NO:566
    Alias_CoraCoe.GetActorRef().disable(False) ; #DEBUG_LINE_NO:567
  EndIf ; #DEBUG_LINE_NO:
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:571
  If !HunterREF.IsDead() ; #DEBUG_LINE_NO:572
    HunterREF.disable(False) ; #DEBUG_LINE_NO:573
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0110_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:582
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:583
  kmyQuest.CheckMultipleRomance() ; #DEBUG_LINE_NO:586
  MQ305_002_Unity_01.Start() ; #DEBUG_LINE_NO:587
EndFunction

Function Fragment_Stage_0200_Item_00()
  MQ305InitialCollisionEnableMarker.DisableNoWait(False) ; #DEBUG_LINE_NO:595
  MQ305_002_Unity_04.Start() ; #DEBUG_LINE_NO:597
EndFunction

Function Fragment_Stage_0205_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:605
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:606
  kmyQuest.EnableUnityEndScenes() ; #DEBUG_LINE_NO:609
EndFunction

Function Fragment_Stage_0207_Item_00()
  MQ305_002_Unity_06.Start() ; #DEBUG_LINE_NO:617
EndFunction

Function Fragment_Stage_0300_Item_00()
  MQ305ReturnFromUnityMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:625
  Self.SetObjectiveCompleted(90, True) ; #DEBUG_LINE_NO:627
  Self.SetObjectiveDisplayed(120, True, False) ; #DEBUG_LINE_NO:628
  Self.SetObjectiveDisplayedAtTop(120) ; #DEBUG_LINE_NO:629
  If MQ304b.IsRunning() ; #DEBUG_LINE_NO:632
    If MQ304b.GetStageDone(10) ; #DEBUG_LINE_NO:633
      MQ304b.SetStage(1300) ; #DEBUG_LINE_NO:634
    Else ; #DEBUG_LINE_NO:
      MQ304b.Stop() ; #DEBUG_LINE_NO:636
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_1000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:646
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:647
  MQ305_002_Unity_04.Stop() ; #DEBUG_LINE_NO:650
  MQ305_002_Unity_05.Start() ; #DEBUG_LINE_NO:651
EndFunction

Function Fragment_Stage_2000_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:659
  mq305script kmyQuest = __temp as mq305script ; #DEBUG_LINE_NO:660
  Game.AddAchievement(10) ; #DEBUG_LINE_NO:664
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:666
  kmyQuest.EnterUnity() ; #DEBUG_LINE_NO:667
EndFunction
