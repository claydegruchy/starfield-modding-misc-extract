ScriptName Fragments:Quests:QF_SE_Player_AC04_00063A7F Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property MoaraPostHailScene Auto Const
GlobalVariable Property JokeCountGlobal Auto Const
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:18
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:19
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:20
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:21
  JokeCountGlobal.Mod(1.0) ; #DEBUG_LINE_NO:23
  Self.SetStage(1000) ; #DEBUG_LINE_NO:24
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:32
EndFunction
