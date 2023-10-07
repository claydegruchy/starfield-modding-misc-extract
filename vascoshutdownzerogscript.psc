ScriptName VascoShutDownZeroGScript Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill
  ActorValue Property VascoShutDownZeroG Auto Const mandatory
  Perk Property VascoShutDownZeroGPlayerPerk Auto Const mandatory
  Message Property VascoShutDownZeroGActivateMessage Auto Const mandatory
  Scene Property CREW_EliteCrew_Vasco_ShutdownZeroG Auto Const mandatory
EndGroup


;-- Functions ---------------------------------------

Function ShutDown()
  Self.SetUnconscious(True) ; #DEBUG_LINE_NO:15
  CREW_EliteCrew_Vasco_ShutdownZeroG.Start() ; #DEBUG_LINE_NO:16
  Self.setvalue(VascoShutDownZeroG, 1.0) ; #DEBUG_LINE_NO:17
  Game.GetPlayer().AddPerk(VascoShutDownZeroGPlayerPerk, False) ; #DEBUG_LINE_NO:18
EndFunction

Function StartUp()
  Self.SetUnconscious(False) ; #DEBUG_LINE_NO:22
  Self.setvalue(VascoShutDownZeroG, 0.0) ; #DEBUG_LINE_NO:23
  Game.GetPlayer().RemovePerk(VascoShutDownZeroGPlayerPerk) ; #DEBUG_LINE_NO:24
EndFunction

Function ActivatedDuringShutDown()
  VascoShutDownZeroGActivateMessage.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:28
EndFunction

Event OnActivate(ObjectReference akActionRef)
  If Self.GetValue(VascoShutDownZeroG) == 1.0 ; #DEBUG_LINE_NO:32
    Self.ActivatedDuringShutDown() ; #DEBUG_LINE_NO:33
  EndIf ; #DEBUG_LINE_NO:
EndEvent
