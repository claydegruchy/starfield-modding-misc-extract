ScriptName Fragments:Scenes:SF_Cam_HLoopStart_0005512D Extends Scene Const hidden

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
ReferenceAlias Property NA_TransitTrack Auto Const
ReferenceAlias Property NA_TransitTrack02 Auto Const
wwiseevent Property SoundTramDepartEvent Auto Const
wwiseevent Property SoundTramArriveEvent Auto Const
MusicType Property MUSGenesisStingerCutsceneTransitionTEST Auto Const mandatory
Quest Property MQ101 Auto Const mandatory
ReferenceAlias Property Vasco Auto Const
ObjectReference Property UC_NAT_EmbassyFollowerMarker Auto Const mandatory
ObjectReference Property NA_NAT_SpaceportMarkerRef Auto Const mandatory
ObjectReference Property NA_NAT_MASTMarkerRef Auto Const mandatory
ObjectReference Property NA_NAT_ResidentialMarkerREF Auto Const mandatory
ObjectReference Property NA_NAT_CommercialMarkerREF Auto Const mandatory
ObjectReference Property UC04_Player_NATTeleportMarker_Stage610 Auto Const mandatory
ReferenceAlias Property NA_TransitMASTHelper Auto Const
ReferenceAlias Property NA_TransitCommercialHelper Auto Const
ReferenceAlias Property NA_TransitResidentialHelper Auto Const

;-- Functions ---------------------------------------

Function Fragment_Phase_01_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript ; #DEBUG_LINE_NO:7
  kmyQuest.Travel(UC04_Player_NATTeleportMarker_Stage610) ; #DEBUG_LINE_NO:10
EndFunction

Function Fragment_Phase_02_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript ; #DEBUG_LINE_NO:18
  kmyQuest.Travel(NA_NAT_MASTMarkerRef) ; #DEBUG_LINE_NO:21
EndFunction

Function Fragment_Phase_03_Begin()
  NA_TransitTrack.getref().PlayAnimation("Depart") ; #DEBUG_LINE_NO:29
  NA_TransitTrack.getref().PlayAnimation("Stage2") ; #DEBUG_LINE_NO:31
EndFunction

Function Fragment_Phase_04_Begin()
  NA_TransitMASTHelper.getref().PlayAnimation("Depart") ; #DEBUG_LINE_NO:39
EndFunction

Function Fragment_Phase_05_Begin()
  NA_TransitResidentialHelper.getref().PlayAnimation("Depart") ; #DEBUG_LINE_NO:48
EndFunction

Function Fragment_Phase_06_Begin()
  NA_TransitCommercialHelper.getref().PlayAnimation("Depart") ; #DEBUG_LINE_NO:57
EndFunction

Function Fragment_Phase_07_Begin()
  NA_TransitTrack.getref().PlayAnimation("Arrive") ; #DEBUG_LINE_NO:66
EndFunction

Function Fragment_Phase_07_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript ; #DEBUG_LINE_NO:75
  kmyQuest.Travel(NA_NAT_SpaceportMarkerRef) ; #DEBUG_LINE_NO:78
EndFunction

Function Fragment_Phase_08_Begin()
  NA_TransitMASTHelper.getref().PlayAnimation("Arrive") ; #DEBUG_LINE_NO:86
EndFunction

Function Fragment_Phase_08_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript ; #DEBUG_LINE_NO:95
  kmyQuest.Travel(NA_NAT_MASTMarkerRef) ; #DEBUG_LINE_NO:101
EndFunction

Function Fragment_Phase_09_Begin()
  NA_TransitResidentialHelper.getref().PlayAnimation("Arrive") ; #DEBUG_LINE_NO:109
EndFunction

Function Fragment_Phase_09_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript ; #DEBUG_LINE_NO:118
  kmyQuest.Travel(NA_NAT_ResidentialMarkerREF) ; #DEBUG_LINE_NO:121
EndFunction

Function Fragment_Phase_10_Begin()
  NA_TransitCommercialHelper.getref().PlayAnimation("Arrive") ; #DEBUG_LINE_NO:129
EndFunction

Function Fragment_Phase_10_End()
  citynewatlantistransitcontrolscript kmyQuest = Self.GetOwningQuest() as citynewatlantistransitcontrolscript ; #DEBUG_LINE_NO:138
  kmyQuest.Travel(NA_NAT_CommercialMarkerREF) ; #DEBUG_LINE_NO:141
EndFunction
