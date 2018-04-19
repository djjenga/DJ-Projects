using UnityEngine;
using System;
using System.IO;
using System.Collections.Generic;

public class InitRachel: SmartbodyCharacterInit
{
    protected override void Awake()
    {
        base.Awake();

        unityBoneParent = "ChrRachel/CharacterRoot/JtRoot";
        assetPaths.Add(new KeyValuePair<string, string>("ChrBrad.sk", "Art/Characters/SB/ChrBrad/sk"));
        assetPaths.Add(new KeyValuePair<string, string>("ChrRachel.sk", "Art/Characters/SB/ChrRachel/face"));
        assetPaths.Add(new KeyValuePair<string, string>("ChrRachel.sk", "Art/Characters/SB/ChrRachel/locomotion"));
        assetPaths.Add(new KeyValuePair<string, string>("ChrRachel.sk", "Art/Characters/SB/ChrRachel/motion"));
        //assetPaths.Add(new KeyValuePair<string, string>("ChrBrad.sk", "Art/Characters/SB/ChrBrad/motion-converted"));
        skeletonName = "ChrRachel.sk";
        loadSkeletonFromSk = false;
        voiceType = "remote_audiofile";
        voiceCode = VHUtils.GetExternalAssetsPath() + "Sounds";
        voiceTypeBackup = "remote";
        voiceCodeBackup = "Festival_voice_rab_diphone";
        usePhoneBigram = false;
        startingPosture = "ChrRachel@Idle02";

        locomotionInitPythonSkeletonName = "ChrBrad.sk";
        locomotionInitPythonFile = "locomotion-ChrBrad-init.py";
        locomotionSteerPrefix = "ChrMarine";


        PostLoadEvent += delegate(UnitySmartbodyCharacter character)
            {
                SmartbodyManager.Get().PythonCommand(string.Format(@"bml.execBML('{0}', '<gaze target=""Camera"" sbm:joint-range=""HEAD EYES""/>')", character.SBMCharacterName));
                //SmartbodyManager.Get().PythonCommand(string.Format(@"bml.execBML('{0}', '<saccade mode=""talk""/>')", character.SBMCharacterName));
                SmartbodyManager.Get().PythonCommand(string.Format(@"bml.execBML('{0}', '<animation name=""ChrRachel@Idle02""/>')", character.SBMCharacterName));
               };
    }


    protected override void Start()
    {
        base.Start();
    }
}
