ScriptName RI03_StanleyAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property Stanley Auto Const mandatory
ReferenceAlias Property StanleyTerminal Auto Const mandatory
Int Property iStageStanleyLuredAway = 1070 Auto Const
GlobalVariable Property RI03_StanleyInWorkFurniture Auto Const mandatory

;-- Functions ---------------------------------------

Event OnExitFurniture(ObjectReference akActionRef)
  If akActionRef == Stanley.GetRef() ; #DEBUG_LINE_NO:10
    If Self.GetOwningQuest().GetStageDone(iStageStanleyLuredAway) ; #DEBUG_LINE_NO:12
      ObjectReference TerminalRef = StanleyTerminal.GetRef() ; #DEBUG_LINE_NO:14
      TerminalRef.Lock(False, False, True) ; #DEBUG_LINE_NO:15
      TerminalRef.SetActorRefOwner(Game.GetPlayer(), False) ; #DEBUG_LINE_NO:16
    EndIf ; #DEBUG_LINE_NO:
    RI03_StanleyInWorkFurniture.SetValue(0.0) ; #DEBUG_LINE_NO:19
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnEnterFurniture(Actor akActionRef)
  RI03_StanleyInWorkFurniture.SetValue(1.0) ; #DEBUG_LINE_NO:27
EndEvent
