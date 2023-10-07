ScriptName Fragments:Quests:QF_SE_Player_Bountyships_UC_000C3834 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_BountyShip01 Auto Const mandatory
ReferenceAlias Property Alias_BountyShip02 Auto Const mandatory
ReferenceAlias Property Alias_BountyShip03 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Utility.wait(7.0) ; #DEBUG_LINE_NO:7
  spaceshipreference myship01 = Alias_BountyShip01.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:8
  myship01.enablewithgravjump() ; #DEBUG_LINE_NO:9
  Utility.wait(1.0) ; #DEBUG_LINE_NO:10
  spaceshipreference myship02 = Alias_BountyShip02.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:11
  myship02.enablewithgravjump() ; #DEBUG_LINE_NO:12
  Utility.wait(0.300000012) ; #DEBUG_LINE_NO:13
  spaceshipreference myship03 = Alias_BountyShip03.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:14
  myship03.enablewithgravjump() ; #DEBUG_LINE_NO:15
EndFunction
