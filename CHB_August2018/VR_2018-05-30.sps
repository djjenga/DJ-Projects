
DATASET ACTIVATE DataSet1.
COMPUTE GSE_Composite=mean(GSE_GSE_8,GSE_GSE_11,GSE_GSE_12,GSE_GSE_16,GSE_GSE_18,GSE_GSE_22,
    GSE_GSE_24,GSE_GSE_30,GSE_GSE_33,GSE_GSE_35).
EXECUTE.


IF ethnicity_1=1 race=1. 
IF ethnicity_2=1 race=2. 
IF ethnicity_3=1 race=2. 
IF ethnicity_4=1 race=2. 
IF ethnicity_5=1 race=2. 
IF ethnicity_6=1 race=2. 
IF ethnicity_7=1 race=2. 
ADD VALUE LABELS race 1 'white' 2 'nonwhite'.
Execute.


COMPUTE Spatial_Presence=mean(Q144_1,Q145_1,Q146_1,Q147_1,Q148_1,Q149_1,Q150_1).
EXECUTE.

COMPUTE Social_presence_Parasocial=mean(Q122_1,Q123_1,Q124_1,Q125_1,Q126_1,Q127_1,Q128_1).
EXECUTE.

COMPUTE Social_presence_Passive_interpersonal=mean(Q130_1,Q131_1,Q132_1,Q133_1).
EXECUTE.

COMPUTE Engagement_Mental_Immersion=mean(Q135_1,Q136_1,Q137_1,Q138_1,Q139_1).
EXECUTE.

COMPUTE Social_Richness=mean(Q140_1,Q140_2,Q140_3,Q140_4,Q140_5,Q140_6,Q140_7).
EXECUTE.

