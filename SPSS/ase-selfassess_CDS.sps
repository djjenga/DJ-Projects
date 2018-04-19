
DATASET ACTIVATE DataSet2.
GLM CDS_Composite_Causality CDS_Composite_External CDS_Composite_Stability CDS_Composite_Personal 
    BY SelfAssess_Recode Acting_SE_LowHigh
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(SelfAssess_Recode*Acting_SE_LowHigh)
  /CRITERIA=ALPHA(.05)
  /DESIGN= SelfAssess_Recode Acting_SE_LowHigh SelfAssess_Recode*Acting_SE_LowHigh.

#self esteem low high

DATASET ACTIVATE DataSet1.
RECODE SE_Composite (Lowest thru 2.89=1) (2.9 thru Highest=2) INTO SelfEsteem_LowHigh.
EXECUTE.
