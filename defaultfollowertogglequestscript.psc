ScriptName DefaultFollowerToggleQuestScript Extends Quest default
{ Attach to quest where you have a follower you want to control follower state on using conditions various triggering events.

You can also call this function to trigger a check and toggle accordingly:
CheckConditions() }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Autofill_Properites
  sq_followersscript Property SQ_Followers Auto Const mandatory
EndGroup

Group Properties
  ReferenceAlias Property PotentialFollower Auto Const mandatory
  { An alias holding an actor that should toggle between being a player follower and not being one. }
  conditionform Property FollowConditions Auto Const mandatory
  { ConditionForm that is evaluated for when the actor should become a follower }
  Bool Property FollowConditions_RequiredOutput = True Auto Const
  { What do FollowConditions need to evaulate for actor to become a follower?
	
	If true (default), actor becomes a follower when FollowConditions evaluate true
    if false, actor becomes a follower when FollowConditions evaluate false }
  conditionform Property StopFollowConditions Auto Const mandatory
  { ConditionForm that is evaluated for when the actor should stop being a follower.
NOTE: normally this will be THE SAME condition form as the FollowConditions (See StopFollowConditions_RequiredOutput below for why) }
  Bool Property StopFollowConditions_RequiredOutput = False Auto Const
  { What do StopFollowConditions need to evaulate for actor to stop being a follower?
		
	If false (default), actor stops being a follower when StopFollow_Conditions evaluate false
    if true, actor stops being a follower when StopFollow_Conditions evaluate true
	NOTE: A value of false (default) lets you use the same condition form for both Follow and StopFollow as a mutally exclusive toggle) }
  Bool Property Triggering_OnQuestInit = True Auto Const
  { If true (default), will evaluate Conditions when the quest inits) }
  LocationAlias[] Property Triggering_LocationAliases Auto Const
  { player entering or leaving these locations will evaluate Conditions. Example: dungeon location }
  ReferenceAlias[] Property Triggering_ActivationRefAliases Auto Const
  { player activating any of these references will evaluate Conditions. Example: a door. }
  ReferenceAlias[] Property Triggering_EnterLeaveRefAliases Auto Const
  { player entering or leaving any of these references will evaluate Conditions. Example: a trigger box. }
  Int[] Property Triggering_Stages Auto Const
  { Quest being set to any of these stages will evaluate Conditions. }
  Bool Property Trigger_AnyLocation Auto Const
  { Normally you will use Triggering_LocationAliases to specify, but if you have complex conditions, like when you are in any location on a particular planet, etc.
	You can use this to test conditions anytime the player changes location }
  Bool Property TeleportToPlayerOnStartFollow Auto Const
  { If true, whenever conditions are checked, if the PotentialFollower is far away and FollowConditions are true, they will be moveto'd the player. }
  Float Property TeleportDistance = 100.0 Auto Const
  { if TeleportToPlayerOnStartFollow is true, PotentialFollower will be teleported to player if at or greater than this distance away }
  Bool Property SetUnavailableWhenStopFollow = False Auto Const
  { passed to SQ_Followers.SetRoleInactive as the AlsoSetUnavailable parameter - removes follower from AvailableFollowers collection }
EndGroup

Group Debug_Properties
  Bool Property ShowTraces = True Auto Const
  { (Default: false) If true, will trace to log. Must also have DefaultScriptFunction script compiled locally, or be loading debug archives. }
EndGroup


;-- Functions ---------------------------------------

Event OnQuestStarted()
  If Triggering_LocationAliases.Length > 0 || Trigger_AnyLocation == True ; #DEBUG_LINE_NO:72
    Self.RegisterForRemoteEvent(Game.GetPlayer() as ScriptObject, "OnLocationChange") ; #DEBUG_LINE_NO:73
  EndIf ; #DEBUG_LINE_NO:
  Int I = 0 ; #DEBUG_LINE_NO:76
  While I < Triggering_ActivationRefAliases.Length ; #DEBUG_LINE_NO:77
    ReferenceAlias myCurrentRef = Triggering_ActivationRefAliases[I] ; #DEBUG_LINE_NO:78
    Self.RegisterForRemoteEvent(myCurrentRef as ScriptObject, "OnActivate") ; #DEBUG_LINE_NO:79
    I += 1 ; #DEBUG_LINE_NO:80
  EndWhile ; #DEBUG_LINE_NO:
  I = 0 ; #DEBUG_LINE_NO:83
  While I < Triggering_EnterLeaveRefAliases.Length ; #DEBUG_LINE_NO:84
    ReferenceAlias myCurrentTrigger = Triggering_EnterLeaveRefAliases[I] ; #DEBUG_LINE_NO:85
    Self.RegisterForRemoteEvent(myCurrentTrigger as ScriptObject, "OnTriggerEnter") ; #DEBUG_LINE_NO:86
    Self.RegisterForRemoteEvent(myCurrentTrigger as ScriptObject, "OnTriggerLeave") ; #DEBUG_LINE_NO:87
    I += 1 ; #DEBUG_LINE_NO:88
  EndWhile ; #DEBUG_LINE_NO:
  If Triggering_OnQuestInit ; #DEBUG_LINE_NO:91
    Self.CheckConditions(None) ; #DEBUG_LINE_NO:92
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnStageSet(Int auiStageID, Int auiItemID)
  If Triggering_Stages.find(auiStageID, 0) >= 0 ; #DEBUG_LINE_NO:98
    Self.CheckConditions(None) ; #DEBUG_LINE_NO:99
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
  If akSender == Game.GetPlayer() ; #DEBUG_LINE_NO:104
    If Trigger_AnyLocation ; #DEBUG_LINE_NO:106
      Self.CheckConditions(None) ; #DEBUG_LINE_NO:107
    Else ; #DEBUG_LINE_NO:
      Int I = 0 ; #DEBUG_LINE_NO:109
      While I < Triggering_LocationAliases.Length ; #DEBUG_LINE_NO:110
        Location currentLocation = Triggering_LocationAliases[I].GetLocation() ; #DEBUG_LINE_NO:111
        If currentLocation == akOldLoc || currentLocation == akNewLoc ; #DEBUG_LINE_NO:113
          Self.CheckConditions(None) ; #DEBUG_LINE_NO:114
          I = Triggering_LocationAliases.Length ; #DEBUG_LINE_NO:115
        EndIf ; #DEBUG_LINE_NO:
        I += 1 ; #DEBUG_LINE_NO:118
      EndWhile ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event ReferenceAlias.OnActivate(ReferenceAlias akSender, ObjectReference akActionRef)
  Self.CheckConditionsIfPlayer(akSender, akActionRef) ; #DEBUG_LINE_NO:125
EndEvent

Event ReferenceAlias.OnTriggerEnter(ReferenceAlias akSender, ObjectReference akActionRef)
  Self.CheckConditionsIfPlayer(akSender, akActionRef) ; #DEBUG_LINE_NO:130
EndEvent

Event ReferenceAlias.OnTriggerLeave(ReferenceAlias akSender, ObjectReference akActionRef)
  Self.CheckConditionsIfPlayer(akSender, akActionRef) ; #DEBUG_LINE_NO:134
EndEvent

Function CheckConditionsIfPlayer(ReferenceAlias akSender, ObjectReference akActionRef)
  If akActionRef == Game.GetPlayer() as ObjectReference ; #DEBUG_LINE_NO:138
    Self.CheckConditions(akSender.GetReference()) ; #DEBUG_LINE_NO:139
  EndIf ; #DEBUG_LINE_NO:
EndFunction

Function CheckConditions(ObjectReference TargetRef)
  Actor potentialFollowerActor = PotentialFollower.GetActorReference() ; #DEBUG_LINE_NO:147
  Bool followConditions_Output = FollowConditions.IsTrue(potentialFollowerActor as ObjectReference, TargetRef) ; #DEBUG_LINE_NO:148
  Bool stopfollowConditions_Output = StopFollowConditions.IsTrue(potentialFollowerActor as ObjectReference, TargetRef) ; #DEBUG_LINE_NO:149
  Bool currentlyIsFollower = SQ_Followers.IsRoleActive(potentialFollowerActor) ; #DEBUG_LINE_NO:151
  If followConditions_Output == FollowConditions_RequiredOutput ; #DEBUG_LINE_NO:158
    SQ_Followers.SetRoleActive(potentialFollowerActor, True, True, 0.0, 0.0) ; #DEBUG_LINE_NO:159
    Actor playerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:160
    If currentlyIsFollower == False && TeleportToPlayerOnStartFollow && potentialFollowerActor.GetDistance(playerRef as ObjectReference) >= TeleportDistance ; #DEBUG_LINE_NO:161
      potentialFollowerActor.MoveTo(playerRef as ObjectReference, 0.0, 0.0, 0.0, True, False) ; #DEBUG_LINE_NO:163
    EndIf ; #DEBUG_LINE_NO:
  ElseIf stopfollowConditions_Output == StopFollowConditions_RequiredOutput ; #DEBUG_LINE_NO:165
    SQ_Followers.SetRoleInactive(potentialFollowerActor, True, SetUnavailableWhenStopFollow, False) ; #DEBUG_LINE_NO:166
  EndIf ; #DEBUG_LINE_NO:
EndFunction
