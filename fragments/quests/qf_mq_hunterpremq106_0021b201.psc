ScriptName Fragments:Quests:QF_MQ_HunterPreMQ106_0021B201 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Hunter Auto Const mandatory
Explosion Property LC165_ScriptedTeleportSourceExplosion Auto Const mandatory
ObjectReference Property MQHoldingCellCenterMarker Auto Const mandatory
ObjectReference Property PreMQ106_NA_HunterMarker Auto Const mandatory
ObjectReference Property PreMQ106_Akila_HunterMarker Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:9
  HunterREF.Disable(False) ; #DEBUG_LINE_NO:10
  HunterREF.moveto(PreMQ106_NA_HunterMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:11
  HunterREF.Enable(False) ; #DEBUG_LINE_NO:12
EndFunction

Function Fragment_Stage_0125_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:21
  HunterREF.Disable(False) ; #DEBUG_LINE_NO:23
  HunterREF.moveto(PreMQ106_Akila_HunterMarker, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:24
  HunterREF.Enable(False) ; #DEBUG_LINE_NO:25
EndFunction

Function Fragment_Stage_0225_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:33
  HunterREF.Disable(False) ; #DEBUG_LINE_NO:34
  Self.Stop() ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0700_Item_00()
  Self.Stop() ; #DEBUG_LINE_NO:45
EndFunction

Function Fragment_Stage_1000_Item_00()
  Actor HunterREF = Alias_Hunter.GetActorRef() ; #DEBUG_LINE_NO:53
  HunterREF.Disable(False) ; #DEBUG_LINE_NO:54
  Self.Stop() ; #DEBUG_LINE_NO:56
EndFunction
