ScriptName CraftingScript Extends Quest
{ Script attached to Crafting Quest. Has properties and debug quest stages for Crafting and Item Modification }

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Actor Property PlayerRef Auto
Perk Property cpl_CompLvlChemical2 Auto
Perk Property cpl_CompLvlChemical3 Auto
Perk Property cpl_CompLvlMetallic2 Auto
Perk Property cpl_CompLvlMetallic3 Auto
Perk Property cpl_CompLvlOrganic2 Auto
Perk Property cpl_CompLvlOrganic3 Auto
Perk Property cpl_CompLvlTechnical2 Auto
Perk Property cpl_CompLvlTechnical3 Auto
Perk[] Property Chemical Auto
Perk[] Property Metallic Auto
Perk[] Property Organic Auto
Perk[] Property Technical Auto

;-- Functions ---------------------------------------

Function ResetComponentLevels()
  PlayerRef.RemovePerk(cpl_CompLvlChemical2) ; #DEBUG_LINE_NO:26
  PlayerRef.RemovePerk(cpl_CompLvlChemical3) ; #DEBUG_LINE_NO:27
  PlayerRef.RemovePerk(cpl_CompLvlMetallic2) ; #DEBUG_LINE_NO:28
  PlayerRef.RemovePerk(cpl_CompLvlMetallic3) ; #DEBUG_LINE_NO:29
  PlayerRef.RemovePerk(cpl_CompLvlOrganic2) ; #DEBUG_LINE_NO:30
  PlayerRef.RemovePerk(cpl_CompLvlOrganic3) ; #DEBUG_LINE_NO:31
  PlayerRef.RemovePerk(cpl_CompLvlTechnical2) ; #DEBUG_LINE_NO:32
  PlayerRef.RemovePerk(cpl_CompLvlTechnical3) ; #DEBUG_LINE_NO:33
EndFunction

Function UnlockComponentLevel(Perk[] akComponent, Int NewLevel)
  NewLevel -= 2 ; #DEBUG_LINE_NO:39
  Perk PerkToAdd = akComponent[NewLevel] ; #DEBUG_LINE_NO:41
  PlayerRef.AddPerk(PerkToAdd, False) ; #DEBUG_LINE_NO:44
EndFunction
