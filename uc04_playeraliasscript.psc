ScriptName UC04_PlayerAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------
Bool bMusicActive

;-- Properties --------------------------------------
Location Property CityNewAtlantisLocation Auto Const mandatory
{ New Atlantis location }
Int Property PrereqStage = 425 Auto Const
{ Once this stage is set, turn on the combat music }
Int Property ShutdownStage = 850 Auto Const
{ Once this stage is set, we can stop checking this }
Int Property FailsafeStage = 910 Auto Const
{ In case the music didn't get turned off earlier, try it again at this stage }
MusicType Property MUSGenesisCombat_UC04 Auto Const mandatory
{ Music type object for the UC attakc music }
conditionform Property UC04_WeaponIsTypeEM Auto Const mandatory
{ Condition for to check to see if the player's equipped an EM weapon }
Int Property EMSectionStageToSet = 581 Auto Const
{ Player equipped an EM weapon during the NAT sequence. Update their objectives if they're still valid }
Int Property EMSectionPrereqStage = 600 Auto Const
{ Only start checking the player's equip events if this stage has been set }
Int Property EMSectionShutdownStage = 590 Auto Const
{ Once this stage is set, stop checking for the player equipping the EM weapon during the NAT sequence }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:34
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == PrereqStage ; #DEBUG_LINE_NO:39
    Self.ToggleCombatMusic(True) ; #DEBUG_LINE_NO:41
  ElseIf auiStageID == ShutdownStage ; #DEBUG_LINE_NO:42
    Self.ToggleCombatMusic(False) ; #DEBUG_LINE_NO:43
  ElseIf auiStageID == FailsafeStage ; #DEBUG_LINE_NO:45
    Self.ToggleCombatMusic(False) ; #DEBUG_LINE_NO:46
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function ToggleCombatMusic(Bool bMusicOn)
  If bMusicOn ; #DEBUG_LINE_NO:53
    If !bMusicActive ; #DEBUG_LINE_NO:54
      bMusicActive = True ; #DEBUG_LINE_NO:55
      MUSGenesisCombat_UC04.Add() ; #DEBUG_LINE_NO:56
    EndIf ; #DEBUG_LINE_NO:
  ElseIf !bMusicOn ; #DEBUG_LINE_NO:59
    If bMusicActive ; #DEBUG_LINE_NO:60
      bMusicActive = False ; #DEBUG_LINE_NO:61
      MUSGenesisCombat_UC04.Remove() ; #DEBUG_LINE_NO:62
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  Quest OQ = Self.GetOwningQuest() ; #DEBUG_LINE_NO:69
  If UC04_WeaponIsTypeEM.IsTrue(None, None) && OQ.GetStageDone(EMSectionPrereqStage) && !OQ.GetStageDone(EMSectionShutdownStage) && !OQ.GetStageDone(EMSectionStageToSet) ; #DEBUG_LINE_NO:72
    OQ.SetStage(EMSectionStageToSet) ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:81
EndFunction
