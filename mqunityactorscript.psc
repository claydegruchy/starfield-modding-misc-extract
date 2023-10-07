ScriptName MQUnityActorScript Extends Actor

;-- Variables ---------------------------------------
Int BodyType_Feminine = 1 Const
Int BodyType_Masculine = 0 Const
Int Pronoun_HeHim = 1 Const
Int Pronoun_SheHer = 2 Const
Int Pronoun_TheyThem = 3 Const
Int Pronoun_Unselected = 0 Const

;-- Properties --------------------------------------
VoiceType Property UnityVoiceMale Auto Const mandatory
VoiceType Property UnityVoiceFemale Auto Const mandatory
VoiceType Property UnityVoiceNonBinary Auto Const mandatory
VoiceType Property UnityVoiceNonBinary_2 Auto Const mandatory
VisualEffect Property UnityActorEffect Auto Const mandatory

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnUnload()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    Self.gotostate("hasbeentriggered") ; #DEBUG_LINE_NO:19
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:20
    ActorBase PlayerBase = PlayerREF.GetBaseObject() as ActorBase ; #DEBUG_LINE_NO:21
    Self.WaitFor3dLoad() ; #DEBUG_LINE_NO:23
    Self.CopyAppearance(PlayerREF) ; #DEBUG_LINE_NO:24
    If PlayerBase.GetPronoun() == Pronoun_TheyThem ; #DEBUG_LINE_NO:26
      If PlayerBase.GetSex() == BodyType_Feminine ; #DEBUG_LINE_NO:27
        Self.SetOverrideVoiceType(UnityVoiceNonBinary_2) ; #DEBUG_LINE_NO:28
      Else ; #DEBUG_LINE_NO:
        Self.SetOverrideVoiceType(UnityVoiceNonBinary) ; #DEBUG_LINE_NO:30
      EndIf ; #DEBUG_LINE_NO:
    ElseIf PlayerBase.GetSex() == BodyType_Feminine ; #DEBUG_LINE_NO:33
      If PlayerBase.GetPronoun() == Pronoun_SheHer || PlayerBase.GetPronoun() == Pronoun_Unselected ; #DEBUG_LINE_NO:34
        Self.SetOverrideVoiceType(UnityVoiceFemale) ; #DEBUG_LINE_NO:35
      Else ; #DEBUG_LINE_NO:
        Self.SetOverrideVoiceType(UnityVoiceNonBinary_2) ; #DEBUG_LINE_NO:37
      EndIf ; #DEBUG_LINE_NO:
    ElseIf PlayerBase.GetPronoun() == Pronoun_HeHim || PlayerBase.GetPronoun() == Pronoun_Unselected ; #DEBUG_LINE_NO:40
      Self.SetOverrideVoiceType(UnityVoiceMale) ; #DEBUG_LINE_NO:41
    Else ; #DEBUG_LINE_NO:
      Self.SetOverrideVoiceType(UnityVoiceNonBinary) ; #DEBUG_LINE_NO:43
    EndIf ; #DEBUG_LINE_NO:
    UnityActorEffect.Play(Self as ObjectReference, -1.0, None) ; #DEBUG_LINE_NO:47
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnUnload()
    Self.gotostate("WaitingForPlayer") ; #DEBUG_LINE_NO:
  EndEvent
EndState
