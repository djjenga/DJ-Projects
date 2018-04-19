=Data cleaning=

RECODE TV_Radio_Damage TV_Radio_Deaths TV_Radio_Traffic TV_Radio_Prep TV_Radio_Stay TV_Radio_Evac 
    (4=1) (1=2) (2=3) (3=4) (ELSE=Copy) INTO TVRadio_Damage TVRadio_Deaths TVRadio_Traffic TVRadio_Prep 
    TVRadio_Stay TVRadio_Evac.
EXECUTE.

DATASET ACTIVATE DataSet1.
FREQUENCIES VARIABLES=Evacuation_Notice_Official Evacuation_Mandatory_Recommended Evacuate_Yes_No 
    Distance_Coast ZipCode Neighbors_Decisions Family_Suggestion SocialMedia_Stay SocialMedia_Leave 
    TV_Radio_Stay TV_Radio_Evac
  /STATISTICS=MEAN MEDIAN
  /ORDER=ANALYSIS.

COMPUTE TV_Radio=Mean(TVRadio_Damage,TVRadio_Deaths,TVRadio_Traffic,TVRadio_Prep,TVRadio_Stay,
    TVRadio_Evac).
EXECUTE.

COMPUTE Social_media=Mean(TV_Radio_Damage,TV_Radio_Deaths,TV_Radio_Traffic,TV_Radio_Prep,
    TV_Radio_Stay,TV_Radio_Evac).
EXECUTE.

FREQUENCIES VARIABLES=Evacuate_Yes_No
  /STATISTICS=MEAN MEDIAN
  /ORDER=ANALYSIS.

DO IF  (Evacuation_Notice_Official=1).
RECODE Evacuate_Yes_No (ELSE=Copy) INTO Evac_test2.
END IF.
EXECUTE.


DO IF (Evacuation_Mandatory_Recommended =1).
RECODE Evacuate_Yes_No (ELSE=Copy) INTO Evac_Mand_Evac.
END IF.
EXECUTE.


DO IF (Evacuation_Mandatory_Recommended =2).
RECODE Evacuate_Yes_No (ELSE=Copy) INTO Evac_Mand_Stay.
END IF.
EXECUTE.



