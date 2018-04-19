
DATASET ACTIVATE DataSet1.
COMPUTE x0_x1=ABS(x0-x1).
EXECUTE.

COMPUTE x1_x2=ABS(x1-x2).
EXECUTE.

Formats x1_x2 (F0.5).

Compute Absolute_x=ABS(x0-x1)+ABS(x1-x2)+ABS(x2-x3)+ABS(x3-x4)+
ABS(x4-x5)+ABS(x5-x6)+ABS(x6-x7)+ABS(x7-x8)+ABS(x8-x9)+ABS(x9-x10)+
ABS(x10-x11)+ABS(x11-x12)+ABS(x12-x13)+ABS(x13-x14)+ABS(x14-x15)+
ABS(x15-x16)+ABS(x16-x17)+ABS(x17-x18)+ABS(x18-x19)+ABS(x19-x20)+
ABS(x20-x21)+ABS(x21-x22)+ABS(x22-x23)+ABS(x23-x24).

COMPUTE Absolute_x=ABS(x0-x1)+ABS(x1-x2)+ABS(x2-x3)+ABS(x3-x4)+ABS(x4-x5)+ABS(x5-x6)+ABS(x6-x7)+
    ABS(x7-x8)+ABS(x8-x9)+ABS(x9-x10)+ABS(x10-x11)+ABS(x11-x12)+ABS(x12-x13)+ABS(x13-x14)+ABS(x14-x15)+
    ABS(x15-x16)+ABS(x16-x17)+ABS(x17-x18)+ABS(x18-x19)+ABS(x19-x20)+ABS(x20-x21)+ABS(x21-x22)+
    ABS(x22-x23)+ABS(x23-x24).
EXECUTE.


COMPUTE Absolute_y=ABS(y0-y1)+ABS(y1-y2)+ABS(y2-y3)+ABS(y3-y4)+ABS(y4-y5)+ABS(y5-y6)+ABS(y6-y7)+
    ABS(y7-y8)+ABS(y8-y9)+ABS(y9-y10)+ABS(y10-y11)+ABS(y11-y12)+ABS(y12-y13)+ABS(y13-y14)+ABS(y14-y15)+
    ABS(y15-y16)+ABS(y16-y17)+ABS(y17-y18)+ABS(y18-y19)+ABS(y19-y20)+ABS(y20-y21)+ABS(y21-y22)+
    ABS(y22-y23)+ABS(y23-y24).
ExECUTE.



COMPUTE Absolute_z=ABS(z0-z1)+ABS(z1-z2)+ABS(z2-z3)+ABS(z3-z4)+ABS(z4-z5)+ABS(z5-z6)+ABS(z6-z7)+
    ABS(z7-z8)+ABS(z8-z9)+ABS(z9-z10)+ABS(z10-z11)+ABS(z11-z12)+ABS(z12-z13)+ABS(z13-z14)+ABS(z14-z15)+
    ABS(z15-z16)+ABS(z16-z17)+ABS(z17-z18)+ABS(z18-z19)+ABS(z19-z20)+ABS(z20-z21)+ABS(z21-z22)+
    ABS(z22-z23)+ABS(z23-z24).
EXECUTE.

GLM Absolute_x Absolute_y Absolute_z BY Start_CloseFar VH_gender Sub_gender
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /PLOT=PROFILE(VH_gender*Sub_gender)
  /CRITERIA=ALPHA(.05)
 /PRINT=DESCRIPTIVE ETASQ OPOWER
  /DESIGN= Start_CloseFar VH_gender Sub_gender Start_CloseFar*VH_gender Start_CloseFar*Sub_gender 
    VH_gender*Sub_gender Start_CloseFar*VH_gender*Sub_gender.

DATASET ACTIVATE DataSet1.
COMPUTE xDifferenceSums=(x0-x1)+(x1-x2)+(x2-x3)+(x3-x4)+(x4-x5)+(x5-x6)+(x6-x7)+
     (x7-x8)+(x8-x9)+(x9-x10)+(x10-x11)+(x11-x12)+(x12-x13)+(x13-x14)+(x14-x15)+
     (x15-x16)+(x16-x17)+(x17-x18)+(x18-x19)+(x19-x20)+(x20-x21)+(x21-x22)+
     (x22-x23)+(x23-x24)..
EXECUTE.

COMPUTE yDifferenceSums=(y0-y1)+(y1-y2)+(y2-y3)+(y3-y4)+(y4-y5)+(y5-y6)+(y6-y7)+
     (y7-y8)+(y8-y9)+(y9-y10)+(y10-y11)+(y11-y12)+(y12-y13)+(y13-y14)+(y14-y15)+
     (y15-y16)+(y16-y17)+(y17-y18)+(y18-y19)+(y19-y20)+(y20-y21)+(y21-y22)+
     (y22-y23)+(y23-y24)..
EXECUTE.

COMPUTE zDifferenceSums=(z0-z1)+(z1-z2)+(z2-z3)+(z3-z4)+(z4-z5)+(z5-z6)+(z6-z7)+
     (z7-z8)+(z8-z9)+(z9-z10)+(z10-z11)+(z11-z12)+(z12-z13)+(z13-z14)+(z14-z15)+
     (z15-z16)+(z16-z17)+(z17-z18)+(z18-z19)+(z19-z20)+(z20-z21)+(z21-z22)+
     (z22-z23)+(z23-z24)..
EXECUTE.

GLM xDifferenceSums yDifferenceSums zDifferenceSums BY Start_CloseFar VH_gender Sub_gender
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /CRITERIA=ALPHA(.05)
 /PRINT=DESCRIPTIVE ETASQ OPOWER
  /DESIGN= Start_CloseFar VH_gender Sub_gender Start_CloseFar*VH_gender Start_CloseFar*Sub_gender 
    VH_gender*Sub_gender Start_CloseFar*VH_gender*Sub_gender.


GLM xDifferenceSums yDifferenceSums zDifferenceSums BY Start_CloseFar VH_gender 
  /METHOD=SSTYPE(3)
  /INTERCEPT=INCLUDE
  /CRITERIA=ALPHA(.05)
 /PRINT=DESCRIPTIVE ETASQ OPOWER
  /DESIGN= Start_CloseFar VH_gender Start_CloseFar*VH_gender Start_CloseFar*VH_gender.

CORRELATIONS 
  /VARIABLES=Absolute_x Absolute_y Absolute_z xDifferenceSums yDifferenceSums zDifferenceSums with Spatial_Presence Parasocial_SocialPresence PassiveInterpersonal_SocialPresence Mental_Immersion Social_Richness 
  /PRINT=TWOTAIL NOSIG 
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=Spatial_Presence Parasocial_SocialPresence PassiveInterpersonal_SocialPresence Mental_Immersion Social_Richness with 
Acting_SE_Composite Expect_Recode SelfAssess_Recode xDifferenceSums yDifferenceSums zDifferenceSums Panas_2_Interested Panas_2_Distressed 
Panas_2_Excited Panas_2_Upset Panas_2_Strong Panas_2_Guilty Panas_2_Scared Panas_2_Hostile Panas_2_Enthusiastic Panas_2_Proud Panas_2_Irritable Panas_2_Alert Panas_2_Ashamed Panas_2_Inspired Panas_2_Nervous Panas_2_Determined Panas_2_Attentive
Panas_2_Jittery Panas_2_Active Panas_2_Afraid
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

COMPUTE Early_Y=(y5-y1).


COMPUTE Early0_Y=(y5-y0).
Execute.

COMPUTE y21_Y=(y21-y1).
COMPUTE y22_Y=(y22-y1).
COMPUTE y23_Y=(y23-y1).
COMPUTE y24_Y=(y24-y1).
COMPUTE y25_Y=(y25-y1).


COMPUTE Early_Z=(z5-z1).

COMPUTE z21_Z=(z21-z1).
COMPUTE z22_Z=(z22-z1).
COMPUTE z23_Z=(z23-z1).
COMPUTE z24_Z=(z24-z1).
COMPUTE z25_Z=(z25-z1).

COMPUTE Early_X=(x5-x1).

COMPUTE x21_X=(x21-x1).
COMPUTE x22_X=(x22-x1).
COMPUTE x23_X=(x23-x1).
COMPUTE x24_X=(x24-x1).
COMPUTE x25_X=(x25-x1).
EXECUTE.

DATASET ACTIVATE DataSet1.
CORRELATIONS
  /VARIABLES=Start_CloseFar with Early_Y Early_Z Early_X y21_Y y22_Y y23_Y y24_Y z21_Z z22_Z z23_Z z24_Z 
    x21_X x22_X x23_X x24_X
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=Start_CloseFar CDS_Composite_Causality CDS_Composite_External CDS_Composite_Stability 
    CDS_Composite_Personal PANAS_Post_Negative PANAS_Post_Positive Spatial_Presence 
    Parasocial_SocialPresence PassiveInterpersonal_SocialPresence Mental_Immersion Social_Richness with
    Early_Y Early_Z Early_X y21_Y y22_Y y23_Y y24_Y z21_Z z22_Z z23_Z z24_Z x21_X x22_X x23_X x24_X
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

COMPUTE y18_Y0=(y18-y0).
COMPUTE y19_Y0=(y19-y0).
COMPUTE y20_Y0=(y20-y0).
COMPUTE y21_Y0=(y21-y0).

COMPUTE x18_X0=(x18-x0).
COMPUTE x19_X0=(x19-x0).
COMPUTE x20_X0=(x20-x0).
COMPUTE x21_X0=(x21-x0).

COMPUTE z18_Z0=(z18-z0).
COMPUTE z19_Z0=(z19-z0).
COMPUTE z20_Z0=(z20-z0).
COMPUTE z21_Z0=(z21-z0).

Execute.

COMPUTE y20_Y0=(y21-y0).
COMPUTE y22_Y0=(y22-y0).
COMPUTE y23_Y0=(y23-y0).
COMPUTE y24_Y0=(y24-y0).
COMPUTE y25_Y0=(y25-y0).


COMPUTE z20_Z0=(z21-z0).
COMPUTE z22_Z0=(z22-z0).
COMPUTE z23_Z0=(z23-z0).
COMPUTE z24_Z0=(z24-z0).
COMPUTE z25_Z0=(z25-z0).

COMPUTE x21_X0=(x21-x0).
COMPUTE x22_X0=(x22-x0).
COMPUTE x23_X0=(x23-x0).
COMPUTE x24_X0=(x24-x0).
COMPUTE x25_X0=(x25-x0).

EXECUTE.

COMPUTE Early_Y0=(y5-y0).
COMPUTE Early_x0=(x5-x0).
COMPUTE Early_z0=(z5-z0).
Execute.

CORRELATIONS
  /VARIABLES=Start_CloseFar CDS_Composite_Causality CDS_Composite_External CDS_Composite_Stability 
    CDS_Composite_Personal PANAS_Post_Negative PANAS_Post_Positive Spatial_Presence 
    Parasocial_SocialPresence PassiveInterpersonal_SocialPresence Mental_Immersion Social_Richness with
    y20_Y0 y22_Y0 y23_Y0 y24_Y0 z20_Z0 z22_Z0 z23_Z0 z24_Z0 x21_X0 x22_X0 x23_X0 x24_X0 Early_Y0 Early_x0 Early_z0
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT y20_Y0
  /METHOD=ENTER Start_CloseFar.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT y22_Y0
  /METHOD=ENTER Start_CloseFar.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT y23_Y0
  /METHOD=ENTER Start_CloseFar.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT y24_Y0
  /METHOD=ENTER Start_CloseFar.


#x close-far

REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT x22_X0
  /METHOD=ENTER Start_CloseFar.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT x23_X0
  /METHOD=ENTER Start_CloseFar.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT x24_X0
  /METHOD=ENTER Start_CloseFar.

#z close-far




REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT z22_Z0
  /METHOD=ENTER Start_CloseFar.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT z23_Z0
  /METHOD=ENTER Start_CloseFar.


REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT z24_Z0
  /METHOD=ENTER Start_CloseFar.



CORRELATIONS
  /VARIABLES=y20_Y0 y22_Y0 y23_Y0 y24_Y0 with Start_CloseFar Parasocial_SocialPresenceFA 
    Parasocial_SocialPresenceFA2 Spatial_PresenceFA Social_RichnessFA 
    PassiveInterpersonal_SocialPresence Mental_Immersion CDS_Composite_Causality CDS_Composite_External 
    CDS_Composite_Stability CDS_Composite_Personal Acting_SE_Composite gender_s VH_Gender adHoc12 
    adHoc13 adHoc1 adHoc2 adHoc3 adHoc4 adHoc5 adHoc6 adHoc7 adHoc8 adHoc9 adHoc10 adHoc11
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

COMPUTE Early_Y3=(y3-y0).
COMPUTE Early_x3=(x3-x0).
COMPUTE Early_z3=(z3-z0).
Execute.


CORRELATIONS
  /VARIABLES=Early_Y3 Early_x3 Early_z3 with Start_CloseFar 
    Parasocial_SocialPresenceFA Parasocial_SocialPresenceFA2 Spatial_PresenceFA Social_RichnessFA 
    PassiveInterpersonal_SocialPresence Mental_Immersion CDS_Composite_Causality CDS_Composite_External 
    CDS_Composite_Stability CDS_Composite_Personal Acting_SE_Composite gender_s VH_Gender adHoc12 
    adHoc13 adHoc1 adHoc2 adHoc3 adHoc4 adHoc5 adHoc6 adHoc7 adHoc8 adHoc9 adHoc10 adHoc11
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


CORRELATIONS
  /VARIABLES= Start_CloseFar 
    Parasocial_SocialPresenceFA Parasocial_SocialPresenceFA2 Spatial_PresenceFA Social_RichnessFA 
    PassiveInterpersonal_SocialPresence Mental_Immersion adHoc12 
    adHoc13 adHoc1 adHoc2 adHoc3 adHoc4 adHoc5 adHoc6 adHoc7 adHoc8 adHoc9 adHoc10 adHoc11 
    with Early_Y3 Early_x3 Early_z3 
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.

CORRELATIONS
  /VARIABLES=Start_CloseFar Parasocial_SocialPresenceFA Parasocial_SocialPresenceFA2 
    Spatial_PresenceFA Social_RichnessFA PassiveInterpersonal_SocialPresence Mental_Immersion 
    CDS_Composite_Causality CDS_Composite_External CDS_Composite_Stability CDS_Composite_Personal 
    Acting_SE_Composite gender_s VH_Gender adHoc12 adHoc13 adHoc1 adHoc2 adHoc3 adHoc4 adHoc5 adHoc6 
    adHoc7 adHoc8 adHoc9 adHoc10 adHoc11 with y18_Y0 y19_Y0 y20_Y0 y21_Y0 x18_X0 x19_X0 x20_X0 x21_X z18_Z0 
    z19_Z0 z20_Z0 z21_Z0
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.


COMPUTE abs_y18_Y0=abs(y18-y0).
COMPUTE abs_y19_Y0=abs(y19-y0).
COMPUTE abs_y20_Y0=abs(y20-y0).
COMPUTE abs_y21_Y0=abs(y21-y0).

COMPUTE abs_x18_X0=abs(x18-x0).
COMPUTE abs_x19_X0=abs(x19-x0).
COMPUTE abs_x20_X0=abs(x20-x0).
COMPUTE abs_x21_X0=abs(x21-x0).

COMPUTE abs_z18_Z0=abs(z18-z0).
COMPUTE abs_z19_Z0=abs(z19-z0).
COMPUTE abs_z20_Z0=abs(z20-z0).
COMPUTE abs_z21_Z0=abs(z21-z0).
Execute.

CORRELATIONS
  /VARIABLES=Start_CloseFar Parasocial_SocialPresenceFA Parasocial_SocialPresenceFA2 
    Spatial_PresenceFA Social_RichnessFA PassiveInterpersonal_SocialPresence Mental_Immersion 
    CDS_Composite_Causality CDS_Composite_External CDS_Composite_Stability CDS_Composite_Personal 
    Acting_SE_Composite gender_s VH_Gender adHoc12 adHoc13 adHoc1 adHoc2 adHoc3 adHoc4 adHoc5 adHoc6 
    adHoc7 adHoc8 adHoc9 adHoc10 adHoc11 with abs_y18_Y0 abs_y19_Y0 abs_y20_Y0 abs_y21_Y0 abs_x18_X0 
    abs_x19_X0 abs_x20_X0 abs_x21_X0 abs_z18_Z0 abs_z19_Z0 abs_z20_Z0 abs_z21_Z0
  /PRINT=TWOTAIL NOSIG
  /MISSING=PAIRWISE.
