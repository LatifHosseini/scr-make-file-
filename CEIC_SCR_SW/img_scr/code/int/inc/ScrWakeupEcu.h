/*
 * xxxxxx.c
 *
 *  Created on: 27.07.2021
 *      Author: vikaagz
 */


#ifndef INCLUDE_SCRWAKEUPECU_H_
#define INCLUDE_SCRWAKEUPECU_H_

void ScrEthWupCallback (uint8 EthWUchannel);
void ScrCanWupCallback (void);
void ScrFrWupCallback (void);
void ScrLinWupCallback (void);
void ScrWupCallback (void);
void ScrWakeupEcuTask50 (void);
void ScrResetPmicHandler(void);
void ScrKeepSwitchAwake (void);

#endif /* INCLUDE_SCRWAKEUPECU_H_ */
