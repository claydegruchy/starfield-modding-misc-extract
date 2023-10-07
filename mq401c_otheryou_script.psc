ScriptName MQ401C_OtherYou_Script Extends Actor

;-- Variables ---------------------------------------
Int BodyType_Feminine = 1 Const
Int BodyType_Masculine = 0 Const
Int Pronoun_HeHim = 1 Const
Int Pronoun_SheHer = 2 Const
Int Pronoun_TheyThem = 3 Const
Int Pronoun_Unselected = 0 Const

;-- Properties --------------------------------------
VoiceType Property NPCFOtherPlayer Auto Const mandatory
VoiceType Property NPCMOtherPlayer Auto Const mandatory
VoiceType Property NPCXOtherPlayer Auto Const mandatory
VoiceType Property NPCXOtherPlayer_2 Auto Const mandatory

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnUnload()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    Self.gotostate("hasbeentriggered") ; #DEBUG_LINE_NO:18
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:19
    ActorBase PlayerBase = PlayerREF.GetBaseObject() as ActorBase ; #DEBUG_LINE_NO:20
    Self.WaitFor3dLoad() ; #DEBUG_LINE_NO:22
    Self.CopyAppearance(PlayerREF) ; #DEBUG_LINE_NO:23
    If PlayerBase.GetPronoun() == Pronoun_TheyThem ; #DEBUG_LINE_NO:25
      If PlayerBase.GetSex() == BodyType_Feminine ; #DEBUG_LINE_NO:26
        Self.SetOverrideVoiceType(NPCXOtherPlayer_2) ; #DEBUG_LINE_NO:27
      Else ; #DEBUG_LINE_NO:
        Self.SetOverrideVoiceType(NPCXOtherPlayer) ; #DEBUG_LINE_NO:29
      EndIf ; #DEBUG_LINE_NO:
    ElseIf PlayerBase.GetSex() == BodyType_Feminine ; #DEBUG_LINE_NO:32
      If PlayerBase.GetPronoun() == Pronoun_SheHer || PlayerBase.GetPronoun() == Pronoun_Unselected ; #DEBUG_LINE_NO:33
        Self.SetOverrideVoiceType(NPCFOtherPlayer) ; #DEBUG_LINE_NO:34
      Else ; #DEBUG_LINE_NO:
        Self.SetOverrideVoiceType(NPCXOtherPlayer_2) ; #DEBUG_LINE_NO:36
      EndIf ; #DEBUG_LINE_NO:
    ElseIf PlayerBase.GetPronoun() == Pronoun_HeHim || PlayerBase.GetPronoun() == Pronoun_Unselected ; #DEBUG_LINE_NO:39
      Self.SetOverrideVoiceType(NPCMOtherPlayer) ; #DEBUG_LINE_NO:40
    Else ; #DEBUG_LINE_NO:
      Self.SetOverrideVoiceType(NPCXOtherPlayer) ; #DEBUG_LINE_NO:42
    EndIf ; #DEBUG_LINE_NO:
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
