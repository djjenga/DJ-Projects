DATASET ACTIVATE DataSet17.
RECODE Q93_1 Q93_2 Q93_3 Q93_4 Q93_5 Q93_6 Q93_7 Q93_8 Q93_9 Q93_10 Q93_11 Q93_12 Q93_13 Q93_14 
    Q93_15 Q93_16 Q93_17 Q93_18 Q93_19 Q93_20 (6=1) (3=2) (2=3) (7=4) (4=5) INTO interest distress 
    excited upset strong guilty scared hostile enthus proud irratable alert ashamed inspired nervous 
    determined attentive jittery active afraid.
EXECUTE.

RECODE Q95_1 Q95_2 Q95_3 Q95_4 Q95_5 Q95_6 Q95_7 Q95_8 Q95_9 Q95_10 Q95_11 Q95_12 Q95_13 Q95_14 
    Q95_15 Q95_16 Q95_17 Q95_18 Q95_19 Q95_20 (6=1) (3=2) (2=3) (7=4) (4=5) INTO interest2 distress2 
    Excited2 upset2 strong2 guilty2 scared2 hostile2 enthus2 proud2 irratable2 alert2 ashamed2 inspired2 nervous2 determined2 attentive2 jittery2 active2 afraid2.
EXECUTE.


RECODE Q1.0 Q3 Q6 (1=5) (2=4) (3=3) (4=2) (5=1) INTO Effort Accuracy Underperformance.
EXECUTE.

DATASET ACTIVATE DataSet18.
RECODE Self_Est_2 Self_Est_5 Self_Est_6 Self_Est_8 Self_Est_9 (1=4) (2=3) (3=4) (4=1).
EXECUTE.

COMPUTE Self_Esteem=Mean(Self_Est_1,Self_Est_2,Self_Est_3,Self_Est_4,Self_Est_5,Self_Est_6,
    Self_Est_7,Self_Est_8,Self_Est_9,Self_Est_10).
EXECUTE.

COMPUTE Panas_Neg_pre=Mean(distress,upset,guilty,scared,hostile,irritable,ashamed,jittery,nervous,afraid).
EXECUTE.

COMPUTE Panas_pos_pre=Mean(interest,excited,strong,enthusiastic,proud,alert,inspired,determined,
    attentive,active).
EXECUTE.


COMPUTE Panas_Neg_Post=Mean(distress2,upset2,guilty2,scared2,hostile2,irritable2,ashamed2,jittery2,nervous2,afraid2).
EXECUTE.

COMPUTE Panas_pos_Post=Mean(interest2,excited2,strong2,enthus2,proud2,alert2,inspired2,determined2,
    attentive2,active2).
EXECUTE.


COMPUTE CDS_Causality=Mean(CDS1_Causality1,CDS1_Causality4,CDS1_Causality2,CDS1_Causality3,
    CDS1_Causality5).
EXECUTE.

COMPUTE CDS_Stability=Mean(CDS1_Stability1,CDS1_Stability2,CDS1_Stability3).
EXECUTE.

COMPUTE CDS_Personal=Mean(CDS1_Personal,CDS1_Personal2,CDS1_Personal3).
EXECUTE.

COMPUTE CDS_External=Mean(CDS1_External6,CDS1_External1,CDS1_External2,CDS1_External5,
    CDS1_External3).
EXECUTE.

CORRELATIONS
  /VARIABLES=gender VH_Gender Proxemics Self_Esteem Self_Assessment Panas_Neg_pre Panas_Neg_Post 
    Panas_pos_pre Panas_pos_Post CDS_Causality CDS_Stability CDS_Personal CDS_External Effort Accurate
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

#PANAS change scores

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Panas_pos_Post
  /METHOD=ENTER Panas_pos_pre
  /SAVE RESID.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Panas_neg_Post
  /METHOD=ENTER Panas_neg_pre
  /SAVE RESID.


CORRELATIONS
  /VARIABLES=Positive_change Negative_change Self_Assessment gender VH_Gender Proxemics Self_Esteem 
    CDS_Causality CDS_Stability CDS_Personal CDS_External Effort Accurate
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=Self_Assessment gender VH_Gender Proxemics Self_Esteem CDS_Causality CDS_Stability 
    CDS_Personal CDS_External Effort Accurate Underperform Panas_Neg_Post Panas_pos_Post
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
