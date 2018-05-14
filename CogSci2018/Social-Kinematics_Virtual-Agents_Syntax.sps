

DATASET ACTIVATE DataSet4.
GLM Q1_1 Q10_1 Q18_1 Q166_1 Q177_1 Q187_1 Q197_1 Q207_1 Q217_1 Q227_1 Q237_1 Q247_1 Q257_1 Q267_1 
    Q277_1 Q287_1 Q2_1 Q11_1 Q19_1 Q167_1 Q178_1 Q188_1 Q198_1 Q208_1 Q218_1 Q228_1 Q238_1 Q248_1 
    Q258_1 Q268_1 Q278_1 Q288_1 Q4_1 Q12_1 Q20_1 Q168_1 Q179_1 Q189_1 Q199_1 Q209_1 Q219_1 Q229_1 
    Q239_1 Q249_1 Q259_1 Q269_1 Q279_1 Q289_1 Q5_1 Q13_1 Q21_1 Q169_1 Q180_1 Q190_1 Q200_1 Q210_1 
    Q220_1 Q230_1 Q240_1 Q250_1 Q260_1 Q270_1 Q280_1 Q290_1 Q6_1 Q14_1 Q22_1 Q170_1 Q181_1 Q191_1 
    Q201_1 Q211_1 Q221_1 Q231_1 Q241_1 Q251_1 Q261_1 Q271_1 Q281_1 Q291_1 Q7_1 Q15_1 Q23_1 Q171_1 
    Q182_1 Q192_1 Q202_1 Q212_1 Q222_1 Q232_1 Q242_1 Q252_1 Q262_1 Q272_1 Q282_1 Q292_1 Q8_1 Q16_1 
    Q24_1 Q172_1 Q183_1 Q193_1 Q203_1 Q213_1 Q223_1 Q233_1 Q243_1 Q253_1 Q263_1 Q273_1 Q283_1 Q293_1 
    Q9_1 Q17_1 Q25_1 Q173_1 Q184_1 Q194_1 Q204_1 Q214_1 Q224_1 Q234_1 Q244_1 Q254_1 Q264_1 Q274_1 
    Q284_1 Q294_1
  /WSFACTOR=Distance 2 Polynomial Speed 2 Polynomial Gaze 2 Polynomial Direction 2 Polynomial 
  /MEASURE=Duty Intellect Adversity Mating Positivity Negativity Deception Sociality 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(Distance*Speed*Gaze Speed*Gaze*Direction Direction*Speed*Distance 
    Distance*Gaze*Direction)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Distance) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Speed) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Gaze) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Direction) COMPARE ADJ(LSD)
  /EMMEANS=TABLES(Distance*Speed) 
  /EMMEANS=TABLES(Distance*Gaze) 
  /EMMEANS=TABLES(Distance*Direction) 
  /EMMEANS=TABLES(Speed*Gaze) 
  /EMMEANS=TABLES(Speed*Direction) 
  /EMMEANS=TABLES(Gaze*Direction) 
  /EMMEANS=TABLES(Distance*Speed*Gaze) 
  /EMMEANS=TABLES(Distance*Speed*Direction) 
  /EMMEANS=TABLES(Distance*Gaze*Direction) 
  /EMMEANS=TABLES(Speed*Gaze*Direction) 
  /EMMEANS=TABLES(Distance*Speed*Gaze*Direction) 
  /PRINT=DESCRIPTIVE ETASQ OPOWER 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Distance Speed Gaze Direction Distance*Speed Distance*Gaze Speed*Gaze 
    Distance*Speed*Gaze Distance*Direction Speed*Direction Distance*Speed*Direction Gaze*Direction 
    Distance*Gaze*Direction Speed*Gaze*Direction Distance*Speed*Gaze*Direction.
