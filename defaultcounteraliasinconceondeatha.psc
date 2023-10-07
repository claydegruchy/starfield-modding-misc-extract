ScriptName DefaultCounterAliasIncOnceOnDeathA Extends DefaultCounterQuestIncOnDeath default
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestA script. }

;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquesta).Increment() ; #DEBUG_LINE_NO:5
EndFunction
