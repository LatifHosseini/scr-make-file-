;
;    Startup code automatically generated and updated by:
;    TASKING Tools for 8051 v7.2r6 (build version: 1.191)
;    Do not edit unless switching off the automatic generation
;    checkbox under:
;        Project | Project Options | Processor | Startup Code
;
;    Copyright 1999-2004 Altium BV
;
$CASE
$DEBUG
        NAME     _CSTART

        EXTRN    CODE(_?main)
        EXTRN    CODE(__LK_B_INITIALIZE)
        EXTRN    CODE(__ENDINIT)
        EXTRN    CODE(LARGE)

        PUBLIC   __START
        PUBLIC   __STKSTART
        PUBLIC   __EXIT

?STACK  SEGMENT IDATA
        RSEG ?STACK
__STKSTLAB:
        DS      128
__STKSTART      IDATA __STKSTLAB - 1

        PUBLIC __TOP_OF_VIRT_STACK
?VIRT_STACK    SEGMENT XDATA
        RSEG    ?VIRT_STACK
        DS      1
__TOP_OF_VIRT_STACK:

CSEG AT 0x0000
		NOP
		NOP
        LCALL __START

STARTUP SEGMENT CODE
        RSEG STARTUP
__START:

EXTRN   DATA(__SP)
PUSH    0A8H
CLR     0AFH
MOV     __SP, #HIGH(__TOP_OF_VIRT_STACK)
MOV     __SP+1, #LOW(__TOP_OF_VIRT_STACK)
POP     0A8H 

MOV     SCU_PAGE,#1
ORL     PLL_CON, #08h
ORL     PLL_CON, #04h
ORL     OSC_CON, #04h
ANL     OSC_CON, #0F7h
MOV     R0,#10
DelayXTAL:
Delay1: DJNZ R1, Delay1
DJNZ R0, DelayXTAL
OSCR_NOTSET:
ORL     OSC_CON, #0x02
WAIT_ORDRES_0:
MOV A, OSC_CON
JB      ACC.1,WAIT_ORDRES_0
JNB     ACC.0,OSCR_NOTSET
ORL     PLL_CON, #08h
ANL     PLL_CON, #0FBh
MOV     PASSWD,  #098h
ANL     PLL_CON, #00Fh
ORL     PLL_CON, #160
ORL     PLL_CON, #02
WAIT_LOCK:
MOV A, PLL_CON
JNB     ACC.0, WAIT_LOCK
ANL     PLL_CON, #0F7h
MOV     SCU_PAGE,#0
        CLR     A
        MOV     PSW, A

        MOV     R0,#8
__CLR_IDAT:
        MOV     @R0, A
        INC     R0
        CJNE    R0, #LOW(256),__CLR_IDAT

        MOV     DPTR, #0xF000
__CLR_XDAT:
        CLR     A
        MOVX    @DPTR, A
        INC     DPTR
        MOV     A, DPL
        CJNE    A, #LOW(0xF5FF+1), __CLR_XDAT
        MOV     A, DPH
        CJNE    A, #HIGH(0xF5FF+1), __CLR_XDAT

        MOV     SP, #LOW(__STKSTART)

        LCALL   __LK_B_INITIALIZE

        MOV     PSW, #(0*8)

        USING   0
        LCALL   _?main

__EXIT:
__STOP:
        SJMP    __STOP

        END
