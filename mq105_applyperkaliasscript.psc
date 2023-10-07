ScriptName MQ105_ApplyPerkAliasScript Extends ReferenceAlias

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Perk Property MQ105_CompanionStealth Auto Const mandatory
{ Perk to apply to the NPC }

;-- Functions ---------------------------------------

Event OnAliasInit()
  Actor currAct = Self.GetActorRef() ; #DEBUG_LINE_NO:7
  If currAct != None ; #DEBUG_LINE_NO:8
    currAct.AddPerk(MQ105_CompanionStealth, False) ; #DEBUG_LINE_NO:9
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasChanged(ObjectReference akObject, Bool abRemove)
  Actor currAct = akObject as Actor ; #DEBUG_LINE_NO:14
  If currAct != None ; #DEBUG_LINE_NO:15
    If abRemove ; #DEBUG_LINE_NO:16
      If currAct.HasPerk(MQ105_CompanionStealth) ; #DEBUG_LINE_NO:17
        currAct.RemovePerk(MQ105_CompanionStealth) ; #DEBUG_LINE_NO:18
      EndIf ; #DEBUG_LINE_NO:
    ElseIf !currAct.HasPerk(MQ105_CompanionStealth) ; #DEBUG_LINE_NO:21
      currAct.AddPerk(MQ105_CompanionStealth, False) ; #DEBUG_LINE_NO:22
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnAliasShutdown()
  Actor currAct = Self.GetActorRef() ; #DEBUG_LINE_NO:29
  If currAct != None && currAct.HasPerk(MQ105_CompanionStealth) ; #DEBUG_LINE_NO:30
    currAct.RemovePerk(MQ105_CompanionStealth) ; #DEBUG_LINE_NO:31
  EndIf ; #DEBUG_LINE_NO:
EndEvent
