/*
 * xxxxxx.c
 *
 *  Created on: 27.07.2021
 *      Author: vikaagz
 */



#ifndef INCLUDE_SCRWAKEUPHNDL_H_
#define INCLUDE_SCRWAKEUPHNDL_H_

void StartTimerValidateWUL1 (void);
void StartTimerValidateWUL2 (void);
void ScrWakeupHndlTask1 (void);
void SetFirstWakeupSource (WakeupSrc Wevent);
WakeupSrc GetFirstWakeupSource (void);
void ScrWakeupHndl_ResetADCstate (void);

#endif /* INCLUDE_SCRWAKEUPHNDL_H_ */
