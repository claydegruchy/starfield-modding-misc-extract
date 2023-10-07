ScriptName Fragments:Quests:QF_BE_DerelictCreatures02_0013EC40 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_enemyShip Auto Const mandatory
ActorValue Property PSpaceshipCrew Auto Const mandatory
GlobalVariable Property PBE_DerelictCreaturesMax Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Quest __temp = Self as Quest ; #DEBUG_LINE_NO:7
  bescript kmyQuest = __temp as bescript ; #DEBUG_LINE_NO:8
  spaceshipreference enemyShipRef = Alias_enemyShip.GetRef() as spaceshipreference ; #DEBUG_LINE_NO:11
  Int NumCrew = enemyShipRef.GetBaseValue(PSpaceshipCrew) as Int ; #DEBUG_LINE_NO:12
  Int maxCreatures = PBE_DerelictCreaturesMax.GetValue() as Int ; #DEBUG_LINE_NO:13
  If NumCrew >= maxCreatures ; #DEBUG_LINE_NO:15
    NumCrew = maxCreatures ; #DEBUG_LINE_NO:16
  EndIf ; #DEBUG_LINE_NO:
  kmyQuest.SetupGenericCrew(kmyQuest.CrewData, 0.0, NumCrew, kmyQuest.CONST_SpawnPattern_Random, kmyQuest.CONST_SpawnPrioritization_None, False) ; #DEBUG_LINE_NO:19
EndFunction
