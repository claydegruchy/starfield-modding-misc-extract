ScriptName MQStarbornEmissaryActorScript Extends Actor

;-- Variables ---------------------------------------
Int iRandomCompanion = -1

;-- Properties --------------------------------------
ReferenceAlias Property MQ00_CompanionWhoDies Auto Const mandatory
GlobalVariable Property MQ_EmissaryRevealed Auto Const mandatory
GlobalVariable Property MQ_EmissaryRandom Auto Const mandatory
Idle Property Stage2NoTransition Auto Const mandatory
Actor[] Property CompanionArray Auto Const
Outfit Property Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter Auto Const mandatory
Armor Property SpaceSuit_Starborn_Companion_PlayerOrFollower Auto Const mandatory
Armor Property SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE Auto Const mandatory

;-- State -------------------------------------------
Auto State WaitingForPlayer

  Event OnUnload()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent

  Event OnLoad()
    Self.gotostate("hasbeentriggered") ; #DEBUG_LINE_NO:15
    Self.WaitFor3dLoad() ; #DEBUG_LINE_NO:16
    If iRandomCompanion != -1 ; #DEBUG_LINE_NO:17
      Actor SetCompanionPicked = CompanionArray[iRandomCompanion] ; #DEBUG_LINE_NO:19
      Self.CopyAppearance(SetCompanionPicked) ; #DEBUG_LINE_NO:20
      Self.SetOverrideVoiceType(SetCompanionPicked.GetVoiceType()) ; #DEBUG_LINE_NO:21
    ElseIf MQ_EmissaryRandom.GetValueInt() == 1 ; #DEBUG_LINE_NO:22
      iRandomCompanion = Utility.RandomInt(0, 3) ; #DEBUG_LINE_NO:24
      Actor CompanionPicked = CompanionArray[iRandomCompanion] ; #DEBUG_LINE_NO:25
      Self.CopyAppearance(CompanionPicked) ; #DEBUG_LINE_NO:26
      Self.SetOverrideVoiceType(CompanionPicked.GetVoiceType()) ; #DEBUG_LINE_NO:27
    ElseIf MQ00_CompanionWhoDies != None ; #DEBUG_LINE_NO:28
      Actor DeadCompanionREF = MQ00_CompanionWhoDies.GetActorRef() ; #DEBUG_LINE_NO:30
      Self.CopyAppearance(DeadCompanionREF) ; #DEBUG_LINE_NO:31
    EndIf ; #DEBUG_LINE_NO:
    If MQ_EmissaryRevealed.GetValueInt() >= 1 ; #DEBUG_LINE_NO:35
      Self.RemoveItem(SpaceSuit_Starborn_CompanionNPC_NOTPLAYABLE as Form, 1, False, None) ; #DEBUG_LINE_NO:36
      Self.EquipItem(SpaceSuit_Starborn_Companion_PlayerOrFollower as Form, False, False) ; #DEBUG_LINE_NO:37
      Self.SetOutfit(Outfit_Spacesuit_Starborn_Companion_NPC_VoiceFilter, True) ; #DEBUG_LINE_NO:38
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
