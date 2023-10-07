ScriptName Fragments:Quests:QF_SE_Player_Patrol03_000013A9 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property Alias_Patrollers Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Utility.wait(11.0) ; #DEBUG_LINE_NO:7
  (Alias_Patrollers.GetAt(0) as spaceshipreference).EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:9
  Utility.wait(Utility.randomfloat(0.200000003, 3.900000095)) ; #DEBUG_LINE_NO:10
  (Alias_Patrollers.GetAt(1) as spaceshipreference).EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:11
  Utility.wait(Utility.randomfloat(0.200000003, 3.900000095)) ; #DEBUG_LINE_NO:12
  (Alias_Patrollers.GetAt(2) as spaceshipreference).EnableWithGravJumpNoWait() ; #DEBUG_LINE_NO:13
EndFunction
