using UnityEngine;
using System;
using System.IO;
using System.Collections.Generic;

public class InitOlivia : SmartbodyCharacterInit
{
    protected override void Awake()
    {
        base.Awake();

        unityBoneParent = "ChrOlivia/CharacterRoot/JtRoot";
        //assetPaths.Add(new KeyValuePair<string, string>("ChrOlivia.sk", "Art/Characters/SB/ChrOlivia"));
        //assetPaths.Add(new KeyValuePair<string, string>("ChrBrad.sk", "Art/Characters/SB/ChrBrad/face"));
        //assetPaths.Add(new KeyValuePair<string, string>("ChrBrad.sk", "Art/Characters/SB/ChrBrad/locomotion"));
        assetPaths.Add(new KeyValuePair<string, string>("ChrOlivia.sk", "Art/Characters/SB/ChrOlivia/motion"));
        assetPaths.Add(new KeyValuePair<string, string>("ChrOlivia.sk", "Art/Characters/SB/ChrOlivia/face"));
        skeletonName = "ChrOlivia.sk";
        loadSkeletonFromSk = false;
        voiceType = "remote_audiofile";
        voiceCode = VHUtils.GetExternalAssetsPath() + "Sounds";
        voiceTypeBackup = "remote";
        voiceCodeBackup = "Festival_voice_rab_diphone";
        usePhoneBigram = false;
        startingPosture = "ChrRachel@Idle02";

        locomotionInitPythonSkeletonName = "ChrOlivia.sk";
        locomotionInitPythonFile = "locomotion-ChrBrad-init.py";
        locomotionSteerPrefix = "ChrMarine";


        PostLoadEvent += delegate(UnitySmartbodyCharacter character)
            {
                SmartbodyManager.Get().PythonCommand(string.Format(@"bml.execBML('{0}', '<gaze target=""Camera"" sbm:joint-range=""NECK EYES""/>')", character.SBMCharacterName));
                //SmartbodyManager.Get().PythonCommand(string.Format(@"bml.execBML('{0}', '<saccade mode=""talk""/>')", character.SBMCharacterName));
                //SmartbodyManager.Get().PythonCommand(string.Format(@"scene.getCharacter('{0}').setStringAttribute('saccadePolicy', 'alwayson')", character.SBMCharacterName));
                //SmartbodyManager.Get().PythonCommand(string.Format(@"scene.getCharacter('{0}').setBoolAttribute('bmlRequestUsesPolling', False)", character.SBMCharacterName));

                
            };
    }


    protected override void Start()
    {
        base.Start();
    }
}
