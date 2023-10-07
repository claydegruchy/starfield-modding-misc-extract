ScriptName OtherPlayerAliasScript Extends ReferenceAlias

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
Idle Property Stage2 Auto Const mandatory
Idle Property Stage3 Auto Const mandatory

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnUnload()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    Self.gotostate("hasbeentriggered") ; #DEBUG_LINE_NO:20
    Actor PlayerREF = Game.GetPlayer() ; #DEBUG_LINE_NO:21
    ActorBase PlayerBase = PlayerREF.GetBaseObject() as ActorBase ; #DEBUG_LINE_NO:22
    Actor SelfREF = Self.GetActorRef() ; #DEBUG_LINE_NO:23
    SelfREF.WaitFor3dLoad() ; #DEBUG_LINE_NO:25
    SelfREF.CopyAppearance(PlayerREF) ; #DEBUG_LINE_NO:26
    If PlayerBase.GetPronoun() == Pronoun_TheyThem ; #DEBUG_LINE_NO:28
      If PlayerBase.GetSex() == BodyType_Feminine ; #DEBUG_LINE_NO:29
        SelfREF.SetOverrideVoiceType(NPCXOtherPlayer_2) ; #DEBUG_LINE_NO:30
      Else ; #DEBUG_LINE_NO:
        SelfREF.SetOverrideVoiceType(NPCXOtherPlayer) ; #DEBUG_LINE_NO:32
      EndIf ; #DEBUG_LINE_NO:
    ElseIf PlayerBase.GetSex() == BodyType_Feminine ; #DEBUG_LINE_NO:35
      If PlayerBase.GetPronoun() == Pronoun_SheHer || PlayerBase.GetPronoun() == Pronoun_Unselected ; #DEBUG_LINE_NO:36
        SelfREF.SetOverrideVoiceType(NPCFOtherPlayer) ; #DEBUG_LINE_NO:37
      Else ; #DEBUG_LINE_NO:
        SelfREF.SetOverrideVoiceType(NPCXOtherPlayer_2) ; #DEBUG_LINE_NO:39
      EndIf ; #DEBUG_LINE_NO:
    ElseIf PlayerBase.GetPronoun() == Pronoun_HeHim || PlayerBase.GetPronoun() == Pronoun_Unselected ; #DEBUG_LINE_NO:42
      SelfREF.SetOverrideVoiceType(NPCMOtherPlayer) ; #DEBUG_LINE_NO:43
    Else ; #DEBUG_LINE_NO:
      SelfREF.SetOverrideVoiceType(NPCXOtherPlayer) ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
    Self.GetActorRef().PlayIdle(Stage2) ; #DEBUG_LINE_NO:50
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:51
    Self.GetActorRef().PlayIdle(Stage3) ; #DEBUG_LINE_NO:52
  EndEvent
EndState

;-- State -------------------------------------------
State hasbeentriggered

  Event OnUnload()
    Self.gotostate("WaitingForPlayer") ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    Self.GetActorRef().PlayIdle(Stage2) ; #DEBUG_LINE_NO:62
    Utility.Wait(2.0) ; #DEBUG_LINE_NO:63
    Self.GetActorRef().PlayIdle(Stage3) ; #DEBUG_LINE_NO:64
  EndEvent
EndState
