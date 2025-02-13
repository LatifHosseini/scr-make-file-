/*
 * xxxxxx.c
 *
 *  Created on: 27.07.2021
 *      Author: vikaagz
 */



#ifndef INCLUDE_SCRGENETHWUL_H_
#define INCLUDE_SCRGENETHWUL_H_


#define WUL1	1u
#define WUL2	2u
#define WUL_BOTH  3u
#define WUL_DIAG_HIGH_ALL  4u


void ScrGenerateWULPattern (uint8 EthWUchannel);
void ScrGenEthWULTask10 (void);
void ScrGenReset (void);

#endif /* INCLUDE_SCRGENETHWUL_H_ */
