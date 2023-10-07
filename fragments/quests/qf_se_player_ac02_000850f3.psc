ScriptName Fragments:Quests:QF_SE_Player_AC02_000850F3 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property HailTemplate_100a_Hailing Auto Const mandatory
ReferenceAlias Property Alias_HailingShip Auto Const mandatory
Scene Property MoaraPostHailScene Auto Const
ReferenceAlias Property Moara Auto Const
ReferenceAlias Property PlayerShip Auto Const
ReferenceAlias Property Alias_MapMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  HailTemplate_100a_Hailing.Start() ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Stage_0300_Item_00()
  Utility.wait(5.0) ; #DEBUG_LINE_NO:18
  spaceshipreference oTarg = Alias_HailingShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:19
  oTarg.DisableWithGravJump() ; #DEBUG_LINE_NO:20
  Alias_MapMarker.GetRef().DisableNoWait(False) ; #DEBUG_LINE_NO:22
  If Moara.GetActorRef().GetCurrentShipRef() as ObjectReference == PlayerShip.GetRef() ; #DEBUG_LINE_NO:24
    Self.SetStage(400) ; #DEBUG_LINE_NO:25
  Else ; #DEBUG_LINE_NO:
    Self.SetStage(1000) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0400_Item_00()
  MoaraPostHailScene.Start() ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_1000_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:44
EndFunction
