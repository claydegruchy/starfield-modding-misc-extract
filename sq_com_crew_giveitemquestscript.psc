ScriptName SQ_COM_CREW_GiveItemQuestScript Extends Quest
{ attached to SQ_Crew quest }

;-- Structs -----------------------------------------
Struct SkillDatum
  Perk GiveItemSkill
  { a perk on crew that will give the player items after exploring types of planets/locations }
  conditionform Conditions
  { conditions that when true (checked on change location) will grant items to give the player upon returning to the ship }
EndStruct


;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group Properties
  sq_com_crew_giveitemquestscript:skilldatum[] Property SkillData Auto Const mandatory
  Float Property DistanceFromShip = 100.0 Auto Const
  { how far must the skill holder be from the ship before we check Conditions to determine if they have items to give to player - ie: how far must they adventure to emulate them having a chance to find stuff? }
EndGroup


;-- Functions ---------------------------------------

Bool Function CheckGiveItemConditions(Actor ActorToCheck)
  Bool passedDistanceCheck = ActorToCheck.GetDistance(Game.GetPlayerHomeSpaceShip() as ObjectReference) >= DistanceFromShip ; #DEBUG_LINE_NO:21
  Bool passedSkillAndConditionsCheck = False ; #DEBUG_LINE_NO:25
  If passedDistanceCheck ; #DEBUG_LINE_NO:26
    Int I = 0 ; #DEBUG_LINE_NO:29
    While I < SkillData.Length && passedSkillAndConditionsCheck == False ; #DEBUG_LINE_NO:30
      sq_com_crew_giveitemquestscript:skilldatum currentSkillDatum = SkillData[I] ; #DEBUG_LINE_NO:31
      Bool hasSkillPerk = ActorToCheck.HasPerk(currentSkillDatum.GiveItemSkill) ; #DEBUG_LINE_NO:33
      Bool passedConditions = False ; #DEBUG_LINE_NO:36
      If hasSkillPerk ; #DEBUG_LINE_NO:37
        passedConditions = currentSkillDatum.Conditions.IsTrue(ActorToCheck as ObjectReference, None) ; #DEBUG_LINE_NO:38
      EndIf ; #DEBUG_LINE_NO:
      If hasSkillPerk && passedConditions ; #DEBUG_LINE_NO:42
        passedSkillAndConditionsCheck = True ; #DEBUG_LINE_NO:43
      EndIf ; #DEBUG_LINE_NO:
      I += 1 ; #DEBUG_LINE_NO:46
    EndWhile ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Return passedDistanceCheck && passedSkillAndConditionsCheck ; #DEBUG_LINE_NO:52
EndFunction

Bool Function Trace(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return Debug.TraceLog(CallingObject, asTextToPrint, MainLogName, SubLogName, aiSeverity, bShowNormalTrace, bShowWarning, bPrefixTraceWithLogNames, True) ; #DEBUG_LINE_NO:60
EndFunction

; Fixup hacks for debug-only function: warning
Bool Function warning(ScriptObject CallingObject, String asTextToPrint, Int aiSeverity, String MainLogName, String SubLogName, Bool bShowNormalTrace, Bool bShowWarning, Bool bPrefixTraceWithLogNames)
  Return false ; #DEBUG_LINE_NO:64
EndFunction
