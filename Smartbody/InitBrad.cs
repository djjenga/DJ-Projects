using UnityEngine;
using System;
using System.IO;
using System.Collections.Generic;

public class InitBrad : SmartbodyCharacterInit
{
    protected override void Awake()
    {
        base.Awake();

        unityBoneParent = "ChrBrad/CharacterRoot/JtRoot";
        //assetPaths.Add(new KeyValuePair<string, string>("ChrBrad.sk", "Art/Characters/SB/ChrBrad/sk"));
        //assetPaths.Add(new KeyValuePair<string, string>("ChrBrad.sk", "Art/Characters/SB/ChrBrad/face"));
        //assetPaths.Add(new KeyValuePair<string, string>("ChrBrad.sk", "Art/Characters/SB/ChrBrad/locomotion"));
        //assetPaths.Add(new KeyValuePair<string, string>("ChrBrad.sk", "Art/Characters/SB/ChrBrad/motion"));
        //assetPaths.Add(new KeyValuePair<string, string>("ChrBrad.sk", "Art/Characters/SB/ChrBrad/motion-converted"));
        skeletonName = "ChrBrad.sk";
        loadSkeletonFromSk = false;
        voiceType = "remote_audiofile";
        voiceCode = VHUtils.GetExternalAssetsPath() + "Sounds";
        voiceTypeBackup = "remote";
        voiceCodeBackup = "Festival_voice_rab_diphone";
        usePhoneBigram = false;
        startingPosture = "ChrBrad@Idle02";

        locomotionInitPythonSkeletonName = "ChrBrad.sk";
        locomotionInitPythonFile = "locomotion-ChrBrad-init.py";
        locomotionSteerPrefix = "ChrMarine";


        PostLoadEvent += delegate(UnitySmartbodyCharacter character)
            {
                SmartbodyManager.Get().PythonCommand(string.Format(@"bml.execBML('{0}', '<gaze target=""Camera"" sbm:joint-range=""NECK EYES""/>')", character.SBMCharacterName));
                SmartbodyManager.Get().PythonCommand(string.Format(@"bml.execBML('{0}', '<saccade mode=""talk""/>')", character.SBMCharacterName));
                SmartbodyManager.Get().PythonCommand(string.Format(@"scene.getCharacter('{0}').setStringAttribute('saccadePolicy', 'alwayson')", character.SBMCharacterName));
                //SmartbodyManager.Get().PythonCommand(string.Format(@"scene.getCharacter('{0}').setBoolAttribute('bmlRequestUsesPolling', False)", character.SBMCharacterName));

                // set up reach
                SmartbodyManager sbm = SmartbodyManager.Get();

                sbm.PythonCommand(@"scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachCntr01').mirror('ChrBrad_ChrBillFord_Idle01_LReachCntr01', 'ChrBrad.sk')");
                sbm.PythonCommand(@"scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachFarCornerLf01').mirror('ChrBrad_ChrBillFord_Idle01_LReachFarCornerLf01', 'ChrBrad.sk')");
                sbm.PythonCommand(@"scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachFarCornerRt01').mirror('ChrBrad_ChrBillFord_Idle01_LReachFarCornerRt01', 'ChrBrad.sk')");
                sbm.PythonCommand(@"scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachNearCornerLf01').mirror('ChrBrad_ChrBillFord_Idle01_LReachNearCornerLf01', 'ChrBrad.sk')");
                sbm.PythonCommand(@"scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachNearCornerRt01').mirror('ChrBrad_ChrBillFord_Idle01_LReachNearCornerRt01', 'ChrBrad.sk')");
                sbm.PythonCommand(@"scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachNearCntr01').mirror('ChrBrad_ChrBillFord_Idle01_LReachNearCntr01', 'ChrBrad.sk')");

                sbm.PythonCommand(@"scene.getMotion('ChrBrad_ChrHarmony_Relax001_HandGraspSmSphere_Grasp').mirror('ChrBrad_ChrHarmony_Relax001_LHandGraspSmSphere_Grasp', 'ChrBrad.sk')");
                sbm.PythonCommand(@"scene.getMotion('ChrBrad_ChrHarmony_Relax001_HandGraspSmSphere_Reach').mirror('ChrBrad_ChrHarmony_Relax001_LHandGraspSmSphere_Reach', 'ChrBrad.sk')");
                sbm.PythonCommand(@"scene.getMotion('ChrBrad_ChrHarmony_Relax001_HandGraspSmSphere_Release').mirror('ChrBrad_ChrHarmony_Relax001_LHandGraspSmSphere_Release', 'ChrBrad.sk')");

                sbm.PythonCommand(string.Format(@"scene.getReachManager().createReach('{0}')", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').setInterpolatorType('KNN')", character.SBMCharacterName));

                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('left', scene.getMotion('ChrBrad_ChrBillFord_Idle01_LReachCntr01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('left', scene.getMotion('ChrBrad_ChrBillFord_Idle01_LReachFarCornerLf01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('left', scene.getMotion('ChrBrad_ChrBillFord_Idle01_LReachFarCornerRt01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('left', scene.getMotion('ChrBrad_ChrBillFord_Idle01_LReachNearCornerLf01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('left', scene.getMotion('ChrBrad_ChrBillFord_Idle01_LReachNearCornerRt01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('left', scene.getMotion('ChrBrad_ChrBillFord_Idle01_LReachNearCntr01'))", character.SBMCharacterName));

                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('right', scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachCntr01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('right', scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachFarCornerLf01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('right', scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachFarCornerRt01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('right', scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachNearCntr01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('right', scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachNearCornerLf01'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').addMotion('right', scene.getMotion('ChrBrad_ChrBillFord_Idle01_ReachNearCornerRt01'))", character.SBMCharacterName));

                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').setGrabHandMotion('right', scene.getMotion('ChrBrad_ChrHarmony_Relax001_HandGraspSmSphere_Grasp'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').setGrabHandMotion('left', scene.getMotion('ChrBrad_ChrHarmony_Relax001_LHandGraspSmSphere_Grasp'))", character.SBMCharacterName));

                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').setReachHandMotion('right', scene.getMotion('ChrBrad_ChrHarmony_Relax001_HandGraspSmSphere_Reach'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').setReachHandMotion('left', scene.getMotion('ChrBrad_ChrHarmony_Relax001_LHandGraspSmSphere_Reach'))", character.SBMCharacterName));

                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').setReleaseHandMotion('right', scene.getMotion('ChrBrad_ChrHarmony_Relax001_HandGraspSmSphere_Release'))", character.SBMCharacterName));
                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').setReleaseHandMotion('left', scene.getMotion('ChrBrad_ChrHarmony_Relax001_LHandGraspSmSphere_Release'))", character.SBMCharacterName));

                sbm.PythonCommand(string.Format(@"scene.getReachManager().getReach('{0}', 'default').build(scene.getCharacter('{1}'))", character.SBMCharacterName, character.SBMCharacterName));

                // define and create the grasp handler.  this is currently the only way to get the grasp events to fire.
                sbm.PythonCommand(string.Format("class GraspHandler(SBEventHandler):\n\tdef executeAction(this, event):\n\t\tparams = event.getParameters()\n\t\tscene.command(params)"));
                sbm.PythonCommand(string.Format(@"graspHandler = GraspHandler()"));
                sbm.PythonCommand(string.Format(@"scene.getEventManager().addEventHandler('reach', graspHandler)"));

                // init the reach with a handle
                //sbm.PythonCommand(string.Format(@"bml.execBML('{0}', '<sbm:reach sbm:handle=""rdoctor"" effector=""r_index3"" sbm:fade-in=""1.0""/>')", character.SBMCharacterName));
            };
    }


    protected override void Start()
    {
        base.Start();
    }
}
