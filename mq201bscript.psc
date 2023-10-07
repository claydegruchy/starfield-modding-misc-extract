ScriptName MQ201BScript Extends Quest

;-- Variables ---------------------------------------
ObjectReference AndrejaHomeMarker
ObjectReference BarrettHomeMarker
ObjectReference CoraHomeMarker
ObjectReference SamHomeMarker
ObjectReference SarahHomeMarker

;-- Properties --------------------------------------
Faction Property AvailableCompanionFaction Auto Const mandatory
Keyword Property LinkHome Auto Const mandatory
ObjectReference Property EyeHomeMarker Auto Const mandatory
ReferenceAlias Property Andreja Auto Const mandatory
ReferenceAlias Property Barrett Auto Const mandatory
ReferenceAlias Property SamCoe Auto Const mandatory
ReferenceAlias Property CoraCoe Auto Const mandatory
ReferenceAlias Property SarahMorgan Auto Const mandatory
GlobalVariable Property COM_CompanionID_Andreja Auto Const mandatory
GlobalVariable Property COM_CompanionID_Barrett Auto Const mandatory
GlobalVariable Property COM_CompanionID_SamCoe Auto Const mandatory
GlobalVariable Property COM_CompanionID_SarahMorgan Auto Const mandatory
GlobalVariable Property MQ_CompanionAtEye Auto Const mandatory
GlobalVariable Property MQ_CompanionAtLodge Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtEye Auto Const mandatory
ReferenceAlias Property MQ00_CompanionAtLodge Auto Const mandatory
Quest Property SQ_Companions Auto Const mandatory
ActorValue Property COM_AffinityLevel Auto Const mandatory
ActorValue Property COM_Affinity Auto Const mandatory

;-- Functions ---------------------------------------

Function SetCompanionsAtRisk()
  companionactorscript[] CompanionActorArray = new companionactorscript[4] ; #DEBUG_LINE_NO:37
  CompanionActorArray[0] = SarahMorgan.GetActorRef() as companionactorscript ; #DEBUG_LINE_NO:39
  CompanionActorArray[1] = SamCoe.GetActorRef() as companionactorscript ; #DEBUG_LINE_NO:40
  CompanionActorArray[2] = Barrett.GetActorRef() as companionactorscript ; #DEBUG_LINE_NO:41
  CompanionActorArray[3] = Andreja.GetActorRef() as companionactorscript ; #DEBUG_LINE_NO:42
  (SQ_Companions as sq_companionsscript).SortCompanionArrayByAffinity(CompanionActorArray, True) ; #DEBUG_LINE_NO:45
  Self.SetCompanionAtEye(CompanionActorArray[0]) ; #DEBUG_LINE_NO:48
  Self.SetCompanionAtLodge(CompanionActorArray[1]) ; #DEBUG_LINE_NO:49
EndFunction

Function SetCompanionAtEye(companionactorscript Companion)
  MQ00_CompanionAtEye.ForceRefTo(Companion as ObjectReference) ; #DEBUG_LINE_NO:53
  Companion.SetGlobalToCompanionID(MQ_CompanionAtEye) ; #DEBUG_LINE_NO:54
EndFunction

Function SetCompanionAtLodge(companionactorscript Companion)
  MQ00_CompanionAtLodge.ForceRefTo(Companion as ObjectReference) ; #DEBUG_LINE_NO:58
  Companion.SetGlobalToCompanionID(MQ_CompanionAtLodge) ; #DEBUG_LINE_NO:59
EndFunction

Function SetCompanionsHomeLink()
  Actor AndrejaREF = Andreja.GetActorRef() ; #DEBUG_LINE_NO:64
  Actor BarrettREF = Barrett.GetActorRef() ; #DEBUG_LINE_NO:65
  Actor SamCoeREF = SamCoe.GetActorRef() ; #DEBUG_LINE_NO:66
  Actor SarahMorganREF = SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:67
  Actor CoraCoeREF = CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:68
  AndrejaHomeMarker = AndrejaREF.GetLinkedRef(LinkHome) ; #DEBUG_LINE_NO:70
  BarrettHomeMarker = BarrettREF.GetLinkedRef(LinkHome) ; #DEBUG_LINE_NO:71
  SamHomeMarker = SamCoeREF.GetLinkedRef(LinkHome) ; #DEBUG_LINE_NO:72
  CoraHomeMarker = CoraCoeREF.GetLinkedRef(LinkHome) ; #DEBUG_LINE_NO:73
  SarahHomeMarker = SarahMorganREF.GetLinkedRef(LinkHome) ; #DEBUG_LINE_NO:74
  AndrejaREF.SetLinkedRef(EyeHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:76
  BarrettREF.SetLinkedRef(EyeHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:77
  SamCoeREF.SetLinkedRef(EyeHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:78
  SarahMorganREF.SetLinkedRef(EyeHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:79
  CoraCoeREF.SetLinkedRef(EyeHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:80
EndFunction

Function ResetCompanionsHomeLink()
  Actor AndrejaREF = Andreja.GetActorRef() ; #DEBUG_LINE_NO:84
  Actor BarrettREF = Barrett.GetActorRef() ; #DEBUG_LINE_NO:85
  Actor SamCoeREF = SamCoe.GetActorRef() ; #DEBUG_LINE_NO:86
  Actor SarahMorganREF = SarahMorgan.GetActorRef() ; #DEBUG_LINE_NO:87
  Actor CoraCoeREF = CoraCoe.GetActorRef() ; #DEBUG_LINE_NO:88
  AndrejaREF.SetLinkedRef(AndrejaHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:90
  BarrettREF.SetLinkedRef(BarrettHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:91
  SamCoeREF.SetLinkedRef(SamHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:92
  SarahMorganREF.SetLinkedRef(SarahHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:93
  CoraCoeREF.SetLinkedRef(CoraHomeMarker, LinkHome, True) ; #DEBUG_LINE_NO:94
EndFunction
