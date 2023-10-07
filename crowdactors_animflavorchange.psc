ScriptName CrowdActors_AnimFlavorChange Extends Actor Const

;-- Variables ---------------------------------------

;-- Properties --------------------------------------
Keyword[] Property AnimFlavors Auto Const
{ array of anim flavor keywords }
GlobalVariable Property CrowdAnimFlavorChance Auto Const mandatory

;-- Functions ---------------------------------------

Event OnLoad()
  Int ChanceForAnim = Utility.RandomInt(0, 100) ; #DEBUG_LINE_NO:9
  If ChanceForAnim as Float > CrowdAnimFlavorChance.GetValue() ; #DEBUG_LINE_NO:10
    Int AnimType = Utility.RandomInt(0, AnimFlavors.Length - 1) ; #DEBUG_LINE_NO:11
    Self.ChangeAnimFlavor(AnimFlavors[AnimType]) ; #DEBUG_LINE_NO:12
  EndIf ; #DEBUG_LINE_NO:
EndEvent
