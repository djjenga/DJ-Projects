
DATASET ACTIVATE DataSet1.
T-TEST PAIRS=Panas_Interested Panas_Distressed Panas_Excited Panas_Upset Panas_Strong Panas_Guilty 
    Panas_Scared Panas_Hostile Panas_Enthusiastic Panas_Proud Panas_Irritable Panas_Alert Panas_Ashamed 
    Panas_Inspired Panas_Nervous Panas_Determined Panas_Attentive Panas_Jittery Panas_Active 
    Panas_Afraid WITH Panas_2_Interested Panas_2_Distressed Panas_2_Excited Panas_2_Upset 
    Panas_2_Strong Panas_2_Guilty Panas_2_Scared Panas_2_Hostile Panas_2_Enthusiastic Panas_2_Proud 
    Panas_2_Irritable Panas_2_Alert Panas_2_Ashamed Panas_2_Inspired Panas_2_Nervous Panas_2_Determined 
    Panas_2_Attentive Panas_2_Jittery Panas_2_Active Panas_2_Afraid (PAIRED)
  /CRITERIA=CI(.9500)
  /MISSING=ANALYSIS.
