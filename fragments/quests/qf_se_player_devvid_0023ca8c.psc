ScriptName Fragments:Quests:QF_SE_Player_DevVid_0023CA8C Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_Ship01 Auto Const mandatory
ReferenceAlias Property Alias_Ship02 Auto Const mandatory
ReferenceAlias Property Alias_Ship03 Auto Const mandatory
ReferenceAlias Property Alias_Ship04 Auto Const mandatory
ReferenceAlias Property Alias_Ship05 Auto Const mandatory
ReferenceAlias Property Alias_Ship06 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0020_Item_00()
  spaceshipreference Ship01 = Alias_Ship01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:7
  spaceshipreference Ship02 = Alias_Ship02.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:8
  spaceshipreference Ship03 = Alias_Ship03.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:9
  Utility.wait(7.0) ; #DEBUG_LINE_NO:11
  Ship01.EnableWithGravJump() ; #DEBUG_LINE_NO:12
  Utility.wait(1.0) ; #DEBUG_LINE_NO:13
  Ship02.EnableWithGravJump() ; #DEBUG_LINE_NO:14
  Utility.wait(1.0) ; #DEBUG_LINE_NO:15
  Ship03.EnableWithGravJump() ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0030_Item_00()
  spaceshipreference Ship04 = Alias_Ship04.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:24
  spaceshipreference Ship05 = Alias_Ship05.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:25
  spaceshipreference Ship06 = Alias_Ship06.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:26
  Utility.wait(1.0) ; #DEBUG_LINE_NO:28
  Ship04.EnableWithGravJump() ; #DEBUG_LINE_NO:29
  Utility.wait(1.0) ; #DEBUG_LINE_NO:30
  Ship05.EnableWithGravJump() ; #DEBUG_LINE_NO:31
  Utility.wait(1.0) ; #DEBUG_LINE_NO:32
  Ship06.EnableWithGravJump() ; #DEBUG_LINE_NO:33
EndFunction
