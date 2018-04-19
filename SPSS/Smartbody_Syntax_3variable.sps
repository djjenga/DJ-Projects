= Visual =


GLM Q1_1 Q10_1 Q177_1 Q187_1 Q217_1 Q227_1 Q257_1 Q267_1 Q2_1 Q11_1 Q178_1 Q188_1 Q218_1 Q228_1 
    Q258_1 Q268_1 Q4_1 Q12_1 Q179_1 Q189_1 Q219_1 Q229_1 Q259_1 Q269_1 Q5_1 Q13_1 Q180_1 Q190_1 Q220_1 
    Q230_1 Q260_1 Q270_1 Q6_1 Q14_1 Q181_1 Q191_1 Q221_1 Q231_1 Q261_1 Q271_1 Q7_1 Q15_1 Q182_1 Q192_1 
    Q222_1 Q232_1 Q262_1 Q272_1 Q8_1 Q16_1 Q183_1 Q193_1 Q223_1 Q233_1 Q263_1 Q273_1 Q9_1 Q17_1 Q184_1 
    Q194_1 Q224_1 Q234_1 Q264_1 Q274_1
  /WSFACTOR=Distance 2 Polynomial Speed 2 Polynomial Direction 2 Polynomial 
  /MEASURE=Duty Intellect Adversity Mating Positivity Negativity Deception Sociality 
 /METHOD=SSTYPE(3)
 /PLOT=PROFILE(Distance*Speed Speed*Direction Direction*Speed*Distance Distance*Direction)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Distance) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(Speed) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(Direction) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(Distance*Speed) COMPARE (Speed) ADJ(BONFERRONI)
  /EMMEANS=TABLES(Distance*Direction) COMPARE (Direction) ADJ(BONFERRONI)
  /EMMEANS=TABLES(Speed*Direction) COMPARE (Direction)  ADJ(BONFERRONI)
  /EMMEANS=TABLES(Distance*Speed*Direction) COMPARE (Direction) COMPARE (Speed) ADJ(BONFERRONI)  
  /PRINT=DESCRIPTIVE ETASQ OPOWER 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Distance Speed Direction Distance*Speed Distance*Direction Speed*Direction 
    Distance*Speed*Direction.


= Text =

GLM Q1_1 Q10_1 Q34_1 Q42_1 Q66_1 Q74_1 Q98_1 Q106_1 Q2_1 Q11_1 Q35_1 Q43_1 Q67_1 Q75_1 Q99_1 Q107_1 
    Q4_1 Q12_1 Q36_1 Q44_1 Q68_1 Q76_1 Q100_1 Q108_1 Q5_1 Q13_1 Q37_1 Q45_1 Q69_1 Q77_1 Q101_1 Q109_1 
    Q6_1 Q14_1 Q38_1 Q46_1 Q70_1 Q78_1 Q102_1 Q110_1 Q7_1 Q15_1 Q39_1 Q47_1 Q71_1 Q79_1 Q103_1 Q111_1 
    Q8_1 Q16_1 Q40_1 Q48_1 Q72_1 Q80_1 Q104_1 Q112_1 Q9_1 Q17_1 Q41_1 Q49_1 Q73_1 Q81_1 Q105_1 Q113_1
  /WSFACTOR=Distance 2 Polynomial Direction 2 Polynomial Speed 2 Polynomial 
  /MEASURE=Duty Intellect Adversity Mating Positivity Negativity Deception Sociality 
  /METHOD=SSTYPE(3)
 /PLOT=PROFILE(Distance Direction Speed Distance*Direction Distance*Speed 
    Direction*Distance Direction*Speed 
    Distance*Direction*Speed Direction*Speed*Distance 
    Direction*Distance)
  /EMMEANS=TABLES(OVERALL) 
  /EMMEANS=TABLES(Distance) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(Direction) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(Speed) COMPARE ADJ(BONFERRONI)
  /EMMEANS=TABLES(Distance*Direction) COMPARE (Direction) ADJ(BONFERRONI)
  /EMMEANS=TABLES(Distance*Speed) COMPARE (Speed) ADJ(BONFERRONI)
  /EMMEANS=TABLES(Direction*Speed) COMPARE (Direction) ADJ(BONFERRONI)
  /EMMEANS=TABLES(Distance*Direction*Speed) COMPARE (Direction) COMPARE (Speed) ADJ(BONFERRONI)  
  /PRINT=DESCRIPTIVE ETASQ OPOWER HOMOGENEITY 
  /PLOT=SPREADLEVEL 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=Distance Direction Speed Distance*Direction Distance*Speed Direction*Speed 
    Distance*Direction*Speed.

