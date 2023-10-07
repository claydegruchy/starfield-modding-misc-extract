ScriptName EavesdroppingQuestScript Extends Quest
{ Quest script for eavesdropping quests based on EavesdroppingTemplate. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group QuestProperties
  Scene Property EavesdroppingScene Auto Const mandatory
  { The Eavesdropping Scene. }
  ReferenceAlias[] Property SceneAliases Auto Const mandatory
  { Array of actor aliases involved in the Eavesdropping Scene. }
EndGroup

Group AutofillProperties collapsedonbase
  ActorValue Property DMP_EavesdroppingSceneComplete Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Event OnQuestInit()
  Bool anySceneAliasDead = False ; #DEBUG_LINE_NO:21
  Int I = 0 ; #DEBUG_LINE_NO:22
  While !anySceneAliasDead && I < SceneAliases.Length ; #DEBUG_LINE_NO:23
    anySceneAliasDead = SceneAliases[I].GetRef() == None ; #DEBUG_LINE_NO:24
    I += 1 ; #DEBUG_LINE_NO:25
  EndWhile ; #DEBUG_LINE_NO:
  If anySceneAliasDead ; #DEBUG_LINE_NO:27
    Self.ShutdownQuest() ; #DEBUG_LINE_NO:29
  Else ; #DEBUG_LINE_NO:
    Self.RegisterForRemoteEvent(EavesdroppingScene as ScriptObject, "OnEnd") ; #DEBUG_LINE_NO:32
    EavesdroppingScene.Start() ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Scene.OnEnd(Scene akSource)
  Self.ShutdownQuest() ; #DEBUG_LINE_NO:39
EndEvent

Function ShutdownQuest()
  Int I = 0 ; #DEBUG_LINE_NO:46
  While I < SceneAliases.Length ; #DEBUG_LINE_NO:47
    SceneAliases[I].TryToSetValue(DMP_EavesdroppingSceneComplete, 1.0) ; #DEBUG_LINE_NO:48
    I += 1 ; #DEBUG_LINE_NO:49
  EndWhile ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:51
EndFunction
