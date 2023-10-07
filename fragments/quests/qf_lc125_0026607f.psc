ScriptName Fragments:Quests:QF_LC125_0026607F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BossAlias Auto Const mandatory
Scene Property LC125SpawnBossScene Auto Const
ReferenceAlias Property Alias_BossEnableMarker Auto Const mandatory
ReferenceAlias Property Alias_BossSupport01 Auto Const mandatory
ReferenceAlias Property Alias_BossSupport02 Auto Const mandatory
Scene Property LC125SpawnSopport01Scene Auto Const
Scene Property LC125SpawnSopport02Scene Auto Const
wwiseevent Property WWiseEvent_QST_LC125_BipedA_SkinC_SizeL Auto Const
ReferenceAlias Property Alias_BossRoarAudio Auto Const mandatory
RefCollectionAlias Property Alias_AllCreatures Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0015_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0010_Item_00()
  Alias_BossEnableMarker.getref().enable(False) ; #DEBUG_LINE_NO:7
  WWiseEvent_QST_LC125_BipedA_SkinC_SizeL.Play(Alias_BossRoarAudio.getref(), None, None) ; #DEBUG_LINE_NO:8
  Utility.wait(0.5) ; #DEBUG_LINE_NO:9
  Alias_BossAlias.getactorref().EvaluatePackage(False) ; #DEBUG_LINE_NO:10
  Alias_BossSupport02.getactorref().EvaluatePackage(False) ; #DEBUG_LINE_NO:11
  LC125SpawnBossScene.start() ; #DEBUG_LINE_NO:12
  LC125SpawnSopport02Scene.start() ; #DEBUG_LINE_NO:13
  Alias_BossAlias.getactorref().EvaluatePackage(False) ; #DEBUG_LINE_NO:14
  Alias_BossSupport02.getactorref().EvaluatePackage(False) ; #DEBUG_LINE_NO:15
EndFunction

Function Fragment_Stage_0012_Item_00()
  Alias_BossAlias.getactorref().EvaluatePackage(False) ; #DEBUG_LINE_NO:23
  Alias_BossAlias.getactorref().StartCombat(Game.GetPlayer() as ObjectReference, False) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_0014_Item_00()
  Alias_BossSupport02.getactorref().EvaluatePackage(False) ; #DEBUG_LINE_NO:32
EndFunction

Function Fragment_Stage_0040_Item_00()
  Alias_AllCreatures.DisableAll(False) ; #DEBUG_LINE_NO:48
EndFunction
