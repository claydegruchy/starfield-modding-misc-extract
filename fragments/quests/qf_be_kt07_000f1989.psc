ScriptName Fragments:Quests:QF_BE_KT07_000F1989 Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Alias_playerShip Auto Const mandatory
RefCollectionAlias Property Alias_GenericRobots Auto Const mandatory
Faction Property CrimeFactionUC Auto Const mandatory
Faction Property UCSecurityFaction Auto Const mandatory
ActorValue Property Aggression Auto Const mandatory
Faction Property PlayerEnemyFaction Auto Const mandatory
ReferenceAlias Property Alias_PodRobot Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Actor[] RobotsRef = Alias_GenericRobots.GetActorArray() ; #DEBUG_LINE_NO:7
  Alias_GenericRobots.AddRef(Alias_PodRobot.GetRef()) ; #DEBUG_LINE_NO:8
  Int I = 0 ; #DEBUG_LINE_NO:10
  While I < RobotsRef.Length ; #DEBUG_LINE_NO:11
    RobotsRef[I].RemoveFromFaction(CrimeFactionUC) ; #DEBUG_LINE_NO:12
    RobotsRef[I].RemoveFromFaction(UCSecurityFaction) ; #DEBUG_LINE_NO:13
    RobotsRef[I].AddtoFaction(PlayerEnemyFaction) ; #DEBUG_LINE_NO:14
    RobotsRef[I].SetValue(Aggression, 2.0) ; #DEBUG_LINE_NO:15
    I += 1 ; #DEBUG_LINE_NO:16
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Function Fragment_Stage_0020_Item_00()
  (Alias_PodRobot.GetRef() as robotpodscript).WakeRobotFromPod() ; #DEBUG_LINE_NO:25
EndFunction
