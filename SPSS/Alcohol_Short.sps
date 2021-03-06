﻿#T1 Negative Binomial with UAI DV

* Generalized Linear Models.
GENLIN NPUAI_T1_Baseline WITH Sh_Guilt Alcohol_New
  /MODEL Sh_Guilt Alcohol_New Sh_Guilt*Alcohol_New INTERCEPT=YES
 DISTRIBUTION=NEGBIN(1) LINK=NEGBIN
  /CRITERIA METHOD=FISHER(1) SCALE=1 COVB=MODEL MAXITERATIONS=100 MAXSTEPHALVING=5 
    PCONVERGE=1E-006(ABSOLUTE) SINGULAR=1E-012 ANALYSISTYPE=3(WALD) CILEVEL=95 CITYPE=WALD 
    LIKELIHOOD=FULL
  /MISSING CLASSMISSING=EXCLUDE
  /PRINT CPS DESCRIPTIVES MODELINFO FIT SUMMARY SOLUTION (EXPONENTIATED)
  /SAVE MEANPRED XBPRED.

#T1 Poisson with Alcohol DV

* Generalized Linear Models.
GENLIN Alcohol_New WITH Sh_Guilt
  /MODEL Sh_Guilt INTERCEPT=YES
 DISTRIBUTION=POISSON LINK=LOG
  /CRITERIA METHOD=FISHER(1) SCALE=1 COVB=MODEL MAXITERATIONS=100 MAXSTEPHALVING=5 
    PCONVERGE=1E-006(ABSOLUTE) SINGULAR=1E-012 ANALYSISTYPE=3(WALD) CILEVEL=95 CITYPE=WALD 
    LIKELIHOOD=FULL
  /MISSING CLASSMISSING=EXCLUDE
  /PRINT CPS DESCRIPTIVES MODELINFO FIT SUMMARY SOLUTION (EXPONENTIATED)
  /SAVE MEANPRED XBPRED.

#T3 Neg Binomial with UAI_Game DV

* Generalized Linear Models.
GENLIN NPUAI_T3_Game WITH T3Alcohol_Game T3_Guilt_Game
  /MODEL T3Alcohol_Game*T3_Guilt_Game T3Alcohol_Game T3_Guilt_Game INTERCEPT=YES
 DISTRIBUTION=NEGBIN(1) LINK=NEGBIN
  /CRITERIA METHOD=FISHER(1) SCALE=1 COVB=MODEL MAXITERATIONS=100 MAXSTEPHALVING=5 
    PCONVERGE=1E-006(ABSOLUTE) SINGULAR=1E-012 ANALYSISTYPE=3(WALD) CILEVEL=95 CITYPE=WALD 
    LIKELIHOOD=FULL
  /MISSING CLASSMISSING=EXCLUDE
  /PRINT CPS DESCRIPTIVES MODELINFO FIT SUMMARY SOLUTION (EXPONENTIATED)
  /SAVE MEANPRED XBPRED.


#T3 Poisson with Alcohol Game DV

* Generalized Linear Models.
GENLIN T3Alcohol_Game WITH T3_Guilt_Game
  /MODEL T3_Guilt_Game INTERCEPT=YES
 DISTRIBUTION=POISSON LINK=LOG
  /CRITERIA METHOD=FISHER(1) SCALE=1 COVB=MODEL MAXITERATIONS=100 MAXSTEPHALVING=5 
    PCONVERGE=1E-006(ABSOLUTE) SINGULAR=1E-012 ANALYSISTYPE=3(WALD) CILEVEL=95 CITYPE=WALD 
    LIKELIHOOD=FULL
  /MISSING CLASSMISSING=EXCLUDE
  /PRINT CPS DESCRIPTIVES MODELINFO FIT SUMMARY SOLUTION (EXPONENTIATED)
  /SAVE MEANPRED XBPRED.

#T3 Neg Binomial with UAI_Control DV

* Generalized Linear Models.
GENLIN NPUAI_T3_Control WITH T3Alcohol_Control T3_Guilt_Control
  /MODEL T3Alcohol_Control*T3_Guilt_Control T3Alcohol_Control T3_Guilt_Control INTERCEPT=YES
 DISTRIBUTION=NEGBIN(1) LINK=LOG
  /CRITERIA METHOD=FISHER(1) SCALE=1 COVB=MODEL MAXITERATIONS=100 MAXSTEPHALVING=5 
    PCONVERGE=1E-006(ABSOLUTE) SINGULAR=1E-012 ANALYSISTYPE=3(WALD) CILEVEL=95 CITYPE=WALD 
    LIKELIHOOD=FULL
  /MISSING CLASSMISSING=EXCLUDE
  /PRINT CPS DESCRIPTIVES MODELINFO FIT SUMMARY SOLUTION (EXPONENTIATED)
  /SAVE MEANPRED XBPRED.


#T3 Poisson with Alcohol Control DV

* Generalized Linear Models.
GENLIN T3Alcohol_Control WITH T3_Guilt_Control
  /MODEL T3_Guilt_Control INTERCEPT=YES
 DISTRIBUTION=POISSON LINK=LOG
  /CRITERIA METHOD=FISHER(1) SCALE=1 COVB=MODEL MAXITERATIONS=100 MAXSTEPHALVING=5 
    PCONVERGE=1E-006(ABSOLUTE) SINGULAR=1E-012 ANALYSISTYPE=3(WALD) CILEVEL=95 CITYPE=WALD 
    LIKELIHOOD=FULL
  /MISSING CLASSMISSING=EXCLUDE
  /PRINT CPS DESCRIPTIVES MODELINFO FIT SUMMARY SOLUTION (EXPONENTIATED)
  /SAVE MEANPRED XBPRED.

