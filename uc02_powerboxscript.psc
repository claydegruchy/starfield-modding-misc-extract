ScriptName UC02_PowerBoxScript Extends RefCollectionAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
RefCollectionAlias Property LinkedDefenses Auto Const mandatory
{ The defenses you want to turn on when the power is thrown }
Keyword Property TopicToPlay Auto Const mandatory
{ Topic to play when all the power boxes are activated }
Keyword Property AdditionalBreakerTopic Auto Const mandatory
{ Topic to play if there are additional breakers to throw still }
Keyword Property UC02_SystemOffline_Keyword Auto Const mandatory
{ Keyword to trigger topic if the player gets here early }
Quest Property UC02 Auto Const mandatory
{ UC02 quest }
Int Property PreReqStage = 601 Auto Const
{ If the player attempts to activate these objects before this stage is set, they'll fail }
ReferenceAlias Property DefenseSystem Auto Const mandatory
{ Actor alias for the defense system }
ReferenceAlias Property LightAlias Auto Const mandatory
{ Alias for the enable marker that manages each group of lights }
wwiseevent Property QST_UC02_Turret_Power_Half Auto Const mandatory
{ Sound to play if the player's partially restored power to the system }
wwiseevent Property QST_UC02_Turret_Power_Full Auto Const mandatory
{ Sound to play if the player's fully restored power to the system }

;-- Functions ---------------------------------------

Event OnActivate(ObjectReference akSenderRef, ObjectReference akActionRef)
  If UC02.GetStageDone(PreReqStage) ; #DEBUG_LINE_NO:35
    Self.RemoveRef(akSenderRef) ; #DEBUG_LINE_NO:36
    If Self.GetCount() <= 0 ; #DEBUG_LINE_NO:39
      Int I = 0 ; #DEBUG_LINE_NO:40
      Int iCount = LinkedDefenses.GetCount() ; #DEBUG_LINE_NO:41
      Bool bAnyAlive = False ; #DEBUG_LINE_NO:42
      While I < iCount ; #DEBUG_LINE_NO:44
        Actor currAct = LinkedDefenses.GetAt(I) as Actor ; #DEBUG_LINE_NO:45
        If currAct.IsUnconscious() && !currAct.IsDead() ; #DEBUG_LINE_NO:48
          bAnyAlive = True ; #DEBUG_LINE_NO:49
          LightAlias.GetRef().Enable(False) ; #DEBUG_LINE_NO:50
          currAct.SetUnconscious(False) ; #DEBUG_LINE_NO:51
          currAct.IgnoreFriendlyHits(True) ; #DEBUG_LINE_NO:52
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:56
      EndWhile ; #DEBUG_LINE_NO:
      If bAnyAlive ; #DEBUG_LINE_NO:59
        QST_UC02_Turret_Power_Full.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:61
        akSenderRef.SayCustom(TopicToPlay, DefenseSystem.GetActorRef(), False, None) ; #DEBUG_LINE_NO:62
      EndIf ; #DEBUG_LINE_NO:
    Else ; #DEBUG_LINE_NO:
      QST_UC02_Turret_Power_Half.Play(Game.GetPlayer() as ObjectReference, None, None) ; #DEBUG_LINE_NO:66
      akSenderRef.SayCustom(AdditionalBreakerTopic, DefenseSystem.GetActorRef(), False, None) ; #DEBUG_LINE_NO:67
    EndIf ; #DEBUG_LINE_NO:
  Else ; #DEBUG_LINE_NO:
    akSenderRef.SayCustom(UC02_SystemOffline_Keyword, DefenseSystem.GetActorRef(), False, None) ; #DEBUG_LINE_NO:71
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:79
EndFunction
