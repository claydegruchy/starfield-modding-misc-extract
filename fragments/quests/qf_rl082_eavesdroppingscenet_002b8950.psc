ScriptName Fragments:Quests:QF_RL082_EavesdroppingSceneT_002B8950 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_HavokObject Auto Const mandatory
Explosion Property OxygenTankExplosion01 Auto Const
Cell Property RL082TAWarehouse Auto Const
ReferenceAlias Property Alias_AirlockDoor01 Auto Const mandatory
ReferenceAlias Property Alias_AirlockDoor02 Auto Const mandatory
ReferenceAlias Property Alias_HavokObject01 Auto Const mandatory
Spell Property GEN_PointGravity_LG Auto Const
ReferenceAlias Property Alias_PointGravMarker Auto Const mandatory
Key Property RL082StorageKey Auto Const
ReferenceAlias Property Alias_DialgoueActor Auto Const mandatory
Scene Property RL082_EavesdroppingScene_Explosion02 Auto Const
ReferenceAlias Property Alias_BreachAudio Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0000_Item_00()
  Alias_DialgoueActor.getactorref().SetRestrained(True) ; #DEBUG_LINE_NO:7
  Alias_DialgoueActor.getactorref().SetValue(Game.GetHealthAV(), 5.0) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0005_Item_00()
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:16
  Alias_DialgoueActor.getactorref().RemoveItem(RL082StorageKey as Form, 1, False, None) ; #DEBUG_LINE_NO:17
  Game.getplayer().additem(RL082StorageKey as Form, 1, False) ; #DEBUG_LINE_NO:18
EndFunction

Function Fragment_Stage_0025_Item_00()
  RL082_EavesdroppingScene_Explosion02.Start() ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Stage_0027_Item_00()
  GEN_PointGravity_LG.Cast(Alias_PointGravMarker.getref(), None) ; #DEBUG_LINE_NO:34
  Alias_PointGravMarker.getref().PlaceAtMe(OxygenTankExplosion01 as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:36
  Game.ShakeCamera(None, 0.5, 0.0) ; #DEBUG_LINE_NO:37
  Alias_BreachAudio.getref().Enable(False) ; #DEBUG_LINE_NO:38
  Utility.wait(2.0) ; #DEBUG_LINE_NO:40
  RL082TAWarehouse.SetGravityScale(0.0) ; #DEBUG_LINE_NO:42
EndFunction

Function Fragment_Stage_0030_Item_00()
  Self.SetObjectiveCompleted(10, True) ; #DEBUG_LINE_NO:50
  Self.SetObjectiveDisplayed(20, True, False) ; #DEBUG_LINE_NO:51
  Alias_BreachAudio.getref().Disable(False) ; #DEBUG_LINE_NO:52
EndFunction

Function Fragment_Stage_0035_Item_00()
  Self.SetObjectiveCompleted(20, True) ; #DEBUG_LINE_NO:60
EndFunction

Function Fragment_Stage_0040_Item_00()
  Self.SetObjectiveFailed(10, True) ; #DEBUG_LINE_NO:68
  Self.SetObjectiveFailed(20, True) ; #DEBUG_LINE_NO:69
  Self.Stop() ; #DEBUG_LINE_NO:70
EndFunction
