ScriptName HeavyActorPushOnImpact Extends ObjectReference
{ Script based solution for pushing things in game with heavy actors }

;-- Variables ---------------------------------------
Actor myActor

;-- Properties --------------------------------------
Keyword Property heavyKnocker Auto
{ Keyword pointer for heavy actors }
Armor Property ArmorPoweredFrame Auto
{ Pointer to power armor for testing against }
Bool Property isHavokable Auto
{ Set to true to get bollard like behavior }
Explosion Property myExplosion Auto
{ Explosion to play if non havokable }
Int Property damageAmountIfHavok = 10 Auto
{ damage to move bollard to havokable state }
Bool Property useDestruction = False Auto
{ on heavy knocker enter use destruction or not }

;-- Functions ---------------------------------------

Event OnTriggerEnter(ObjectReference akActionRef)
  myActor = akActionRef as Actor ; #DEBUG_LINE_NO:22
  If myActor ; #DEBUG_LINE_NO:23
    If (akActionRef as Actor).IsEquipped(ArmorPoweredFrame as Form) ; #DEBUG_LINE_NO:25
      If isHavokable == True ; #DEBUG_LINE_NO:26
        Float eulerAngleZ = akActionRef.getAngleZ() + Utility.RandomFloat(-25.0, 25.0) ; #DEBUG_LINE_NO:28
        Float cosZ = Math.cos(eulerAngleZ) ; #DEBUG_LINE_NO:33
        Float sinZ = Math.sin(eulerAngleZ) ; #DEBUG_LINE_NO:34
        Self.DamageObject(damageAmountIfHavok as Float) ; #DEBUG_LINE_NO:36
        Self.ApplyHavokImpulse(sinZ, cosZ, 0.0, 10000.0) ; #DEBUG_LINE_NO:40
      Else ; #DEBUG_LINE_NO:
        Self.placeatme(myExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:42
        Utility.wait(0.100000001) ; #DEBUG_LINE_NO:43
        Self.disable(False) ; #DEBUG_LINE_NO:44
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
    If akActionRef.HasKeyword(heavyKnocker) ; #DEBUG_LINE_NO:49
      If isHavokable == True ; #DEBUG_LINE_NO:50
        Float euleranglez = akActionRef.getAngleZ() + Utility.RandomFloat(-25.0, 25.0) ; #DEBUG_LINE_NO:52
        Float cosz = Math.cos(euleranglez) ; #DEBUG_LINE_NO:57
        Float sinz = Math.sin(euleranglez) ; #DEBUG_LINE_NO:58
        Self.DamageObject(10.0) ; #DEBUG_LINE_NO:60
        Self.ApplyHavokImpulse(sinz, cosz, 0.0, 10000.0) ; #DEBUG_LINE_NO:64
      ElseIf useDestruction == False ; #DEBUG_LINE_NO:66
        Self.placeatme(myExplosion as Form, 1, False, False, True, None, None, True) ; #DEBUG_LINE_NO:67
        Utility.wait(0.100000001) ; #DEBUG_LINE_NO:68
        Self.disable(False) ; #DEBUG_LINE_NO:69
      Else ; #DEBUG_LINE_NO:
        Self.DamageObject(10000.0) ; #DEBUG_LINE_NO:72
      EndIf ; #DEBUG_LINE_NO:
    EndIf ; #DEBUG_LINE_NO:
  EndIf ; #DEBUG_LINE_NO:
EndEvent
