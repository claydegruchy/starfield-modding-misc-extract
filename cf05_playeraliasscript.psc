ScriptName CF05_PlayerAliasScript Extends ReferenceAlias
{ This script handles the behavior of the player picking up items for this quest. }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Group QuestStageProperties
  Int Property iUCIDStage = 1011 Auto Const
  Int Property iEnsignUniformStage = 1021 Auto Const
  Int Property iCommandBayKeyCardStage = 1101 Auto Const
  Int Property iEngineeringBayKeyCardStage = 1501 Auto Const
  Int Property iPilotUniformStage = 1711 Auto Const
  Int Property iDockingBayKeyCardStage = 1800 Auto Const
  Int Property iWearEnsignUniformObjective = 1030 Auto Const
  Int Property iTalkToSecurityGuardStage = 1040 Auto Const
  Int Property iWearPilotUniformObjective = 1720 Auto Const
  Int Property iWorePilotUniformStage = 1721 Auto Const
EndGroup

Key Property CF05_UCID_Elijah Auto Const mandatory
Key Property LC043_SY01CommandAccessKey Auto Const mandatory
Key Property LC043_SY02EngineeringAccessKey Auto Const mandatory
Key Property LC043_SY03DockingPortKey Auto Const mandatory
ReferenceAlias Property CF05_UCIDCard Auto Const mandatory
ReferenceAlias Property CF05_EnsignUniform Auto Const mandatory
ReferenceAlias Property CF05_CommandBayAccessCard Auto Const mandatory
ReferenceAlias Property CF05_PilotUniform Auto Const mandatory
Armor Property CF05_EnsignUniformArmor Auto Const mandatory
Armor Property CF05_EnsignUniformArmor02 Auto Const mandatory
Armor Property CF05_EnsignUniformArmor03 Auto Const mandatory
Armor Property CF05_Clothes_ScienceLabTec Auto Const mandatory
Armor Property CF05_PilotUniformArmor Auto Const mandatory
Faction Property LC043SYFaction Auto Const mandatory
Faction Property LC043SY01Faction Auto Const mandatory
Faction Property LC043SY02Faction Auto Const mandatory
Faction Property LC043SY03Faction Auto Const mandatory
Keyword Property CF05_EnsignArmorKeyword_Disguise Auto Const mandatory
Quest Property LC043 Auto Const mandatory

;-- Functions ---------------------------------------

Event OnItemEquipped(Form akBaseObject, ObjectReference akReference)
  If (akBaseObject == CF05_EnsignUniformArmor as Form) || (akBaseObject == CF05_PilotUniformArmor as Form) || (akBaseObject == CF05_EnsignUniformArmor02 as Form) || (akBaseObject == CF05_EnsignUniformArmor03 as Form) || (akBaseObject == CF05_Clothes_ScienceLabTec as Form) ; #DEBUG_LINE_NO:41
    Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:43
    Quest MyQuest = Self.GetOwningQuest() ; #DEBUG_LINE_NO:44
    If akBaseObject == CF05_EnsignUniformArmor as Form ; #DEBUG_LINE_NO:45
      If MyQuest.IsObjectiveDisplayed(iWearEnsignUniformObjective) ; #DEBUG_LINE_NO:46
        MyQuest.SetStage(iTalkToSecurityGuardStage) ; #DEBUG_LINE_NO:47
      EndIf ; #DEBUG_LINE_NO:
    ElseIf akBaseObject == CF05_PilotUniformArmor as Form ; #DEBUG_LINE_NO:49
      If MyQuest.IsObjectiveDisplayed(iWearPilotUniformObjective) ; #DEBUG_LINE_NO:50
        MyQuest.SetStage(iWorePilotUniformStage) ; #DEBUG_LINE_NO:51
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If !LC043.GetStageDone(150) ; #DEBUG_LINE_NO:56
      PlayerRef.AddToFaction(LC043SY01Faction) ; #DEBUG_LINE_NO:57
    EndIf ; #DEBUG_LINE_NO:
    If !LC043.GetStageDone(250) ; #DEBUG_LINE_NO:59
      PlayerRef.AddToFaction(LC043SY02Faction) ; #DEBUG_LINE_NO:60
    EndIf ; #DEBUG_LINE_NO:
    If !LC043.GetStageDone(350) ; #DEBUG_LINE_NO:62
      PlayerRef.AddToFaction(LC043SY03Faction) ; #DEBUG_LINE_NO:63
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnItemUnequipped(Form akBaseObject, ObjectReference akReference)
  If (akBaseObject == CF05_EnsignUniformArmor as Form) || (akBaseObject == CF05_PilotUniformArmor as Form) || (akBaseObject == CF05_EnsignUniformArmor02 as Form) || (akBaseObject == CF05_EnsignUniformArmor03 as Form) || (akBaseObject == CF05_Clothes_ScienceLabTec as Form) ; #DEBUG_LINE_NO:71
    Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:73
    If !PlayerRef.WornHasKeyword(CF05_EnsignArmorKeyword_Disguise) ; #DEBUG_LINE_NO:74
      PlayerRef.RemoveFromFaction(LC043SYFaction) ; #DEBUG_LINE_NO:75
      PlayerRef.RemoveFromFaction(LC043SY01Faction) ; #DEBUG_LINE_NO:76
      PlayerRef.RemoveFromFaction(LC043SY02Faction) ; #DEBUG_LINE_NO:77
      PlayerRef.RemoveFromFaction(LC043SY03Faction) ; #DEBUG_LINE_NO:78
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
