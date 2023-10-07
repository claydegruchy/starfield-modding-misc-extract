ScriptName CityLife_LVC_AliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property SceneCompleteStage = 200 Auto Const
{ When this stage is set, update this NPC }
ActorValue Property UC_NA_CL_SceneComplete Auto Const mandatory
{ Actor value used to tag these NPCs with their post scene packages }
Float Property MinEVPWait = 0.100000001 Auto Const
{ Minimum amount of wait time before eval'ing }
Float Property MaxEVPWait = 0.5 Auto Const
{ Max amount of wait time before eval'ing }
Bool Property DisablePostScene = True Auto Const
{ If TRUE, when SceneCompleteStage is set, this NPC will disable as soon as they unload the first time }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Self.RegisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:19
EndEvent

Event Quest.OnStageSet(Quest akSender, Int auiStageID, Int auiItemID)
  If auiStageID == SceneCompleteStage && akSender == Self.GetOwningQuest() ; #DEBUG_LINE_NO:23
    Self.UnregisterForRemoteEvent(Self.GetOwningQuest() as ScriptObject, "OnStageSet") ; #DEBUG_LINE_NO:24
    Self.UpdateCLNPC() ; #DEBUG_LINE_NO:25
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function UpdateCLNPC()
  Actor currAct = Self.GetActorRef() ; #DEBUG_LINE_NO:31
  If currAct != None ; #DEBUG_LINE_NO:33
    currAct.SetValue(UC_NA_CL_SceneComplete, 1.0) ; #DEBUG_LINE_NO:34
    Float fRand = Utility.RandomFloat(MinEVPWait, MaxEVPWait) ; #DEBUG_LINE_NO:35
    Utility.Wait(fRand) ; #DEBUG_LINE_NO:37
    currAct.EvaluatePackage(False) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Event OnUnload()
  If DisablePostScene && Self.GetOwningQuest().GetStageDone(SceneCompleteStage) ; #DEBUG_LINE_NO:43
    Self.GetRef().Disable(False) ; #DEBUG_LINE_NO:44
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:52
EndFunction
