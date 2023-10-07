ScriptName Fragments:Terminals:TERM_LC073_CaptainTerminal_G_00227D00 Extends TerminalMenu Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Faction Property GuardFactionFriendly Auto Const
Faction Property GuardFactionEnemy Auto Const
Keyword Property GuardKeyword Auto Const

;-- Functions ---------------------------------------

Function Fragment_TerminalMenu_01(ObjectReference akTerminalRef)
  ObjectReference[] guardObjectReferences = akTerminalRef.GetRefsLinkedToMe(GuardKeyword, None) ; #DEBUG_LINE_NO:7
  Int I = 0 ; #DEBUG_LINE_NO:9
  While I < guardObjectReferences.Length ; #DEBUG_LINE_NO:10
    Actor guardActor = guardObjectReferences[I] as Actor ; #DEBUG_LINE_NO:12
    guardActor.RemoveFromFaction(GuardFactionFriendly) ; #DEBUG_LINE_NO:14
    guardActor.AddToFaction(GuardFactionEnemy) ; #DEBUG_LINE_NO:15
    I += 1 ; #DEBUG_LINE_NO:17
  EndWhile ; #DEBUG_LINE_NO:
EndFunction
