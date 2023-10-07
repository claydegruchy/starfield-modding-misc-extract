ScriptName RIR03_QuestScript Extends Quest

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword Property RI_Outfit_BusinessAttireKeyword Auto Const mandatory
Keyword Property RI_Outfit_FCGuardAttireKeyword Auto Const mandatory
Keyword Property RI_Outfit_UCGuardAttireKeyword Auto Const mandatory
Keyword Property RI_Outfit_MiscGuardAttireKeyword Auto Const mandatory
Keyword Property RI_Outfit_NeonGuardAttireKeyword Auto Const mandatory
Int Property iStageToSet Auto Const mandatory

;-- Functions ---------------------------------------

Function CheckPlayer()
  Actor PlayerRef = Game.GetPlayer() ; #DEBUG_LINE_NO:14
  If PlayerRef.WornHasKeyword(RI_Outfit_BusinessAttireKeyword) || PlayerRef.WornHasKeyword(RI_Outfit_FCGuardAttireKeyword) || PlayerRef.WornHasKeyword(RI_Outfit_UCGuardAttireKeyword) || PlayerRef.WornHasKeyword(RI_Outfit_NeonGuardAttireKeyword) || PlayerRef.WornHasKeyword(RI_Outfit_MiscGuardAttireKeyword) ; #DEBUG_LINE_NO:16
    Self.SetStage(iStageToSet) ; #DEBUG_LINE_NO:18
  EndIf ; #DEBUG_LINE_NO:
EndFunction
