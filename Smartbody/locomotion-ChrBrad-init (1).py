
print "locomotionInitSkeleton = " + locomotionInitSkeleton

#locomotion smooth cycle
smoothMotion = scene.getMotion("ChrBrad_ChrMarine@RunCircleRt01")
smoothMotion.smoothCycle("ChrBrad_ChrMarine@RunCircleRt01_smooth",0.1);
smoothMotion = scene.getMotion("ChrBrad_ChrMarine@WalkCircleRt01")
smoothMotion.smoothCycle("ChrBrad_ChrMarine@WalkCircleRt01_smooth",0.1);
smoothMotion = scene.getMotion("ChrBrad_ChrMarine@WalkTightCircleRt01")
smoothMotion.smoothCycle("ChrBrad_ChrMarine@WalkTightCircleRt01_smooth",0.1);
smoothMotion = scene.getMotion("ChrBrad_ChrMarine@StrafeFastRt01")
smoothMotion.smoothCycle("ChrBrad_ChrMarine@StrafeFastRt01_smooth",0.1);
smoothMotion = scene.getMotion("ChrBrad_ChrMarine@Meander01")
smoothMotion.smoothCycle("ChrBrad_ChrMarine@Meander01_smooth",0.2);

#locomotion mirror
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@WalkCircleRt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@WalkCircleLf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@WalkTightCircleRt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@WalkTightCircleLf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@StrafeFastRt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@StrafeFastLf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@StrafeSlowRt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@StrafeSlowLf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@RunCircleRt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@RunCircleLf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@RunTightCircleRt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@RunTightCircleLf01", locomotionInitSkeleton)

#mirroring for smooth cycle motion 
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@WalkCircleRt01_smooth")
mirrorMotion.mirror("ChrBrad_ChrMarine@WalkCircleLf01_smooth", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@WalkTightCircleRt01_smooth")
mirrorMotion.mirror("ChrBrad_ChrMarine@WalkTightCircleLf01_smooth", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@StrafeFastRt01_smooth")
mirrorMotion.mirror("ChrBrad_ChrMarine@StrafeFastLf01_smooth", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@RunCircleRt01_smooth")
mirrorMotion.mirror("ChrBrad_ChrMarine@RunCircleLf01_smooth", locomotionInitSkeleton)

#idle turn mirror
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@Turn90Rt")
mirrorMotion.mirror("ChrBrad_ChrMarine@Turn90Lf", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@Turn180Rt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@Turn180Lf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@Turn360Rt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@Turn360Lf01", locomotionInitSkeleton)

#starting mirror
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@Idle01_ToWalk01")
mirrorMotion.mirror("ChrBrad_ChrMarine@Idle01_ToWalkLf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@Idle01_ToWalk01_Turn90Rt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@Idle01_ToWalk01_Turn90Lf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@Idle01_ToWalk01_Turn180Rt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@Idle01_ToWalk01_Turn180Lf01", locomotionInitSkeleton)

#step mirror
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@Idle01_StepBackwardsRt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@Idle01_StepBackwardsLf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@Idle01_StepForwardRt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@Idle01_StepForwardLf01", locomotionInitSkeleton)
mirrorMotion = scene.getMotion("ChrBrad_ChrMarine@Idle01_StepSidewaysRt01")
mirrorMotion.mirror("ChrBrad_ChrMarine@Idle01_StepSidewaysLf01", locomotionInitSkeleton)


# locomotion main state
scene.run("locomotion-ChrBrad-state-Locomotion.py")

# starting state, starting locomotion with different angle
scene.run("locomotion-ChrBrad-state-StartingLeft.py")
scene.run("locomotion-ChrBrad-state-StartingRight.py")

# idle turn state, facing adjusting
scene.run("locomotion-ChrBrad-state-IdleTurn.py")

# step state, stepping adjusting
scene.run("locomotion-ChrBrad-state-Step.py")

# transitions
scene.run("locomotion-ChrBrad-transitions.py")
