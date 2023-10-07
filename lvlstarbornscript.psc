ScriptName LvlStarbornScript Extends Actor

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Spell Property ffStarbornTeleport Auto Const mandatory
Spell Property ffStarbornDeath Auto Const mandatory
ActorValue Property QuantumEssence Auto Const mandatory
Message Property QuantumEssenceAddMSG Auto Const mandatory
Spell Property FortifyQuantumEssenceSpell Auto Const mandatory
EffectShader Property Starborn_DeathShader Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  ; Empty function ; #DEBUG_LINE_NO:
EndEvent

Event OnDying(ObjectReference akKiller)
  Self.BlockActivation(True, True) ; #DEBUG_LINE_NO:28
  Starborn_DeathShader.Play(Self as ObjectReference, -1.0) ; #DEBUG_LINE_NO:30
EndEvent

Event OnDeath(ObjectReference akKiller)
  If (akKiller as Actor).IsPlayerTeammate() ; #DEBUG_LINE_NO:35
    FortifyQuantumEssenceSpell.Cast(Self as ObjectReference, Game.GetPlayer() as ObjectReference) ; #DEBUG_LINE_NO:36
  Else ; #DEBUG_LINE_NO:
    FortifyQuantumEssenceSpell.Cast(Self as ObjectReference, akKiller) ; #DEBUG_LINE_NO:38
  EndIf ; #DEBUG_LINE_NO:
  QuantumEssenceAddMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:40
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:42
  Self.Disable(False) ; #DEBUG_LINE_NO:43
EndEvent

Function TeleportIn()
  ffStarbornTeleport.Cast(Self as ObjectReference, Self as ObjectReference) ; #DEBUG_LINE_NO:47
EndFunction

Function TeleportOut()
  ffStarbornDeath.Cast(Self as ObjectReference, Self as ObjectReference) ; #DEBUG_LINE_NO:51
EndFunction

;-- State -------------------------------------------
State HasLoaded

  Event OnLoad()
    ; Empty function ; #DEBUG_LINE_NO:
  EndEvent
EndState

;-- State -------------------------------------------
Auto State WaitingForLoad

  Event OnLoad()
    Self.GotoState("HasLoaded") ; #DEBUG_LINE_NO:12
    ffStarbornTeleport.Cast(Self as ObjectReference, Self as ObjectReference) ; #DEBUG_LINE_NO:13
  EndEvent
EndState
