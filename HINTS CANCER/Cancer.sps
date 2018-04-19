
DATASET ACTIVATE DataSet3.
RECODE CaBladder (1=1) (ELSE=0) INTO Bladder.
EXECUTE.

RECODE CaBreast (1=2) (ELSE=0) INTO Breast.
EXECUTE.

RECODE CaColon (1=3) (ELSE=0) INTO Colon.
EXECUTE.

RECODE CaEndometrial (1=4) (ELSE=0) INTO Endometrial.
EXECUTE.

RECODE CaLeukemia (1=5) (ELSE=0) INTO Leukemia.
EXECUTE.

RECODE CaLiver (1=6) (ELSE=0) INTO Liver.
EXECUTE.

RECODE CaLung (1=7) (ELSE=0) INTO Lung.
EXECUTE.

RECODE CaNonHodgkin (1=8) (ELSE=0) INTO NonHodgkin.
EXECUTE.

RECODE CaPancreatic (1=9) (ELSE=0) INTO Pancreatic.
EXECUTE.

RECODE CaProstate (1=10) (ELSE=0) INTO Prostate.
EXECUTE.

IF CaBladder=1 cancer=1. 
IF CaBreast=1 cancer=2. 
IF CaColon=1 cancer=3.
IF CaEndometrial=1 cancer=4.
IF CaLeukemia=1 cancer=5. 
IF CaLiver=1 cancer=6. 
IF CaLung=1 cancer=7.
IF CaNonHodgkin=1 cancer=8.
IF CaPancreatic=1 cancer=9.
IF CaProstate=1 cancer=10.
ADD VALUE LABELS cancer 1'Bladder' 2 'breast' 3 'colon' 4 'endometrial' 5 'leukemia' 6 'liver' 7 'lung' 8 'nonhodgkin' 9 'pancreatic' 10 'prostate'.
Execute.
