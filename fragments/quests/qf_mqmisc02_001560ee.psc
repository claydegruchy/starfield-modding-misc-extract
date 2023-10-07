ScriptName Fragments:Quests:QF_MQMisc02_001560EE Extends Quest Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Message Property MQMisc02MSG Auto Const mandatory
ReferenceAlias Property Alias_CompanionWhoDies Auto Const mandatory
ReferenceAlias Property Alias_Container Auto Const mandatory
Quest Property MQ206B Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Stage_0010_Item_00()
  Actor DeadCompanionREF = Alias_CompanionWhoDies.GetActorRef() ; #DEBUG_LINE_NO:7
  ObjectReference ContainerREF = Alias_Container.GetRef() ; #DEBUG_LINE_NO:8
  ContainerREF.Enable(False) ; #DEBUG_LINE_NO:10
  DeadCompanionREF.RemoveAllItems(ContainerREF, False, False) ; #DEBUG_LINE_NO:11
  MQMisc02MSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:13
  Utility.Wait(0.100000001) ; #DEBUG_LINE_NO:15
  Self.SetObjectiveDisplayed(10, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function Fragment_Stage_0100_Item_00()
  Self.CompleteAllObjectives() ; #DEBUG_LINE_NO:24
  If MQ206B.IsRunning() ; #DEBUG_LINE_NO:26
    MQ206B.SetActive(True) ; #DEBUG_LINE_NO:27
  EndIf ; #DEBUG_LINE_NO:
  Self.Stop() ; #DEBUG_LINE_NO:30
EndFunction
