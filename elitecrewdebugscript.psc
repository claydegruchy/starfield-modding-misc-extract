ScriptName EliteCrewDebugScript Extends Actor

;-- Variables ---------------------------------------
sq_crewscript SQ_Crew

;-- Properties --------------------------------------
Quest Property CrewQuest Auto Const

;-- Functions ---------------------------------------

Event OnInit()
  SQ_Crew = Game.GetFormFromFile(2774653, "Starfield.esm") as sq_crewscript ; #DEBUG_LINE_NO:7
EndEvent

Function DebugMakeAvailableCrew()
  SQ_Crew.SetRoleAvailable(Self as Actor, True) ; #DEBUG_LINE_NO:11
EndFunction

Function DebugHire()
  SQ_Crew.SetRoleActive(Self as Actor, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:15
  Self.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:16
EndFunction

Function DebugMakeActiveEliteCrew()
  Self.DebugHire() ; #DEBUG_LINE_NO:20
  CrewQuest.SetStage(0) ; #DEBUG_LINE_NO:21
  SQ_Crew.SetEliteCrewActive(Self as Actor) ; #DEBUG_LINE_NO:22
  Self.MoveTo(Game.GetPlayer() as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:23
EndFunction
