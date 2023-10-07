ScriptName Fragments:Quests:QF_TestJeffBQuestCurious_00001536 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Scene Property ApproachScene Auto Const
ReferenceAlias Property Alias_myActor Auto Const mandatory
Idle Property myPairedIdle Auto Const
Idle Property myIdle Auto Const
Scene Property AfterwardsScene Auto Const
Idle Property myIdle2 Auto Const
ReferenceAlias Property Alias_myDog1 Auto Const mandatory
ReferenceAlias Property Alias_myDog2 Auto Const mandatory
Scene Property ApproachToMournScene Auto Const

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  ApproachScene.Start() ; #DEBUG_LINE_NO:7
EndFunction

Function Fragment_Stage_0020_Item_00()
  Alias_myActor.getActorRef().PlayIdleWithTarget(myPairedIdle, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:15
  Utility.wait(8.0) ; #DEBUG_LINE_NO:16
  Alias_myActor.getActorRef().PlayIdle(myIdle) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Stage_0050_Item_00()
  Alias_myDog1.getActorRef().stopCombat() ; #DEBUG_LINE_NO:26
  Alias_myDog2.getActorRef().stopCombat() ; #DEBUG_LINE_NO:27
EndFunction

Function Fragment_Stage_0055_Item_00()
  Alias_myDog1.getActorRef().PlayIdle(myIdle2) ; #DEBUG_LINE_NO:36
  Alias_myDog2.getActorRef().PlayIdle(myIdle2) ; #DEBUG_LINE_NO:37
EndFunction
