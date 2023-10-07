ScriptName TestMovementAnim Extends Actor

;-- Variables ---------------------------------------
Float fcircleStrafeTime = 5.0
Float fjogSpeed = 1.5
Float floopingTurnTime = 5.0
Float frampTime = 0.25
Float frunSpeed = 2.0
Float fslowWalkSpeed = 0.5
Float fstrafingTime = 3.0
Float ftestTurningAtSpeed = 5.0
Float fwalkSpeed = 1.0

;-- Functions ---------------------------------------

Function RunAllTests()
  Self.RunStrafingTest() ; #DEBUG_LINE_NO:21
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:23
  Self.RunLoopingTurnTest() ; #DEBUG_LINE_NO:24
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:26
  Self.RunTurningTest() ; #DEBUG_LINE_NO:27
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:29
  Self.RunMoveAndTurnToTurnInPlaceTests() ; #DEBUG_LINE_NO:30
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:32
  Self.RunCircleStrafeTest() ; #DEBUG_LINE_NO:33
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:35
  Self.RunSwervingTest() ; #DEBUG_LINE_NO:36
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:38
  Self.RunRampingTest() ; #DEBUG_LINE_NO:39
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:41
  Self.RunBlendTests() ; #DEBUG_LINE_NO:42
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:44
  Self.RunTurnAroundWhileMovingTest() ; #DEBUG_LINE_NO:45
EndFunction

Function RunAllTestsNoStrafe()
  Self.RunForwardBackwardTest() ; #DEBUG_LINE_NO:52
  Self.RunLoopingTurnTest() ; #DEBUG_LINE_NO:53
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:55
  Self.RunTurningTest() ; #DEBUG_LINE_NO:56
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:58
  Self.RunMoveAndTurnToTurnInPlaceTests() ; #DEBUG_LINE_NO:59
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:61
  Self.RunSwervingTest() ; #DEBUG_LINE_NO:62
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:64
  Self.RunRampingTest() ; #DEBUG_LINE_NO:65
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:67
  Self.RunBlendTests() ; #DEBUG_LINE_NO:68
EndFunction

Function RunStrafingTest()
  Self.TestStrafingAtSpeed(fslowWalkSpeed) ; #DEBUG_LINE_NO:76
  Self.TestStrafingAtSpeed(fwalkSpeed) ; #DEBUG_LINE_NO:78
  Self.TestStrafingAtSpeed(fjogSpeed) ; #DEBUG_LINE_NO:80
  Self.TestStrafingAtSpeed(frunSpeed) ; #DEBUG_LINE_NO:82
EndFunction

Function RunForwardBackwardTest()
  Self.TestForwardBackwardAtSpeed(fslowWalkSpeed) ; #DEBUG_LINE_NO:88
  Self.TestForwardBackwardAtSpeed(fwalkSpeed) ; #DEBUG_LINE_NO:90
  Self.TestForwardBackwardAtSpeed(fjogSpeed) ; #DEBUG_LINE_NO:92
  Self.TestForwardBackwardAtSpeed(frunSpeed) ; #DEBUG_LINE_NO:94
EndFunction

Function RunLoopingTurnTest()
  Self.TestLoopingTurn(fslowWalkSpeed) ; #DEBUG_LINE_NO:102
  Self.TestLoopingTurn(-fslowWalkSpeed) ; #DEBUG_LINE_NO:105
  Self.TestLoopingTurn(fwalkSpeed) ; #DEBUG_LINE_NO:110
  Self.TestLoopingTurn(-fwalkSpeed) ; #DEBUG_LINE_NO:113
  Self.TestLoopingTurn(fjogSpeed) ; #DEBUG_LINE_NO:118
  Self.TestLoopingTurn(-fjogSpeed) ; #DEBUG_LINE_NO:121
  Self.TestLoopingTurn(frunSpeed) ; #DEBUG_LINE_NO:126
  Self.TestLoopingTurn(-frunSpeed) ; #DEBUG_LINE_NO:129
EndFunction

Function RunTurningTest()
  Self.RunTurningAtSpeedTest(fslowWalkSpeed) ; #DEBUG_LINE_NO:136
  Self.RunTurningAtSpeedTest(fwalkSpeed) ; #DEBUG_LINE_NO:138
  Self.RunTurningAtSpeedTest(fjogSpeed) ; #DEBUG_LINE_NO:140
  Self.RunTurningAtSpeedTest(frunSpeed) ; #DEBUG_LINE_NO:142
EndFunction

Function RunTurningAtSpeedTest(Float afSpeed)
  Self.TestTurningAtSpeed(afSpeed, fslowWalkSpeed) ; #DEBUG_LINE_NO:149
  Self.TestTurningAtSpeed(afSpeed, fwalkSpeed) ; #DEBUG_LINE_NO:151
  Self.TestTurningAtSpeed(afSpeed, fjogSpeed) ; #DEBUG_LINE_NO:153
  Self.TestTurningAtSpeed(afSpeed, frunSpeed) ; #DEBUG_LINE_NO:155
EndFunction

Function RunCircleStrafeTest()
  Self.TestCircleStrafingAtSpeed(fslowWalkSpeed) ; #DEBUG_LINE_NO:164
  Self.TestCircleStrafingAtSpeed(fwalkSpeed) ; #DEBUG_LINE_NO:166
  Self.TestCircleStrafingAtSpeed(fjogSpeed) ; #DEBUG_LINE_NO:168
  Self.TestCircleStrafingAtSpeed(frunSpeed) ; #DEBUG_LINE_NO:170
  Self.TestCircleStrafingAtSpeed(fslowWalkSpeed) ; #DEBUG_LINE_NO:174
  Self.TestCircleStrafingAtSpeed(fwalkSpeed) ; #DEBUG_LINE_NO:176
  Self.TestCircleStrafingAtSpeed(fjogSpeed) ; #DEBUG_LINE_NO:178
  Self.TestCircleStrafingAtSpeed(frunSpeed) ; #DEBUG_LINE_NO:180
EndFunction

Function RunTurnAroundWhileMovingTest()
  Self.TestTurnAroundWhileAtSpeed(fslowWalkSpeed) ; #DEBUG_LINE_NO:186
  Self.TestTurnAroundWhileAtSpeed(fwalkSpeed) ; #DEBUG_LINE_NO:188
  Self.TestTurnAroundWhileAtSpeed(fjogSpeed) ; #DEBUG_LINE_NO:190
  Self.TestTurnAroundWhileAtSpeed(frunSpeed) ; #DEBUG_LINE_NO:192
EndFunction

Function RunSwervingTest()
  Self.RunSwervingTestAtMoveSpeed(fslowWalkSpeed) ; #DEBUG_LINE_NO:198
  Self.RunSwervingTestAtMoveSpeed(fwalkSpeed) ; #DEBUG_LINE_NO:200
  Self.RunSwervingTestAtMoveSpeed(fjogSpeed) ; #DEBUG_LINE_NO:202
  Self.RunSwervingTestAtMoveSpeed(frunSpeed) ; #DEBUG_LINE_NO:204
EndFunction

Function RunSwervingTestAtMoveSpeed(Float afMoveSpeed)
  Self.TestSwervingAtSpeed(afMoveSpeed, fslowWalkSpeed) ; #DEBUG_LINE_NO:209
  Self.TestSwervingAtSpeed(afMoveSpeed, fwalkSpeed) ; #DEBUG_LINE_NO:211
  Self.TestSwervingAtSpeed(afMoveSpeed, fjogSpeed) ; #DEBUG_LINE_NO:213
  Self.TestSwervingAtSpeed(afMoveSpeed, frunSpeed) ; #DEBUG_LINE_NO:215
EndFunction

Function RunRampingTest()
  Self.RunRampingTestBetweenSpeeds(0.0, fslowWalkSpeed) ; #DEBUG_LINE_NO:220
  Self.RunRampingTestBetweenSpeeds(0.0, frunSpeed) ; #DEBUG_LINE_NO:222
  Self.RunRampingTestBetweenSpeeds(0.0, frunSpeed) ; #DEBUG_LINE_NO:224
  Self.RunRampingTestBetweenSpeeds(fslowWalkSpeed, fwalkSpeed) ; #DEBUG_LINE_NO:226
  Self.RunRampingTestBetweenSpeeds(fwalkSpeed, fjogSpeed) ; #DEBUG_LINE_NO:228
  Self.RunRampingTestBetweenSpeeds(fjogSpeed, frunSpeed) ; #DEBUG_LINE_NO:230
  Self.RunRampingTestBetweenSpeeds(fwalkSpeed, frunSpeed) ; #DEBUG_LINE_NO:232
EndFunction

Function RunRampingTestBetweenSpeeds(Float afMinSpeed, Float afMaxSpeed)
  Self.TestRampSpeed(afMinSpeed, afMaxSpeed, 1.0, 3) ; #DEBUG_LINE_NO:237
  Self.TestRampSpeed(afMinSpeed, afMaxSpeed, 0.5, 5) ; #DEBUG_LINE_NO:239
  Self.TestRampSpeed(afMinSpeed, afMaxSpeed, 0.25, 10) ; #DEBUG_LINE_NO:241
EndFunction

Function RunBlendTests()
  Self.TestForwardAndTurnBlends(fwalkSpeed - 0.100000001, 0.0, 0.01) ; #DEBUG_LINE_NO:246
  Self.TestForwardAndTurnBlends(fjogSpeed - 0.100000001, 0.0, 0.01) ; #DEBUG_LINE_NO:248
  Self.TestForwardAndTurnBlends(frunSpeed - 0.100000001, 0.0, 0.01) ; #DEBUG_LINE_NO:250
EndFunction

Function RunMoveAndTurnToTurnInPlaceTests()
  Self.TestMoveThenTurn(fslowWalkSpeed, fslowWalkSpeed) ; #DEBUG_LINE_NO:257
  Self.TestMoveThenTurn(fwalkSpeed, fwalkSpeed) ; #DEBUG_LINE_NO:259
  Self.TestMoveThenTurn(fjogSpeed, fjogSpeed) ; #DEBUG_LINE_NO:261
  Self.TestMoveThenTurn(frunSpeed, frunSpeed) ; #DEBUG_LINE_NO:263
EndFunction

Function RampSpeed(Float afAngle, Float afSpeed, Float afTime, Float afRampUpTime, Float afRampDownTime)
  Utility.Wait(afTime - afRampDownTime) ; #DEBUG_LINE_NO:272
  Utility.Wait(afRampDownTime) ; #DEBUG_LINE_NO:274
EndFunction

Function TestStrafingAtSpeed(Float afSpeed)
  Float fangle = 0.0 ; #DEBUG_LINE_NO:280
  Float fangleInc = 45.0 ; #DEBUG_LINE_NO:281
  While fangle < 360.0 ; #DEBUG_LINE_NO:282
    Self.RampSpeed(fangle, afSpeed, fstrafingTime, frampTime, frampTime) ; #DEBUG_LINE_NO:283
    Self.RampSpeed(fangle + 180.0, afSpeed, fstrafingTime, frampTime, frampTime) ; #DEBUG_LINE_NO:284
    fangle += fangleInc ; #DEBUG_LINE_NO:285
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:292
  fangle = 0.0 ; #DEBUG_LINE_NO:293
  fangleInc = 10.0 ; #DEBUG_LINE_NO:294
  Float fdeltaTime = fcircleStrafeTime * fangleInc / 360.0 ; #DEBUG_LINE_NO:295
  While fangle < 360.0 ; #DEBUG_LINE_NO:296
    Utility.Wait(fdeltaTime) ; #DEBUG_LINE_NO:298
    fangle += fangleInc ; #DEBUG_LINE_NO:299
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:302
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:308
  fangle = 360.0 ; #DEBUG_LINE_NO:309
  While fangle > 0.0 ; #DEBUG_LINE_NO:310
    Utility.Wait(fdeltaTime) ; #DEBUG_LINE_NO:312
    fangle -= fangleInc ; #DEBUG_LINE_NO:313
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:316
EndFunction

Function TestForwardBackwardAtSpeed(Float afSpeed)
  Self.RampSpeed(0.0, afSpeed, fstrafingTime, frampTime, frampTime) ; #DEBUG_LINE_NO:321
  Self.RampSpeed(180.0, afSpeed, fstrafingTime, frampTime, frampTime) ; #DEBUG_LINE_NO:322
EndFunction

Function TestLoopingTurn(Float afSpeed)
  Utility.Wait(floopingTurnTime - frampTime) ; #DEBUG_LINE_NO:328
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:330
EndFunction

Function TestTurningAtSpeed(Float afSpeed, Float afTurnSpeed)
  Utility.Wait(ftestTurningAtSpeed - frampTime) ; #DEBUG_LINE_NO:340
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:343
  Utility.Wait(ftestTurningAtSpeed - frampTime) ; #DEBUG_LINE_NO:349
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:352
EndFunction

Function TestCircleStrafingAtSpeed(Float afSpeed)
  Utility.Wait(fcircleStrafeTime - frampTime) ; #DEBUG_LINE_NO:362
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:365
  Utility.Wait(fcircleStrafeTime - frampTime) ; #DEBUG_LINE_NO:371
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:374
EndFunction

Function TestTurnAroundWhileAtSpeed(Float afMoveSpeed)
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:382
  Float fangle = 0.0 ; #DEBUG_LINE_NO:384
  Float fangleInc = 10.0 ; #DEBUG_LINE_NO:385
  Float fdeltaTime = 2.0 * fangleInc / 360.0 ; #DEBUG_LINE_NO:386
  While fangle < 360.0 ; #DEBUG_LINE_NO:387
    Utility.Wait(fdeltaTime) ; #DEBUG_LINE_NO:389
    fangle += fangleInc ; #DEBUG_LINE_NO:390
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:394
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:395
  fangle = 360.0 ; #DEBUG_LINE_NO:398
  fangleInc = 10.0 ; #DEBUG_LINE_NO:399
  fdeltaTime = 2.0 * fangleInc / 360.0 ; #DEBUG_LINE_NO:400
  While fangle > 0.0 ; #DEBUG_LINE_NO:401
    Utility.Wait(fdeltaTime) ; #DEBUG_LINE_NO:403
    fangle -= fangleInc ; #DEBUG_LINE_NO:404
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:408
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:409
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:411
EndFunction

Function TestRampSpeed(Float afMinSpeed, Float afMaxSpeed, Float afRampTime, Int icount)
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:420
  Int I = 0 ; #DEBUG_LINE_NO:421
  While I < icount ; #DEBUG_LINE_NO:422
    Utility.Wait(afRampTime) ; #DEBUG_LINE_NO:424
    Utility.Wait(afRampTime) ; #DEBUG_LINE_NO:426
    I += 1 ; #DEBUG_LINE_NO:427
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:430
EndFunction

Function TestSwervingAtSpeed(Float afMoveSpeed, Float afSwerveSpeed)
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:439
  Int icount = 0 ; #DEBUG_LINE_NO:440
  While icount < 10 ; #DEBUG_LINE_NO:441
    Utility.Wait(frampTime) ; #DEBUG_LINE_NO:443
    Utility.Wait(frampTime) ; #DEBUG_LINE_NO:445
    icount += 1 ; #DEBUG_LINE_NO:446
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:450
EndFunction

Function TestForwardAndTurnBlends(Float afMoveSpeed, Float afTurnSpeed, Float afTurnSpeedDelta)
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:459
  Int icount = 0 ; #DEBUG_LINE_NO:460
  While icount < 10 ; #DEBUG_LINE_NO:461
    Utility.Wait(Utility.RandomFloat(0.100000001, 0.5)) ; #DEBUG_LINE_NO:463
    Utility.Wait(Utility.RandomFloat(0.100000001, 0.5)) ; #DEBUG_LINE_NO:465
    Utility.Wait(Utility.RandomFloat(0.100000001, 0.5)) ; #DEBUG_LINE_NO:467
    Utility.Wait(Utility.RandomFloat(0.100000001, 0.5)) ; #DEBUG_LINE_NO:469
    icount += 1 ; #DEBUG_LINE_NO:470
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:474
EndFunction

Function TestMoveThenTurn(Float afMoveSpeed, Float afTurnSpeed)
  Self.TestMoveInDirectionThenTurn(0.0, afMoveSpeed, afTurnSpeed) ; #DEBUG_LINE_NO:479
  Self.TestMoveInDirectionThenTurn(0.0, afMoveSpeed, -afTurnSpeed) ; #DEBUG_LINE_NO:480
  Self.TestMoveInDirectionThenTurn(180.0, afMoveSpeed, afTurnSpeed) ; #DEBUG_LINE_NO:481
  Self.TestMoveInDirectionThenTurn(180.0, afMoveSpeed, -afTurnSpeed) ; #DEBUG_LINE_NO:482
EndFunction

Function TestMoveInDirectionThenTurn(Float afDirection, Float afMoveSpeed, Float afTurnSpeed)
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:493
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:497
  Utility.Wait(2.0) ; #DEBUG_LINE_NO:503
  Utility.Wait(frampTime) ; #DEBUG_LINE_NO:507
EndFunction

Function RunDirectionSmoothingTest()
  Game.SetCameraTarget(Self as Actor) ; #DEBUG_LINE_NO:511
  Utility.Wait(5.0) ; #DEBUG_LINE_NO:512
  Self.TestDirectionSmoothingAtSpeed(fslowWalkSpeed) ; #DEBUG_LINE_NO:515
  Self.TestDirectionSmoothingAtSpeed(fwalkSpeed) ; #DEBUG_LINE_NO:517
  Self.TestDirectionSmoothingAtSpeed(fjogSpeed) ; #DEBUG_LINE_NO:519
  Self.TestDirectionSmoothingAtSpeed(frunSpeed) ; #DEBUG_LINE_NO:521
EndFunction

Function TestDirectionSmoothingAtSpeed(Float afSpeed)
  Float fangle = 0.0 ; #DEBUG_LINE_NO:526
  Float fangleInc = 45.0 ; #DEBUG_LINE_NO:527
  While fangle < 360.0 ; #DEBUG_LINE_NO:528
    Utility.Wait(3.0) ; #DEBUG_LINE_NO:531
    Utility.Wait(3.0) ; #DEBUG_LINE_NO:533
    fangle += fangleInc ; #DEBUG_LINE_NO:534
  EndWhile ; #DEBUG_LINE_NO:
  Utility.Wait(1.0) ; #DEBUG_LINE_NO:537
EndFunction
