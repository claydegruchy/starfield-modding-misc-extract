ScriptName UC_CompanionLearnsVVAliveInfoScript Extends TopicInfo

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ActorValue Property UC_COMP_KnowsVaeVictisLives Auto Const mandatory
{ Actor value used to track if the companion's previously learned Vae Victis is alive }
GlobalVariable Property UC_COMP_KnowsVaeVictisLives_Global Auto Const mandatory
{ Value to check for to see if the companion has previously learned that VV's alive }

;-- Functions ---------------------------------------

Event OnEnd(ObjectReference akSpeakerRef, Bool abHasBeenSaid)
  Float fVVValue = UC_COMP_KnowsVaeVictisLives_Global.GetValue() ; #DEBUG_LINE_NO:10
  If akSpeakerRef.GetValue(UC_COMP_KnowsVaeVictisLives) < fVVValue ; #DEBUG_LINE_NO:12
    akSpeakerRef.SetValue(UC_COMP_KnowsVaeVictisLives, fVVValue) ; #DEBUG_LINE_NO:13
  EndIf ; #DEBUG_LINE_NO:
EndEvent
