ScriptName LegendaryOnHitEffectStaggerScript Extends ActiveMagicEffect Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Int Property ChanceLargeStagger = 5 Auto Const
Int Property ChanceMediumStagger = 10 Auto Const
Int Property ChanceSmallStagger = 20 Auto Const
Explosion Property mod_Legendary_StaggerLarge_Explosion Auto Const mandatory
Explosion Property mod_Legendary_StaggerMedium_Explosion Auto Const mandatory
Explosion Property mod_Legendary_StaggerSmall_Explosion Auto Const mandatory

;-- Functions ---------------------------------------

Event OnEffectStart(ObjectReference akTarget, Actor akCaster, MagicEffect akBaseEffect, Float afMagnitude, Float afDuration)
  Int roll = Utility.RandomInt(1, 100) ; #DEBUG_LINE_NO:16
  If roll <= ChanceLargeStagger ; #DEBUG_LINE_NO:20
    akTarget.placeAtMe(mod_Legendary_StaggerLarge_Explosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:22
  ElseIf roll <= ChanceMediumStagger ; #DEBUG_LINE_NO:24
    akTarget.placeAtMe(mod_Legendary_StaggerMedium_Explosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:26
  ElseIf roll <= ChanceSmallStagger ; #DEBUG_LINE_NO:28
    akTarget.placeAtMe(mod_Legendary_StaggerSmall_Explosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:30
  EndIf ; #DEBUG_LINE_NO:
EndEvent
