ScriptName Helium3ContainerScript Extends ObjectReference
{ script for helium 3 container }

;-- Variables ---------------------------------------
Bool isOpen
ObjectReference playerRef

;-- Properties --------------------------------------
String Property myOpenAnimation = "play01" Auto Const
String Property myCloseAnimation = "play02" Auto Const
MiscObject Property myMiscItem Auto Const
Bool Property startOpen = False Auto
Message Property myMessage Auto

;-- Functions ---------------------------------------

Event OnLoad()
  playerRef = Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:16
  If startOpen == True ; #DEBUG_LINE_NO:17
    isOpen = True ; #DEBUG_LINE_NO:18
    Utility.wait(5.0) ; #DEBUG_LINE_NO:19
    Self.PlayAnimationAndWait(myOpenAnimation, "done") ; #DEBUG_LINE_NO:20
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If akActionRef == playerRef ; #DEBUG_LINE_NO:27
    If isOpen == True ; #DEBUG_LINE_NO:28
      If playerRef.GetItemCount(myMiscItem as Form) > 0 ; #DEBUG_LINE_NO:29
        isOpen = False ; #DEBUG_LINE_NO:30
        playerRef.RemoveItem(myMiscItem as Form, 1, False, None) ; #DEBUG_LINE_NO:31
        Self.PlayAnimationAndWait(myCloseAnimation, "done") ; #DEBUG_LINE_NO:32
      Else ; #DEBUG_LINE_NO:
        myMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:34
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      isOpen = True ; #DEBUG_LINE_NO:37
      Self.PlayAnimationAndWait(myOpenAnimation, "done") ; #DEBUG_LINE_NO:38
      playerRef.AddItem(myMiscItem as Form, 1, False) ; #DEBUG_LINE_NO:39
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
