ScriptName DefaultCounterAliasIncOnceOnDeathC Extends DefaultCounterQuestIncOnDeath default
{ Once this ALIAS dies it increments the counter on its Quest's DefaultCounterQuestC script. }

;-- Functions ---------------------------------------

Function Increment()
  (Self.GetOwningQuest() as defaultcounterquestc).Increment() ; #DEBUG_LINE_NO:5
EndFunction
