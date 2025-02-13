/*
 * xxxxxx.c
 *
 *  Created on: 27.07.2021
 *      Author: vikaagz
 */


#ifndef INCLUDE_SCRTRICOREIF_H_
#define INCLUDE_SCRTRICOREIF_H_


//volatile uint8 ECUResetReq __at(0x100);


#ifndef _UNITTEST_TST_
	/* PRQA S 0342 1 */ /* MD_MSR_Rule20.10_0342 */
    #define DECLARE_SHRMEM(var_name, type, adr) volatile type var_name __at(0x ## adr)
#else //_UNITTEST_TST_
    #define DECLARE_SHRMEM(var_name, type, adr) volatile type var_name
#endif //_UNITTEST_TST_
#include "TricoreScrIf.h"

#endif /* INCLUDE_SCRTRICOREIF_H_ */
