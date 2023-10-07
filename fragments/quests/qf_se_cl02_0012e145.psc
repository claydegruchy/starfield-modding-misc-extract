ScriptName Fragments:Quests:QF_SE_CL02_0012E145 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property bagMan Auto Const
Scene Property bagMan_Hail Auto Const
spaceshipreference Property Alias_bagMan Auto Const
ReferenceAlias Property Alias_Player Auto Const
ReferenceAlias Property Alias_Beacon Auto Const mandatory
Message Property SE_CL02Message Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0050_Item_00()
  ; Empty function ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  SE_CL02Message.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:12
  Alias_Beacon.GetRef().BlockActivation(True, False) ; #DEBUG_LINE_NO:15
  Utility.wait(4.0) ; #DEBUG_LINE_NO:17
  bagMan.GetShipRef().EnableWithGravJump() ; #DEBUG_LINE_NO:19
  If bagMan.GetShipRef().WaitFor3DLoad() ; #DEBUG_LINE_NO:21
    bagMan.GetShipRef().EvaluatePackage(False) ; #DEBUG_LINE_NO:22
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0030_Item_00()
  Utility.wait(1.299999952) ; #DEBUG_LINE_NO:35
  bagMan_Hail.Start() ; #DEBUG_LINE_NO:36
EndFunction

Function Fragment_Stage_0040_Item_00()
  Utility.wait(4.0) ; #DEBUG_LINE_NO:46
  bagMan.GetShipRef().DisableWithGravJump() ; #DEBUG_LINE_NO:47
EndFunction

Function Fragment_Stage_0060_Item_00()
  bagMan.GetShipRef().StartCombat(Alias_Player.GetShipRef(), False) ; #DEBUG_LINE_NO:68
EndFunction
