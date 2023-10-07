ScriptName TestMiningPrototype02Script Extends ObjectReference
{ Allow player to loot ore once deposit has "broken up" }

;-- Variables ---------------------------------------
Bool CanLootOre = False
Int MineralAmount = 6
Int SoundInstanceID

;-- Properties --------------------------------------
Faction Property CurrentCompanionFaction Auto Const mandatory
MiscObject Property MineralType Auto Const mandatory
EffectShader Property MiningShader Auto Const
Weapon Property MiningWeapon Auto Const mandatory
Message Property TestMiningPrototypeMSG Auto Const mandatory
wwiseevent Property FXMineOreIronALPMEvent Auto Const mandatory
wwiseevent Property FXMineOreIronBBreakEvent Auto Const mandatory

;-- Functions ---------------------------------------

Function myRegisterForHit()
  Self.RegisterForHitEvent(Self as ScriptObject, Game.GetPlayer() as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:17
  Self.RegisterForHitEvent(Self as ScriptObject, CurrentCompanionFaction as ScriptObject, None, None, -1, -1, -1, -1, True) ; #DEBUG_LINE_NO:18
EndFunction

Event OnLoad()
  Self.myRegisterForHit() ; #DEBUG_LINE_NO:22
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, Bool abPowerAttack, Bool abSneakAttack, Bool abBashAttack, Bool abHitBlocked, String apMaterial)
  If akSource == MiningWeapon as Form ; #DEBUG_LINE_NO:28
    Self.DamageObject(1.100000024) ; #DEBUG_LINE_NO:29
  Else ; #DEBUG_LINE_NO:
    TestMiningPrototypeMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:31
    Self.myRegisterForHit() ; #DEBUG_LINE_NO:32
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnDestructionStageChanged(Int aiOldStage, Int aiCurrentStage)
  If aiCurrentStage == 2 ; #DEBUG_LINE_NO:37
    If MiningShader ; #DEBUG_LINE_NO:38
      MiningShader.play(Self as ObjectReference, -1.0) ; #DEBUG_LINE_NO:39
      SoundInstanceID = FXMineOreIronALPMEvent.play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:40
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
  If aiCurrentStage >= 3 ; #DEBUG_LINE_NO:43
    CanLootOre = True ; #DEBUG_LINE_NO:45
    wwiseevent.StopInstance(SoundInstanceID) ; #DEBUG_LINE_NO:46
    FXMineOreIronBBreakEvent.play(Self as ObjectReference, None, None) ; #DEBUG_LINE_NO:47
    Utility.Wait(0.200000003) ; #DEBUG_LINE_NO:48
    MiningShader.stop(Self as ObjectReference) ; #DEBUG_LINE_NO:49
  EndIf ; #DEBUG_LINE_NO:
EndEvent

Event OnActivate(ObjectReference akActionRef)
  If (akActionRef == Game.GetPlayer() as ObjectReference) && CanLootOre == False ; #DEBUG_LINE_NO:56
    TestMiningPrototypeMSG.Show(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0) ; #DEBUG_LINE_NO:57
  Else ; #DEBUG_LINE_NO:
    Self.Disable(False) ; #DEBUG_LINE_NO:59
    akActionRef.AddItem(MineralType as Form, MineralAmount, False) ; #DEBUG_LINE_NO:60
  EndIf ; #DEBUG_LINE_NO:
EndEvent
