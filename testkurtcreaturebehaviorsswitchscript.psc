ScriptName TestKurtCreatureBehaviorsSwitchScript Extends ObjectReference

;-- Variables ---------------------------------------
testkurtcreaturebehaviorscript myQuest

;-- Properties --------------------------------------
Message Property TestKurtCreatureBehaviorMessage Auto Const mandatory
{ message box for player choices }
Keyword Property TestKurtCreatureBehaviorKeyword Auto Const
Int Property CreatureRigIndex = 7 Auto
{ what rig to create from this button? }
Int Property ResetMessageIndex = 9 Auto Const

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akActionRef)
  Int messageIndex = TestKurtCreatureBehaviorMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:16
  Self.StartQuest() ; #DEBUG_LINE_NO:17
  If messageIndex == ResetMessageIndex ; #DEBUG_LINE_NO:18
    myQuest.ResetCreatures() ; #DEBUG_LINE_NO:19
  ElseIf messageIndex > -1 ; #DEBUG_LINE_NO:20
    myQuest.CreateCreature(messageIndex) ; #DEBUG_LINE_NO:21
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ChangeRig(Int newRigIndex)
  myQuest.ResetCreatures() ; #DEBUG_LINE_NO:26
  myQuest.Stop() ; #DEBUG_LINE_NO:27
  myQuest = None ; #DEBUG_LINE_NO:28
  CreatureRigIndex = newRigIndex ; #DEBUG_LINE_NO:29
  Self.StartQuest() ; #DEBUG_LINE_NO:30
EndFunction

Function StartQuest()
  If myQuest == None ; #DEBUG_LINE_NO:34
    myQuest = TestKurtCreatureBehaviorKeyword.SendStoryEventAndWait(None, Self as ObjectReference, Self.GetLinkedRef(None), CreatureRigIndex, 0)[0] as testkurtcreaturebehaviorscript ; #DEBUG_LINE_NO:35
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnUnload()
  If myQuest ; #DEBUG_LINE_NO:41
    myQuest.Stop() ; #DEBUG_LINE_NO:42
    myQuest = None ; #DEBUG_LINE_NO:43
  EndIf ; #DEBUG_LINE_NO:
EndEvent
