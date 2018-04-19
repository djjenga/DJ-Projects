
DATASET ACTIVATE DataSet2.
COMPUTE Neg_Post_Log=LG10(Panas_Neg_Post).
EXECUTE.

RECODE Neg_Post_Log (.51 thru Highest=.16) (ELSE=Copy) INTO Neg_log_out.
EXECUTE.

GLM Panas_pos_Post Panas_Neg_Post BY SelfEsteem_FA
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /POSTHOC=SelfEsteem_FA(BONFERRONI) 
  /PLOT=PROFILE(SelfEsteem_FA)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(SelfEsteem_FA) COMPARE ADJ(BONFERRONI)
  /PRINT=DESCRIPTIVE ETASQ OPOWER HOMOGENEITY
  /CRITERIA=ALPHA(.05)
  /DESIGN= SelfEsteem_FA.

DATASET ACTIVATE DataSet1.
CORRELATIONS
  /VARIABLES=Proxemics SelfEsteem_FA with interest2 distress2 excited2 upset2 strong2 guilty2 scared2 
    hostile2 enthus2 proud2 irritable2 alert2 ashamed2 inspired2 nervous2 determined2 attentive2 
    jittery2 active2 afraid2
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

COMPUTE Interest_change=interest-interest2.
EXECUTE.

COMPUTE distress_change=distress-distress2.
EXECUTE.

COMPUTE excited_change=excited-excited2.
EXECUTE.

COMPUTE upset_change = upset-upset2.
Execute.

Compute strong_change = strong-strong2.
Execute.

Compute guilty_change = guilty-guilty2.
execute.

Compute scared_change = scared-scared2.
execute.

Compute hostile_change = hostile -hostile2.
execute.

Compute enthus_change = enthusiastic-enthus2.
execute.

Compute proud_change = proud-proud2.
execute.

Compute irritable_change = irritable-irritable2.
execute.

COmpute alert_change = alert-alert2.
execute.

Compute Ashamed_change=ashamed-ashamed2.
Execute.

COmpute Inspired_change=inspired-inspired2.
execute.

Compute Nervous_change= nervous-nervous2.
execute.

Compute determined_change=determined-determined2.
execute.

Compute attentive_change= attentive-attentive2.
execute.

Compute jittery_change=jittery-jittery2.
execute.

Compute active_change=active-active2.
execute.

Compute afraid_change = afraid-afraid2.
execute.
