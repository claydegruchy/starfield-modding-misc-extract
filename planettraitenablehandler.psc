ScriptName PlanetTraitEnableHandler Extends ObjectReference

;-- Variables ---------------------------------------
Keyword ChosenTraitToEnable

;-- Properties --------------------------------------
Keyword Property PlanetTrait13GaseousFont Auto Const mandatory
Keyword Property PlanetTrait17PrimordialNetwork Auto Const mandatory
planet Property TestPlanet Auto mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Self.HandleTraitEnabling() ; #DEBUG_LINE_NO:11
EndEvent

Function HandleTraitEnabling()
  Keyword[] ThisPlanetsTraits = None ; #DEBUG_LINE_NO:18
  Keyword[] MatchingTraitsWithThisPlanet = new Keyword[0] ; #DEBUG_LINE_NO:19
  If ChosenTraitToEnable == None ; #DEBUG_LINE_NO:21
    ThisPlanetsTraits = Self.GetCurrentPlanet().GetKeywordTypeList(44) ; #DEBUG_LINE_NO:23
    Int CountMatchingTraits = 0 ; #DEBUG_LINE_NO:26
    While CountMatchingTraits < ThisPlanetsTraits.Length ; #DEBUG_LINE_NO:27
      Keyword currentKeyword = ThisPlanetsTraits[CountMatchingTraits] ; #DEBUG_LINE_NO:28
      If Self.GetRefsLinkedToMe(currentKeyword, None).Length > 0 ; #DEBUG_LINE_NO:29
        MatchingTraitsWithThisPlanet.add(currentKeyword, 1) ; #DEBUG_LINE_NO:30
      EndIf ; #DEBUG_LINE_NO:
      CountMatchingTraits += 1 ; #DEBUG_LINE_NO:35
    EndWhile ; #DEBUG_LINE_NO:
    If MatchingTraitsWithThisPlanet.Length > 1 ; #DEBUG_LINE_NO:40
      Int RandomlySelectedTrait = Utility.RandomInt(MatchingTraitsWithThisPlanet.Length, 100) ; #DEBUG_LINE_NO:41
      ChosenTraitToEnable = MatchingTraitsWithThisPlanet[RandomlySelectedTrait] ; #DEBUG_LINE_NO:42
    Else ; #DEBUG_LINE_NO:
      Self.GetRefsLinkedToMe(MatchingTraitsWithThisPlanet[0], None)[0].EnableNoWait(False) ; #DEBUG_LINE_NO:45
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction
