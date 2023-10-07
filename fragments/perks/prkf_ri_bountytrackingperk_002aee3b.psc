ScriptName Fragments:Perks:PRKF_RI_BountyTrackingPerk_002AEE3B Extends Perk Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Quest Property RI_Support Auto Const mandatory
Quest Property RIR01 Auto Const mandatory
Quest Property RIR02 Auto Const mandatory
Quest Property RIR03 Auto Const mandatory
Quest Property RIR04 Auto Const mandatory
Quest Property RIR05 Auto Const mandatory
Quest Property RIR07 Auto Const mandatory
Quest Property RI02 Auto Const mandatory
Quest Property RI03 Auto Const mandatory
Quest Property RI04 Auto Const mandatory
Quest Property RI06 Auto Const mandatory
Quest Property RI07 Auto Const mandatory
Quest Property MB_Hack01_RIR01 Auto Const mandatory
Quest Property MB_PlantEvidence01_RIR02 Auto Const mandatory
Quest Property MB_Sabotage01_RIR04 Auto Const mandatory

;-- Functions ---------------------------------------

Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR01) ; #DEBUG_LINE_NO:8
EndFunction

Function Fragment_Entry_01(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR02) ; #DEBUG_LINE_NO:17
EndFunction

Function Fragment_Entry_02(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR03) ; #DEBUG_LINE_NO:26
EndFunction

Function Fragment_Entry_03(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR04) ; #DEBUG_LINE_NO:35
EndFunction

Function Fragment_Entry_04(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR05) ; #DEBUG_LINE_NO:44
EndFunction

Function Fragment_Entry_05(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RIR07) ; #DEBUG_LINE_NO:53
EndFunction

Function Fragment_Entry_06(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI02) ; #DEBUG_LINE_NO:62
EndFunction

Function Fragment_Entry_07(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI03) ; #DEBUG_LINE_NO:71
EndFunction

Function Fragment_Entry_08(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI04) ; #DEBUG_LINE_NO:80
EndFunction

Function Fragment_Entry_09(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI06) ; #DEBUG_LINE_NO:89
EndFunction

Function Fragment_Entry_10(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(RI07) ; #DEBUG_LINE_NO:98
EndFunction

Function Fragment_Entry_11(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(MB_Hack01_RIR01) ; #DEBUG_LINE_NO:107
EndFunction

Function Fragment_Entry_12(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(MB_PlantEvidence01_RIR02) ; #DEBUG_LINE_NO:116
EndFunction

Function Fragment_Entry_13(ObjectReference akTargetRef, Actor akActor)
  (RI_Support as ri_radiantsupportquestscript).BountyReceived(MB_Sabotage01_RIR04) ; #DEBUG_LINE_NO:125
EndFunction
