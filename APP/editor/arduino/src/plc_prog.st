PROGRAM program0
  VAR
    OUT0 AT %QX0.0 : BOOL := false;
    OUT1 AT %QX0.1 : BOOL := false;
    OUT2 AT %QX0.2 : BOOL := false;
    OUT3 AT %QX0.3 : BOOL := false;
    OUT4 AT %QX0.4 : BOOL := false;
    OUT5 AT %QX0.5 : BOOL := false;
    OUT6 AT %QX0.6 : BOOL := false;
    OUT7 AT %QX0.7 : BOOL := false;
  END_VAR
  VAR
    TimeOn0 : TIME := T#5000ms;
    TimeOn1 : TIME := T#500ms;
    TimeOn2 : TIME := T#2100ms;
    TimeOn3 : TIME := T#3000ms;
    TimeOn4 : TIME := T#200ms;
    TimeOn5 : TIME := T#260ms;
    TimeOn6 : TIME := T#800ms;
    TimeOn7 : TIME := T#1300ms;
    TimeOff0 : TIME := T#10000ms;
    TimeOff1 : TIME := T#500ms;
    TimeOff2 : TIME := T#2100ms;
    TimeOff3 : TIME := T#200ms;
    TimeOff4 : TIME := T#100ms;
    TimeOff5 : TIME := T#1000ms;
    TimeOff6 : TIME := T#1400ms;
    TimeOff7 : TIME := T#50ms;
    TON0 : TON;
    TOF0 : TOF;
    TON1 : TON;
    TOF1 : TOF;
    TON2 : TON;
    TOF2 : TOF;
    TON3 : TON;
    TOF3 : TOF;
    TON4 : TON;
    TOF4 : TOF;
    TON5 : TON;
    TOF5 : TOF;
    TON6 : TON;
    TOF6 : TOF;
    TON7 : TON;
    TOF7 : TOF;
  END_VAR

  TON1(IN := NOT(OUT1), PT := TimeOn1);
  OUT1 := TON1.Q;
  TON5(IN := NOT(OUT3), PT := TimeOn3);
  OUT3 := TON5.Q;
  TON0(IN := NOT(OUT0), PT := TimeOn0);
  OUT0 := TON0.Q;
  TON4(IN := NOT(OUT2), PT := TimeOn2);
  OUT2 := TON4.Q;
  TOF1(IN := OUT1, PT := TimeOff1);
  OUT1 := TOF1.Q;
  TOF5(IN := OUT3, PT := TimeOff3);
  OUT3 := TOF5.Q;
  TOF0(IN := OUT0, PT := TimeOff0);
  OUT0 := TOF0.Q;
  TOF4(IN := OUT2, PT := TimeOff2);
  OUT2 := TOF4.Q;
  TON2(IN := NOT(OUT4), PT := TimeOn4);
  OUT4 := TON2.Q;
  TON3(IN := NOT(OUT5), PT := TimeOn5);
  OUT5 := TON3.Q;
  TON6(IN := NOT(OUT6), PT := TimeOn6);
  OUT6 := TON6.Q;
  TON7(IN := NOT(OUT7), PT := TimeOn7);
  OUT7 := TON7.Q;
  TOF2(IN := OUT4, PT := TimeOff4);
  OUT4 := TOF2.Q;
  TOF3(IN := OUT5, PT := TimeOff5);
  OUT5 := TOF3.Q;
  TOF6(IN := OUT6, PT := TimeOff6);
  OUT6 := TOF6.Q;
  TOF7(IN := OUT7, PT := TimeOff7);
  OUT7 := TOF7.Q;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK task0(INTERVAL := T#20ms,PRIORITY := 0);
    PROGRAM instance0 WITH task0 : program0;
  END_RESOURCE
END_CONFIGURATION
