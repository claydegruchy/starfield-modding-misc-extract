ScriptName TestKurtBehaviorsTerminalScript Extends TerminalMenu

;-- Variables ---------------------------------------
testkurtcreaturebehaviorscript myQuest
ObjectReference myTerminal

;-- Properties --------------------------------------
TerminalMenu Property TestKurtCreatureBehavior_BehaviorList Auto Const mandatory
{ terminal for behaviors }
TerminalMenu Property TestKurtCreatureBehavior_RigList Auto Const mandatory
{ terminal for rigs }
Keyword Property TestKurtCreatureBehaviorKeyword Auto Const
Int Property CreatureRigIndex = 7 Auto
{ what rig to create from this button? }
Int Property Behavior_ResetID = 12 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If myTerminal == None ; #DEBUG_LINE_NO:21
    myTerminal = akTerminalRef ; #DEBUG_LINE_NO:22
    Self.RegisterForRemoteEvent(akTerminalRef as ScriptObject, "OnUnload") ; #DEBUG_LINE_NO:23
    Self.StartQuest() ; #DEBUG_LINE_NO:24
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  If akTerminalBase == TestKurtCreatureBehavior_BehaviorList ; #DEBUG_LINE_NO:30
    If auiMenuItemID == Behavior_ResetID ; #DEBUG_LINE_NO:31
      myQuest.ResetCreatures() ; #DEBUG_LINE_NO:33
    Else ; #DEBUG_LINE_NO:
      Int creatureIndex = auiMenuItemID - 1 ; #DEBUG_LINE_NO:35
      myQuest.CreateCreature(creatureIndex) ; #DEBUG_LINE_NO:37
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akTerminalBase == TestKurtCreatureBehavior_RigList ; #DEBUG_LINE_NO:39
    Self.ChangeRig(auiMenuItemID - 1) ; #DEBUG_LINE_NO:40
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ChangeRig(Int newRigIndex)
  myQuest.ResetCreatures() ; #DEBUG_LINE_NO:47
  myQuest.Stop() ; #DEBUG_LINE_NO:48
  myQuest = None ; #DEBUG_LINE_NO:49
  CreatureRigIndex = newRigIndex ; #DEBUG_LINE_NO:50
  Self.StartQuest() ; #DEBUG_LINE_NO:51
EndFunction

Function StartQuest()
  If myQuest == None ; #DEBUG_LINE_NO:56
    Quest[] questArray = TestKurtCreatureBehaviorKeyword.SendStoryEventAndWait(None, myTerminal, myTerminal.GetLinkedRef(None), CreatureRigIndex, 0) ; #DEBUG_LINE_NO:57
    If questArray.Length > 0 ; #DEBUG_LINE_NO:59
      myQuest = questArray[0] as testkurtcreaturebehaviorscript ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event ObjectReference.OnUnload(ObjectReference akSource)
  If myQuest ; #DEBUG_LINE_NO:68
    myQuest.Stop() ; #DEBUG_LINE_NO:69
    myQuest = None ; #DEBUG_LINE_NO:70
  EndIf ; #DEBUG_LINE_NO:
  myTerminal = None ; #DEBUG_LINE_NO:72
EndEvent
