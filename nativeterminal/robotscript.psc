ScriptName NativeTerminal:RobotScript Extends TerminalMenu
{ handles robots (and turrets) via native terminal }

;-- Variables ---------------------------------------
Bool allRobotsFrenzied = True
Bool allRobotsTeammate = True
Bool anyRobotsActive = False
Bool anyRobotsAlive = False
Bool hasRobotPod = False
Bool hasRobots = False

;-- Properties --------------------------------------
Group autofillProperties
  TerminalMenu Property NativeTerminalRobotFriendSettings Auto Const mandatory
  { autofill }
  TerminalMenu Property NativeTerminalRobotFrenzy Auto Const mandatory
  { autofill }
  ActorValue Property Aggression Auto Const mandatory
  { autofill }
  sq_parentscript Property SQ_Parent Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_AnyRobotsActive Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_HasRobotPod Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_HasRobots Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_AnyRobotsAlive Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_AllRobotsFrenzied Auto Const mandatory
  { autofill }
  ActorValue Property NativeTerminalRobot_AllRobotsTeammate Auto Const mandatory
  { autofill }
  Faction Property NativeTerminalRobotAllyFaction Auto Const mandatory
  { autofill }
EndGroup

Keyword Property LinkTerminalRobot Auto Const mandatory
{ link that robots are linked to terminal with 
  NOTE: for turret terminal, use LinkTerminalTurret }
Int Property menuItemID_Activate01 = 1 Auto Const
Int Property menuItemID_Deactivate01 = 2 Auto Const
Int Property menuItemID_Ally01 = 1 Auto Const
Int Property menuItemID_Frenzy01 = 1 Auto Const

;-- Functions ---------------------------------------

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:61
EndEvent

Function UpdateAllTerminalVariables(ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) ; #DEBUG_LINE_NO:67
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalRobot, None) ; #DEBUG_LINE_NO:68
  anyRobotsActive = False ; #DEBUG_LINE_NO:71
  anyRobotsAlive = False ; #DEBUG_LINE_NO:72
  hasRobotPod = False ; #DEBUG_LINE_NO:73
  hasRobots = False ; #DEBUG_LINE_NO:74
  allRobotsFrenzied = True ; #DEBUG_LINE_NO:75
  allRobotsTeammate = True ; #DEBUG_LINE_NO:76
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:78
    Self.UpdateTerminalVariablesForArray(linkedRefChain as Actor[]) ; #DEBUG_LINE_NO:79
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:81
    Self.UpdateTerminalVariablesForArray(linkedRefChildren as Actor[]) ; #DEBUG_LINE_NO:82
  EndIf ; #DEBUG_LINE_NO:
  akTerminalRef.SetValue(NativeTerminalRobot_AnyRobotsActive, (anyRobotsActive as Int) as Float) ; #DEBUG_LINE_NO:92
  akTerminalRef.SetValue(NativeTerminalRobot_AnyRobotsAlive, (anyRobotsAlive as Int) as Float) ; #DEBUG_LINE_NO:93
  akTerminalRef.SetValue(NativeTerminalRobot_HasRobotPod, (hasRobotPod as Int) as Float) ; #DEBUG_LINE_NO:94
  akTerminalRef.SetValue(NativeTerminalRobot_HasRobots, (hasRobots as Int) as Float) ; #DEBUG_LINE_NO:95
  akTerminalRef.SetValue(NativeTerminalRobot_AllRobotsFrenzied, (allRobotsFrenzied as Int) as Float) ; #DEBUG_LINE_NO:96
  akTerminalRef.SetValue(NativeTerminalRobot_AllRobotsTeammate, (allRobotsTeammate as Int) as Float) ; #DEBUG_LINE_NO:97
EndFunction

Function UpdateTerminalVariablesForArray(Actor[] actorArray)
  Int I = 0 ; #DEBUG_LINE_NO:103
  While I < actorArray.Length ; #DEBUG_LINE_NO:104
    Actor theActor = actorArray[I] ; #DEBUG_LINE_NO:105
    If theActor.IsDead() == False ; #DEBUG_LINE_NO:107
      anyRobotsAlive = True ; #DEBUG_LINE_NO:108
      robotpodscript theRobotPodActor = actorArray[I] as robotpodscript ; #DEBUG_LINE_NO:110
      Bool robotPod = theRobotPodActor as Bool && theRobotPodActor.HasPod() ; #DEBUG_LINE_NO:111
      If robotPod ; #DEBUG_LINE_NO:112
        hasRobotPod = True ; #DEBUG_LINE_NO:113
      Else ; #DEBUG_LINE_NO:
        hasRobots = True ; #DEBUG_LINE_NO:116
      EndIf ; #DEBUG_LINE_NO:
      If robotPod == False && theActor.IsUnconscious() == False || robotPod && theRobotPodActor.isInPod == False ; #DEBUG_LINE_NO:119
        anyRobotsActive = True ; #DEBUG_LINE_NO:120
      EndIf ; #DEBUG_LINE_NO:
      If theActor.GetValue(Aggression) < 3.0 ; #DEBUG_LINE_NO:123
        allRobotsFrenzied = False ; #DEBUG_LINE_NO:124
      EndIf ; #DEBUG_LINE_NO:
      If theActor.IsPlayerTeammate() == False ; #DEBUG_LINE_NO:127
        allRobotsTeammate = False ; #DEBUG_LINE_NO:128
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:132
  EndWhile ; #DEBUG_LINE_NO:
EndFunction

Event OnTerminalMenuItemRun(Int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
  ObjectReference[] linkedRefChain = akTerminalRef.GetLinkedRefChain(LinkTerminalRobot, 100) ; #DEBUG_LINE_NO:139
  ObjectReference[] linkedRefChildren = akTerminalRef.GetRefsLinkedToMe(LinkTerminalRobot, None) ; #DEBUG_LINE_NO:140
  If linkedRefChain.Length > 0 ; #DEBUG_LINE_NO:141
    Self.HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChain as Actor[], akTerminalRef) ; #DEBUG_LINE_NO:142
  EndIf ; #DEBUG_LINE_NO:
  If linkedRefChildren.Length > 0 ; #DEBUG_LINE_NO:144
    Self.HandleMenuItem(auiMenuItemID, akTerminalBase, linkedRefChildren as Actor[], akTerminalRef) ; #DEBUG_LINE_NO:145
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Function HandleMenuItem(Int auiMenuItemID, TerminalMenu akTerminalBase, Actor[] actorArray, ObjectReference akTerminalRef)
  If akTerminalBase == Self as TerminalMenu ; #DEBUG_LINE_NO:151
    If auiMenuItemID == menuItemID_Activate01 ; #DEBUG_LINE_NO:152
      Int I = 0 ; #DEBUG_LINE_NO:153
      While I < actorArray.Length ; #DEBUG_LINE_NO:155
        robotpodscript theRobotPodActor = actorArray[I] as robotpodscript ; #DEBUG_LINE_NO:156
        If theRobotPodActor ; #DEBUG_LINE_NO:157
          theRobotPodActor.WakeRobotFromPod() ; #DEBUG_LINE_NO:158
        Else ; #DEBUG_LINE_NO:
          actorArray[I].SetUnconscious(False) ; #DEBUG_LINE_NO:160
        EndIf ; #DEBUG_LINE_NO:
        SQ_Parent.SendNativeTerminalActorUnconsciousEvent(akTerminalRef, actorArray[I], False) ; #DEBUG_LINE_NO:163
        I += 1 ; #DEBUG_LINE_NO:164
      EndWhile ; #DEBUG_LINE_NO:
      Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:167
    ElseIf auiMenuItemID == menuItemID_Deactivate01 ; #DEBUG_LINE_NO:168
      Int i = 0 ; #DEBUG_LINE_NO:170
      While i < actorArray.Length ; #DEBUG_LINE_NO:171
        robotpodscript therobotpodactor = actorArray[i] as robotpodscript ; #DEBUG_LINE_NO:172
        If therobotpodactor ; #DEBUG_LINE_NO:173
          therobotpodactor.SendRobotToPod() ; #DEBUG_LINE_NO:174
        Else ; #DEBUG_LINE_NO:
          actorArray[i].SetUnconscious(True) ; #DEBUG_LINE_NO:176
        EndIf ; #DEBUG_LINE_NO:
        SQ_Parent.SendNativeTerminalActorUnconsciousEvent(akTerminalRef, actorArray[i], True) ; #DEBUG_LINE_NO:179
        i += 1 ; #DEBUG_LINE_NO:180
      EndWhile ; #DEBUG_LINE_NO:
      Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:183
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akTerminalBase == NativeTerminalRobotFriendSettings ; #DEBUG_LINE_NO:185
    If auiMenuItemID == menuItemID_Ally01 ; #DEBUG_LINE_NO:186
      Int i = 0 ; #DEBUG_LINE_NO:187
      While i < actorArray.Length ; #DEBUG_LINE_NO:189
        Actor theActor = actorArray[i] ; #DEBUG_LINE_NO:190
        theActor.RemoveFromAllFactions() ; #DEBUG_LINE_NO:192
        theActor.SetPlayerTeammate(True, False, False) ; #DEBUG_LINE_NO:194
        theActor.AddToFaction(NativeTerminalRobotAllyFaction) ; #DEBUG_LINE_NO:195
        theActor.StopCombat() ; #DEBUG_LINE_NO:197
        SQ_Parent.SendNativeTerminalActorAllyEvent(akTerminalRef, actorArray[i]) ; #DEBUG_LINE_NO:199
        i += 1 ; #DEBUG_LINE_NO:200
      EndWhile ; #DEBUG_LINE_NO:
      Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:203
    EndIf ; #DEBUG_LINE_NO:
  ElseIf akTerminalBase == NativeTerminalRobotFrenzy ; #DEBUG_LINE_NO:205
    If auiMenuItemID == menuItemID_Frenzy01 ; #DEBUG_LINE_NO:207
      Int i = 0 ; #DEBUG_LINE_NO:208
      While i < actorArray.Length ; #DEBUG_LINE_NO:209
        actorArray[i].SetValue(Aggression, 3.0) ; #DEBUG_LINE_NO:210
        SQ_Parent.SendNativeTerminalActorFrenzyEvent(akTerminalRef, actorArray[i]) ; #DEBUG_LINE_NO:212
        i += 1 ; #DEBUG_LINE_NO:213
      EndWhile ; #DEBUG_LINE_NO:
      Self.UpdateAllTerminalVariables(akTerminalRef) ; #DEBUG_LINE_NO:216
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
