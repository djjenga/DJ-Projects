
DATASET ACTIVATE DataSet1.
CORRELATIONS
  /VARIABLES=CDS_Causality CDS_Stability CDS_Personal CDS_External Self_Esteem Self_Assessment 
    Effort Accurate Underperform gender VH_Gender Proxemics
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

COMPUTE SelfEsteem_FA=Mean (Self_Est_1,Self_Est_3,Self_Est_4,Self_Est_7,Self_Est_10).
EXECUTE.

FACTOR
  /VARIABLES CDS1_Causality1 CDS1_Causality4 CDS1_Causality2 CDS1_Causality3 CDS1_Causality5
  /MISSING LISTWISE 
  /ANALYSIS CDS1_Causality1 CDS1_Causality4 CDS1_Causality2 CDS1_Causality3 CDS1_Causality5
  /PRINT INITIAL EXTRACTION ROTATION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES CDS1_Personal CDS1_Personal2 CDS1_Personal3
  /MISSING LISTWISE 
  /ANALYSIS CDS1_Personal CDS1_Personal2 CDS1_Personal3
  /PRINT INITIAL EXTRACTION ROTATION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES CDS1_Stability1 CDS1_Stability2 CDS1_Stability3
  /MISSING LISTWISE 
  /ANALYSIS CDS1_Stability1 CDS1_Stability2 CDS1_Stability3
  /PRINT INITIAL EXTRACTION ROTATION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

FACTOR
  /VARIABLES 
    CDS1_External3
  /MISSING LISTWISE 
  /ANALYSIS CDS1_External6 CDS1_External1 CDS1_External4 CDS1_External2 CDS1_External5 
    CDS1_External3
  /PRINT INITIAL EXTRACTION ROTATION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

RELIABILITY
  /VARIABLES=CDS1_Causality1 CDS1_Causality4 CDS1_Causality2 CDS1_Causality3 CDS1_Causality5
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


RELIABILITY
  /VARIABLES=CDS1_External6 CDS1_External1 CDS1_External4 CDS1_External2 CDS1_External5 
    CDS1_External3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


RELIABILITY
  /VARIABLES=CDS1_Personal CDS1_Personal2 CDS1_Personal3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.


RELIABILITY
  /VARIABLES=CDS1_Stability1 CDS1_Stability2 CDS1_Stability3
  /SCALE('ALL VARIABLES') ALL
  /MODEL=ALPHA.




CORRELATIONS
  /VARIABLES=SelfEsteem_FA with interest2 distress2 excited2 upset2 strong2 guilty2 scared2 hostile2 
    enthus2 proud2 irritable2 alert2 ashamed2 inspired2 nervous2 determined2 attentive2 jittery2 
    active2 afraid2
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=SelfEsteem_FA with interest distress excited upset strong guilty scared hostile 
    enthusiastic proud irritable alert ashamed inspired nervous determined attentive jittery active 
    afraid
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

FACTOR
  /VARIABLES distress2 upset2 guilty2 scared2 hostile2 irritable2 ashamed2 nervous2 jittery2 afraid2    
  /MISSING LISTWISE 
  /ANALYSIS distress2 upset2 guilty2 scared2 hostile2 irritable2 ashamed2 nervous2 jittery2 afraid2
  /PRINT INITIAL EXTRACTION ROTATION
  /CRITERIA MINEIGEN(1) ITERATE(25)
  /EXTRACTION PC
  /CRITERIA ITERATE(25)
  /ROTATION VARIMAX
  /METHOD=CORRELATION.

COMPUTE Panas_post_guilt_comp=Mean (guilty2,scared2,ashamed2,nervous2,jittery2).
EXECUTE.

COMPUTE ASE_Comp=Mean (ASE_6.0,ASE_4.0,ASE_3.0,ASE_2.0,ASE_1.0,ASE_7.0).
EXECUTE.
