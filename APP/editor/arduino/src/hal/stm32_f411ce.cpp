#include <stdlib.h>
extern "C" {
#include "openplc.h"
}
#include "Arduino.h"
#include "../examples/Baremetal/defines.h"

//OpenPLC HAL for STM32F411CE boards (blackpill)
/******************PINOUT CONFIGURATION**************************
Digital In:  PA8, PA11, PA12, PB3, PB4, PB5, PB8, PB9 		    (%IX0.0 - %IX0.7)
Digital Out: PB10, PB12, PB13, PB14, PB15, PC13, PC14, PC15 	(%QX0.0 - %QX0.7)
Analog In:   PA0, PA1, PA4, PA5, PA6, PA7                 	    (%IW0 - %IW5)
Analog Out:  PB0, PB1                         			        (%QW0 - %QW1)
*****************************************************************/

//Create the I/O pin masks
uint8_t pinMask_DIN[] = {PINMASK_DIN};
uint8_t pinMask_AIN[] = {PINMASK_AIN};
uint8_t pinMask_DOUT[] = {PINMASK_DOUT};
uint8_t pinMask_AOUT[] = {PINMASK_AOUT};


void hardwareInit()
{
    for (int i = 0; i < NUM_DISCRETE_INPUT; i++)
    {
        pinMode(pinMask_DIN[i], INPUT);
    }

    for (int i = 0; i < NUM_ANALOG_INPUT; i++)
    {
        pinMode(pinMask_AIN[i], INPUT);
    }

    for (int i = 0; i < NUM_DISCRETE_OUTPUT; i++)
    {
        pinMode(pinMask_DOUT[i], OUTPUT);
    }

    for (int i = 0; i < NUM_ANALOG_OUTPUT; i++)
    {
        pinMode(pinMask_AOUT[i], OUTPUT);
    }
}

void updateInputBuffers()
{
    for (int i = 0; i < NUM_DISCRETE_INPUT; i++)
    {
        if (bool_input[i / 8][i % 8] != NULL)
            *bool_input[i / 8][i % 8] = digitalRead(pinMask_DIN[i]);
    }

    for (int i = 0; i < NUM_ANALOG_INPUT; i++)
    {
        if (int_input[i] != NULL)
            *int_input[i] = (analogRead(pinMask_AIN[i]) * 16);
    }
}

void updateOutputBuffers()
{
    for (int i = 0; i < NUM_DISCRETE_OUTPUT; i++)
    {
        if (bool_output[i / 8][i % 8] != NULL)
            digitalWrite(pinMask_DOUT[i], *bool_output[i / 8][i % 8]);
    }
    for (int i = 0; i < NUM_ANALOG_OUTPUT; i++)
    {
        if (int_output[i] != NULL)
            analogWrite(pinMask_AOUT[i], (*int_output[i] / 256));
    }
}
