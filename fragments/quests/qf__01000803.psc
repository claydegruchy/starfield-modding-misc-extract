ScriptName Fragments:Quests:QF__01000803 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
GlobalVariable Property PRI03_MalaiDead Auto Const mandatory
ReferenceAlias Property Alias_Datura Auto Const mandatory
ReferenceAlias Property Alias_PlayerShip Auto Const mandatory
ReferenceAlias Property Alias_Player Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Utility.wait(5.0) ; #DEBUG_LINE_NO:7
  spaceshipreference myShip = Alias_Datura.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:8
  myShip.enablewithgravjump() ; #DEBUG_LINE_NO:9
  myShip.StartCombat(Alias_PlayerShip.GetRef() as spaceshipreference, False) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Stage_0050_Item_00()
  PRI03_MalaiDead.SetValue(1.0) ; #DEBUG_LINE_NO:18
EndFunction
