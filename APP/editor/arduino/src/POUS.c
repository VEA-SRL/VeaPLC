#include "POUS.h"

void PROGRAM0_init__(PROGRAM0 *data__, BOOL retain) {
  __INIT_LOCATED(BOOL,__QX0_0,data__->OUT0,retain)
  __INIT_LOCATED_VALUE(data__->OUT0,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_1,data__->OUT1,retain)
  __INIT_LOCATED_VALUE(data__->OUT1,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_2,data__->OUT2,retain)
  __INIT_LOCATED_VALUE(data__->OUT2,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_3,data__->OUT3,retain)
  __INIT_LOCATED_VALUE(data__->OUT3,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_4,data__->OUT4,retain)
  __INIT_LOCATED_VALUE(data__->OUT4,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_5,data__->OUT5,retain)
  __INIT_LOCATED_VALUE(data__->OUT5,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_6,data__->OUT6,retain)
  __INIT_LOCATED_VALUE(data__->OUT6,__BOOL_LITERAL(FALSE))
  __INIT_LOCATED(BOOL,__QX0_7,data__->OUT7,retain)
  __INIT_LOCATED_VALUE(data__->OUT7,__BOOL_LITERAL(FALSE))
  __INIT_VAR(data__->TIMEON0,__time_to_timespec(1, 5000, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEON1,__time_to_timespec(1, 500, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEON2,__time_to_timespec(1, 2100, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEON3,__time_to_timespec(1, 3000, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEON4,__time_to_timespec(1, 200, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEON5,__time_to_timespec(1, 260, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEON6,__time_to_timespec(1, 800, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEON7,__time_to_timespec(1, 1300, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEOFF0,__time_to_timespec(1, 10000, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEOFF1,__time_to_timespec(1, 500, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEOFF2,__time_to_timespec(1, 2100, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEOFF3,__time_to_timespec(1, 200, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEOFF4,__time_to_timespec(1, 100, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEOFF5,__time_to_timespec(1, 1000, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEOFF6,__time_to_timespec(1, 1400, 0, 0, 0, 0),retain)
  __INIT_VAR(data__->TIMEOFF7,__time_to_timespec(1, 50, 0, 0, 0, 0),retain)
  TON_init__(&data__->TON0,retain);
  TOF_init__(&data__->TOF0,retain);
  TON_init__(&data__->TON1,retain);
  TOF_init__(&data__->TOF1,retain);
  TON_init__(&data__->TON2,retain);
  TOF_init__(&data__->TOF2,retain);
  TON_init__(&data__->TON3,retain);
  TOF_init__(&data__->TOF3,retain);
  TON_init__(&data__->TON4,retain);
  TOF_init__(&data__->TOF4,retain);
  TON_init__(&data__->TON5,retain);
  TOF_init__(&data__->TOF5,retain);
  TON_init__(&data__->TON6,retain);
  TOF_init__(&data__->TOF6,retain);
  TON_init__(&data__->TON7,retain);
  TOF_init__(&data__->TOF7,retain);
}

// Code part
void PROGRAM0_body__(PROGRAM0 *data__) {
  // Initialise TEMP variables

  __SET_VAR(data__->TON1.,IN,,!(__GET_LOCATED(data__->OUT1,)));
  __SET_VAR(data__->TON1.,PT,,__GET_VAR(data__->TIMEON1,));
  TON_body__(&data__->TON1);
  __SET_LOCATED(data__->,OUT1,,__GET_VAR(data__->TON1.Q,));
  __SET_VAR(data__->TON5.,IN,,!(__GET_LOCATED(data__->OUT3,)));
  __SET_VAR(data__->TON5.,PT,,__GET_VAR(data__->TIMEON3,));
  TON_body__(&data__->TON5);
  __SET_LOCATED(data__->,OUT3,,__GET_VAR(data__->TON5.Q,));
  __SET_VAR(data__->TON0.,IN,,!(__GET_LOCATED(data__->OUT0,)));
  __SET_VAR(data__->TON0.,PT,,__GET_VAR(data__->TIMEON0,));
  TON_body__(&data__->TON0);
  __SET_LOCATED(data__->,OUT0,,__GET_VAR(data__->TON0.Q,));
  __SET_VAR(data__->TON4.,IN,,!(__GET_LOCATED(data__->OUT2,)));
  __SET_VAR(data__->TON4.,PT,,__GET_VAR(data__->TIMEON2,));
  TON_body__(&data__->TON4);
  __SET_LOCATED(data__->,OUT2,,__GET_VAR(data__->TON4.Q,));
  __SET_VAR(data__->TOF1.,IN,,__GET_LOCATED(data__->OUT1,));
  __SET_VAR(data__->TOF1.,PT,,__GET_VAR(data__->TIMEOFF1,));
  TOF_body__(&data__->TOF1);
  __SET_LOCATED(data__->,OUT1,,__GET_VAR(data__->TOF1.Q,));
  __SET_VAR(data__->TOF5.,IN,,__GET_LOCATED(data__->OUT3,));
  __SET_VAR(data__->TOF5.,PT,,__GET_VAR(data__->TIMEOFF3,));
  TOF_body__(&data__->TOF5);
  __SET_LOCATED(data__->,OUT3,,__GET_VAR(data__->TOF5.Q,));
  __SET_VAR(data__->TOF0.,IN,,__GET_LOCATED(data__->OUT0,));
  __SET_VAR(data__->TOF0.,PT,,__GET_VAR(data__->TIMEOFF0,));
  TOF_body__(&data__->TOF0);
  __SET_LOCATED(data__->,OUT0,,__GET_VAR(data__->TOF0.Q,));
  __SET_VAR(data__->TOF4.,IN,,__GET_LOCATED(data__->OUT2,));
  __SET_VAR(data__->TOF4.,PT,,__GET_VAR(data__->TIMEOFF2,));
  TOF_body__(&data__->TOF4);
  __SET_LOCATED(data__->,OUT2,,__GET_VAR(data__->TOF4.Q,));
  __SET_VAR(data__->TON2.,IN,,!(__GET_LOCATED(data__->OUT4,)));
  __SET_VAR(data__->TON2.,PT,,__GET_VAR(data__->TIMEON4,));
  TON_body__(&data__->TON2);
  __SET_LOCATED(data__->,OUT4,,__GET_VAR(data__->TON2.Q,));
  __SET_VAR(data__->TON3.,IN,,!(__GET_LOCATED(data__->OUT5,)));
  __SET_VAR(data__->TON3.,PT,,__GET_VAR(data__->TIMEON5,));
  TON_body__(&data__->TON3);
  __SET_LOCATED(data__->,OUT5,,__GET_VAR(data__->TON3.Q,));
  __SET_VAR(data__->TON6.,IN,,!(__GET_LOCATED(data__->OUT6,)));
  __SET_VAR(data__->TON6.,PT,,__GET_VAR(data__->TIMEON6,));
  TON_body__(&data__->TON6);
  __SET_LOCATED(data__->,OUT6,,__GET_VAR(data__->TON6.Q,));
  __SET_VAR(data__->TON7.,IN,,!(__GET_LOCATED(data__->OUT7,)));
  __SET_VAR(data__->TON7.,PT,,__GET_VAR(data__->TIMEON7,));
  TON_body__(&data__->TON7);
  __SET_LOCATED(data__->,OUT7,,__GET_VAR(data__->TON7.Q,));
  __SET_VAR(data__->TOF2.,IN,,__GET_LOCATED(data__->OUT4,));
  __SET_VAR(data__->TOF2.,PT,,__GET_VAR(data__->TIMEOFF4,));
  TOF_body__(&data__->TOF2);
  __SET_LOCATED(data__->,OUT4,,__GET_VAR(data__->TOF2.Q,));
  __SET_VAR(data__->TOF3.,IN,,__GET_LOCATED(data__->OUT5,));
  __SET_VAR(data__->TOF3.,PT,,__GET_VAR(data__->TIMEOFF5,));
  TOF_body__(&data__->TOF3);
  __SET_LOCATED(data__->,OUT5,,__GET_VAR(data__->TOF3.Q,));
  __SET_VAR(data__->TOF6.,IN,,__GET_LOCATED(data__->OUT6,));
  __SET_VAR(data__->TOF6.,PT,,__GET_VAR(data__->TIMEOFF6,));
  TOF_body__(&data__->TOF6);
  __SET_LOCATED(data__->,OUT6,,__GET_VAR(data__->TOF6.Q,));
  __SET_VAR(data__->TOF7.,IN,,__GET_LOCATED(data__->OUT7,));
  __SET_VAR(data__->TOF7.,PT,,__GET_VAR(data__->TIMEOFF7,));
  TOF_body__(&data__->TOF7);
  __SET_LOCATED(data__->,OUT7,,__GET_VAR(data__->TOF7.Q,));

  goto __end;

__end:
  return;
} // PROGRAM0_body__() 





