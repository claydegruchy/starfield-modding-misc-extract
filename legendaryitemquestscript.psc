ScriptName LegendaryItemQuestScript Extends Quest

;-- Structs -----------------------------------------
Struct AmmoDatum
  Ammo AmmoType
  LeveledItem AmmoLeveledList
  Int Count = 1
EndStruct

Struct LegendaryModRule
  objectmod LegendaryObjectMod
  { A legendary Object Mod
Filter: "mod_Legendary" }
  FormList AllowedKeywords
  { Formlist of keywords ANY of which present on the item means this mod may be added
Note: if none of these keywords are present, the mod can't be added to that item }
  FormList DisallowedKeywords
  { Formlist of keywords ANY of which present on the item means this mod may not be added
Note: this trumps AllowedKeywords }
  Bool AllowGrenades = False
  { Default: false; if true this mod is allowed on grenades }
EndStruct


;-- Variables ---------------------------------------
objectmod[] PreviouslySpawnedMods

;-- Properties --------------------------------------
LeveledItem Property LGND_PossibleLegendaryItemBaseLists Auto Const
{ AUTOFILL
Leveled list holding all the base LL_<Item> lists to use to generate Legendary items }
ActorValue Property SpawnedLegendaryItem Auto Const
{ AUTOFILL used as a "do once" for spawning without having to have the spawning script store a variable }
legendaryitemquestscript:legendarymodrule[] Property LegendaryModRules Auto
{ After the weapon is spawned, check these rules, then add an appropriate legendary mod }
legendaryitemquestscript:ammodatum[] Property AmmoData Auto Const
{ Used to add the correct leveled list of ammo that the spawned item uses }
Int Property iEventType_Starting = 1 Auto Const hidden
Int Property iEventType_Finishing = 2 Auto Const hidden
Int Property iEventType_OnHit = 3 Auto Const hidden
FormList Property WeaponTypeGrenadesKeywordList Auto Const mandatory
{ autofill }

;-- Functions ---------------------------------------

Event OnQuestStarted()
  PreviouslySpawnedMods = new objectmod[0] ; #DEBUG_LINE_NO:59
EndEvent

Function SendLegendaryMagicEffectEvent(Var[] kArgs)
  Self.SendCustomEvent("legendaryitemquestscript_LegendaryMagicEffectEvent", kArgs) ; #DEBUG_LINE_NO:68
EndFunction

ObjectReference Function GenerateLegendaryItem(ObjectReference ObjectToSpawnIn, LeveledItem LeveledListOfItemsToSpawn, FormList ListOfSpecificModsToChooseFrom, FormList ListOfSpecificModsToDisallow)
  LeveledItem spawnList = None ; #DEBUG_LINE_NO:79
  If LeveledListOfItemsToSpawn ; #DEBUG_LINE_NO:81
    spawnList = LeveledListOfItemsToSpawn ; #DEBUG_LINE_NO:82
  Else ; #DEBUG_LINE_NO:
    spawnList = LGND_PossibleLegendaryItemBaseLists ; #DEBUG_LINE_NO:86
  EndIf ; #DEBUG_LINE_NO:
  If ObjectToSpawnIn.GetValue(SpawnedLegendaryItem) > 0.0 ; #DEBUG_LINE_NO:92
    Return None ; #DEBUG_LINE_NO:94
  EndIf ; #DEBUG_LINE_NO:
  ObjectToSpawnIn.SetValue(SpawnedLegendaryItem, 1.0) ; #DEBUG_LINE_NO:97
  ObjectReference item = ObjectToSpawnIn.PlaceAtMe(spawnList as Form, 1, False, True, False, None, None, True) ; #DEBUG_LINE_NO:99
  If item ; #DEBUG_LINE_NO:
     ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  Self.AddLegendaryMod(item, ListOfSpecificModsToChooseFrom, ListOfSpecificModsToDisallow) ; #DEBUG_LINE_NO:107
  Weapon itemWeapon = item.GetBaseObject() as Weapon ; #DEBUG_LINE_NO:112
  If itemWeapon ; #DEBUG_LINE_NO:114
    Ammo itemAmmo = itemWeapon.GetAmmo() ; #DEBUG_LINE_NO:115
    If itemAmmo ; #DEBUG_LINE_NO:116
      Int I = AmmoData.findstruct("AmmoType", itemAmmo, 0) ; #DEBUG_LINE_NO:117
      If I >= 0 ; #DEBUG_LINE_NO:118
        legendaryitemquestscript:ammodatum itemWeaponAmmoDatum = AmmoData[I] ; #DEBUG_LINE_NO:119
        ObjectToSpawnIn.addItem(itemWeaponAmmoDatum.AmmoLeveledList as Form, itemWeaponAmmoDatum.Count, False) ; #DEBUG_LINE_NO:122
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  ObjectToSpawnIn.addItem(item as Form, 1, False) ; #DEBUG_LINE_NO:129
  item.enable(False) ; #DEBUG_LINE_NO:131
  Return item ; #DEBUG_LINE_NO:132
EndFunction

Function AddLegendaryMod(ObjectReference item, FormList ListOfSpecificModsToChooseFrom, FormList ListOfSpecificModsToDisallow)
  objectmod[] AllowedMods = Self.GetAllowedMods(item, ListOfSpecificModsToChooseFrom, ListOfSpecificModsToDisallow) ; #DEBUG_LINE_NO:142
  objectmod[] PreferredMods = new objectmod[0] ; #DEBUG_LINE_NO:144
  Int I = 0 ; #DEBUG_LINE_NO:147
  While I < AllowedMods.Length ; #DEBUG_LINE_NO:148
    If PreviouslySpawnedMods.find(AllowedMods[I], 0) < 0 ; #DEBUG_LINE_NO:149
      PreferredMods.add(AllowedMods[I], 1) ; #DEBUG_LINE_NO:152
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:155
  EndWhile ; #DEBUG_LINE_NO:
  If PreferredMods.Length == 0 ; #DEBUG_LINE_NO:159
    PreviouslySpawnedMods.clear() ; #DEBUG_LINE_NO:161
    PreferredMods = AllowedMods ; #DEBUG_LINE_NO:162
  EndIf ; #DEBUG_LINE_NO:
  Int max = PreferredMods.Length ; #DEBUG_LINE_NO:173
  If max > 0 ; #DEBUG_LINE_NO:174
    Int dieRoll = Utility.RandomInt(0, max - 1) ; #DEBUG_LINE_NO:175
    objectmod legendaryMod = PreferredMods[dieRoll] ; #DEBUG_LINE_NO:177
    PreviouslySpawnedMods.add(legendaryMod, 1) ; #DEBUG_LINE_NO:179
    Bool success = item.AttachMod(legendaryMod, 0) ; #DEBUG_LINE_NO:184
    If success == False ; #DEBUG_LINE_NO:186
       ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndFunction

objectmod[] Function GetAllowedMods(ObjectReference item, FormList ListOfSpecificModsToChooseFrom, FormList ListOfSpecificModsToDisallow)
  objectmod[] AllowedMods = new objectmod[0] ; #DEBUG_LINE_NO:203
  Int I = 0 ; #DEBUG_LINE_NO:205
  While I < LegendaryModRules.Length ; #DEBUG_LINE_NO:206
    legendaryitemquestscript:legendarymodrule Rule = LegendaryModRules[I] ; #DEBUG_LINE_NO:207
    objectmod ModToConsider = Rule.LegendaryObjectMod ; #DEBUG_LINE_NO:208
    Bool continue = !item.HasKeywordInFormList(WeaponTypeGrenadesKeywordList) || Rule.AllowGrenades ; #DEBUG_LINE_NO:212
    continue = continue && (!ListOfSpecificModsToDisallow || ListOfSpecificModsToDisallow.Find(ModToConsider as Form) <= -1) ; #DEBUG_LINE_NO:213
    continue = continue && (!ListOfSpecificModsToChooseFrom || ListOfSpecificModsToChooseFrom.Find(ModToConsider as Form) >= 0) ; #DEBUG_LINE_NO:214
    If Rule.AllowedKeywords ; #DEBUG_LINE_NO:216
      continue = continue && item.HasKeywordInFormList(Rule.AllowedKeywords) ; #DEBUG_LINE_NO:217
    EndIf ; #DEBUG_LINE_NO:
    If Rule.DisallowedKeywords ; #DEBUG_LINE_NO:220
      continue = continue && !item.HasKeywordInFormList(Rule.DisallowedKeywords) ; #DEBUG_LINE_NO:221
    EndIf ; #DEBUG_LINE_NO:
    continue = continue && ModToConsider as Bool ; #DEBUG_LINE_NO:224
    If continue ; #DEBUG_LINE_NO:226
      AllowedMods.add(ModToConsider, 1) ; #DEBUG_LINE_NO:228
    EndIf ; #DEBUG_LINE_NO:
    I += 1 ; #DEBUG_LINE_NO:233
  EndWhile ; #DEBUG_LINE_NO:
  Return AllowedMods ; #DEBUG_LINE_NO:238
EndFunction
