/*
 * WakeUpDetection.h
 *
 *  Created on: 27.07.2021
 *      Author: vikaagz
 */

#ifndef SOURCE_SCR_WAKEUPDETECTION_H_
#define SOURCE_SCR_WAKEUPDETECTION_H_


typedef struct
{
    uint32 fineTimeWul1;
    uint32 rawTimeWul1;
    uint32 fineTimeWul2;
    uint32 rawTimeWul2;
    uint16 msTimeWul1;
    uint16 msTimeWul2;
    uint8 isBusyWul1:   1;
    uint8 isBusyWul2:   1;
    uint8 unused:       6;
} WupData_t;


void WupInit (void);
WupData_t* WupGetData (void);
void Multiplexer(void);

#endif /* SOURCE_SCR_WAKEUPDETECTION_H_ */
