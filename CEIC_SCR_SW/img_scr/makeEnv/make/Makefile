#######################################################################################################################
# File Name  : Makefile                                                                                               #
# Description: local main project Makefile                                                                            #
# Project    : Vector Basic Runtime System                                                                            #
# Module     : BrsHw for platform Infineon Xc800                                                                      #
#              and Compiler Tasking,                                                                                  #
#              using Vector PES Makesupport 3.13                                                                      #
# Template   : This Makefile is reviewed according to zBrs_Template@root[2.02.01]                                     #
#                                                                                                                     #
#---------------------------------------------------------------------------------------------------------------------#
# COPYRIGHT                                                                                                           #
#---------------------------------------------------------------------------------------------------------------------#
# Copyright (c) 2020 by Vector Informatik GmbH.                                                  All rights reserved. #
#                                                                                                                     #
#---------------------------------------------------------------------------------------------------------------------#
# AUTHOR IDENTITY                                                                                                     #
#---------------------------------------------------------------------------------------------------------------------#
# Name                          Initials      Company                                                                 #
# ----------------------------  ------------  ------------------------------------------------------------------------#
# Jens Haerer                   visjhr        Vector Informatik GmbH                                                  #
# Benjamin Walter               visbwa        Vector Informatik GmbH                                                  #
#---------------------------------------------------------------------------------------------------------------------#
# REVISION HISTORY                                                                                                    #
#---------------------------------------------------------------------------------------------------------------------#
# Version   Date        Author  Description                                                                           #
# --------  ----------  ------  --------------------------------------------------------------------------------------#
# 1.00.00   2020-07-16  visjhr  Adapted according to Brs_Template 2.02.04 for MakeSupport 3.13                        #
#           2020-08-07  visbwa  Review; Final adaptions, needed for compile/link test; usage of compiler lsl files;   #
#                               complete rework of option sets; usage of compiler libs for startup;                   #
#                               direct support of Aurix derivatives                                                   #
#######################################################################################################################

#------------------------------------------------------------------------------
# Name of this project (dir under which the appl dir resides)
# E.g.: TestSuit
#------------------------------------------------------------------------------
PROJECT_NAME = CEIC_SCR
OUTPUT_FOLDER = ../../build/
#------------------------------------------------------------------------------
# More static settings placed inside separate file
#------------------------------------------------------------------------------
include Makefile.static

#------------------------------------------------------------------------------
# Define Compiler path
# E.g.: COMPILER_BASE = D:\uti\%vendor%\%platform%\%version%
#       COMPILER_BIN  = $(COMPILER_BASE)\bin
#       COMPILER_INC  = $(COMPILER_BASE)\inc
#       COMPILER_LIB  = $(COMPILER_BASE)\lib
#------------------------------------------------------------------------------
#COMPILER_BASE = C:\Program Files\TASKING\TriCore v6.3r1\c51
#COMPILER_BASE="C:\Program Files\TASKING\TriCore v6.3r1\c51"
COMPILER_BASE=C:\PROGRA~1\TASKING\TRICOR~1.3R1\c51

COMPILER_BIN  = $(COMPILER_BASE)\bin
COMPILER_INC  = $(COMPILER_BASE)\include 
#COMPILER_LIB  = $(COMPILER_BASE)\lib Moved to line 151, as core specific!

#------------------------------------------------------------------------------
# Build Options Selection: VECTOR / CUSTOMER
#------------------------------------------------------------------------------
ASFLAGS_SELECTOR = VECTOR
CFLAGS_SELECTOR  = VECTOR
LDFLAGS_SELECTOR = VECTOR

#------------------------------------------------------------------------------
# Define Emulator path
# E.g.: EMU_PATH = C:\UTI\HITOPWIN\P6811
#------------------------------------------------------------------------------
EMU_PATH =

#------------------------------------------------------------------------------
# Set NANT_USED to '1', to enable the usage of NAnt support within
# Global Makefile. If this is enabled, the Makesupport will include the
# NAnt support from a intranel link and the NAnt build-targets can be used.
#------------------------------------------------------------------------------
#NANT_USED=1

#------------------------------------------------------------------------------
# Set MKVERBOSE to a various value, to enable enhanced debug output from 
# Makesupport. To disable this afterwards, set MKVERBOSE to nothing
# (comment out this line and type "set MKVERBOSE=" in command window)
#------------------------------------------------------------------------------
#MKVERBOSE=1

#------------------------------------------------------------------------------
# Set BRSVINFO_USED to '1', to enable the generation of BrsVInfo.h within the
# GenData folder by the Makesupport.
# The BrsVInfo.h will contain e.g. kBrsCompilerVersion, to use this 
# information within the embedded code.
#------------------------------------------------------------------------------
#BRSVINFO_USED=1

#------------------------------------------------------------------------------
# Turn off strict c setting for dependency generation
#------------------------------------------------------------------------------
#STRICT_C_OFF=1

#------------------------------------------------------------------------------
# Set DELETE_DLD to '1', to enable the deleting of previously 
# generated/outdated Linker-script file, before every new linkage request.
#------------------------------------------------------------------------------
#DELETE_DLD=1

#------------------------------------------------------------------------------
# Set NEW_DEPENDENCY_FORMAT to '1' to enable parallel creation of dependencies.
# You have to ensure that you call m.bat with -jX to use this feature.
#------------------------------------------------------------------------------
#NEW_DEPENDENCY_FORMAT=1

#------------------------------------------------------------------------------
# If you want to use code analysis tools like PC-Lint or QAC,
# configure them within Makefile.analysis (part of global-make-package)
# and include this file here
#------------------------------------------------------------------------------
#include Makefile.analysis

#------------------------------------------------------------------------------
# Dependency defines
# These defines are used for the GNU-Preprocessor,
# e.g.: BRS_TIMEBASE_CLOCK=$(TIMEBASE_CLOCK)
#------------------------------------------------------------------------------
DEP_DEFINES = BRS_DERIVATIVE_$(DERIVATIVE) \
              BRS_CPU_CORE_$(CPU_CORE)     \
              BRS_OS_USECASE_$(OS_USECASE) \
              BRS_PLATFORM_$(PLATFORM)     \
              BRS_COMP_$(COMPILER_MANUFACTURER)

#------------------------------------------------------------------------------
# Derivative specific configuration
#------------------------------------------------------------------------------

CPU_CORE_51     = c51
LSL_CORE_51     = c51
CPU_CORE_tc26x  = c51
LSL_CORE_tc26x  = xc800
CPU_CORE_tc26xb = c51
LSL_CORE_tc26xb = xc800
CPU_CORE_tc38x  = scr2g
LSL_CORE_tc38x  = xc800
CPU_CORE_tc39x  = scr2g
LSL_CORE_tc39x  = xc800
CPU_CORE_tc39xb = scr2g
LSL_CORE_tc39xb = xc800

ifeq ($(CPU_CORE_$(DERIVATIVE)),)
  $(error COMPILERFLAGERROR: The compiler option (--cpu=<value>) is not yet defined for $(DERIVATIVE)!)
endif

ifeq ($(LSL_CORE_$(DERIVATIVE)),)
  $(error LINKERFLAGERROR: The name of the compiler lsl file is not yet defined for $(DERIVATIVE)!)
endif

COMPILER_LIB  = $(COMPILER_BASE)\lib\$(CPU_CORE_$(DERIVATIVE))

#------------------------------------------------------------------------------
# $(AS_ENV) is the environment necessary to run the assembler
# $(AS) defines the path to the assembler
# $(ASFLAGS_VECTOR_MAKESUPPORT) defines all assembler switches, mandatory for
#                               the Vector build environment (Makesupport/BrsHw)
# $(ASFLAGS_VECTOR_OPTIONS) defines the Vector default assembler switches
# $(ASFLAGS_CUSTOMER_OPTIONS) defines the customer requested assembler switches
# Depending of ASFLAGS_SELECTOR, ASFLAGS_VECTOR_OPTIONS or ASFLAGS_CUSTOMER_OPTIONS
# are used together with ASFLAGS_VECTOR_MAKESUPPORT for Build.
#------------------------------------------------------------------------------
# Available Assembler-flags (Tasking 6.2r2)
#
# -? --help[=<item>,...]             show option summary, or extended info
#          options                     show extended option descriptions
# -D --define=<symbol>[=<value>]     define preprocessor macro, optionally
#                                    assign the given value
# -E --preprocess                    run the assembler as a preprocessor only
# -H --include-file=<file>           include the given file at the start of the
#                                    input file
# -I --include-directory=<path>      additional search path for include files
# -L --list-format=<flag>,...        list file formatting options (default:
#                                    dEGilnqrsVwy)
#      0                               alias for -LDEGILNQRSVWY
#      1                               alias for -Ldegilnqrsvwy
#                                    lowercase/+ enables, uppercase/- disables:
#      d/D +/-section                  section directives
#      e/E +/-symbol                   symbol definition directives
#      g/G +/-generic-expansion        generic instruction expansion
#      i/I +/-generic                  generic instructions
#      l/L +/-line                     C preprocessor #line directives
#      n/N +/-empty-line               empty source lines and comment lines
#      q/Q +/-equate                   assembler equate and set directives
#      r/R +/-relocations              relocation characters ('r')
#      s/S +/-hll                      HLL symbolic debug information
#      v/V +/-equate-values            assembler equate and set values
#      w/W +/-wrap-lines               wrapped source lines
#      y/Y +/-cycle-count              cycle counts
# -O --optimize=<flag>,...           assembler optimizations (default: gs)
#                                    lowercase/+ enables, uppercase/- disables:
#      g/G +/-generics                 generic instructions
#      s/S +/-instr-size               instruction size
# -V --version                       display version header only
# -c --case-insensitive              case insensitive identifiers
# -f --option-file=<file>,...        read command line information from file
# -g --debug-info[=<flag>,...]       store debug information in the object file
#                                    (default: AhLS)
#                                    lowercase/+ enables, uppercase/- disables:
#      a/A +/-asm                      assembly source line information
#      h/H +/-hll                      pass HLL debug information
#      l/L +/-local                    local symbol debug information
#      s/S +/-smart                    smart debug information
# -g --debug-info                    alias for -gs
# -i --symbol-scope=<scope>          set default symbol scope (default: l)
#      g   global                      global by default
#      l   local                       local by default
# -k --keep-output-files             keep output file after errors
# -l --list-file[=<file>]            generate list file
# -m --preprocessor-type=<type>      select the type of preprocessor (default:
#                                    t)
#      n   none                        no preprocessor
#      t   tasking                     TASKING preprocessor
# -o --output=<file>                 name the object file
# -t --section-info[=<flag>,...]     display section information (default: CL)
#                                    lowercase/+ enables, uppercase/- disables:
#      c/C +/-console                  display on the console
#      l/L +/-list                     write to the list file
# -t --section-info                  alias for --section-info=cl
# -w --no-warnings[=<nr>,...]        suppress all warnings, or a specific one
#    --allow-undefined-macro         allow expansion of undefined macros
#    --check                         check the source, but don't generate code
#    --control=<cntrl>               specify an assembler control
#    --core=<core>                   select the core architecture (default:
#                                    c51)
#          c51                         generic 8051 architecture
#          scr2g                       XC800 architecture for AURIX 2G SCR
#    --dep-file[=<file>]             also generate dependencies for make
#    --diag=[<fmt>:]{all|<nr>,...}   display a description of the given
#                                    diagnostic using the specified format:
#                                    html, rtf or text (default)
#    --emit-locals[=<flag>,...]      emit local symbols to object file
#                                    (default: ES)
#                                    lowercase/+ enables, uppercase/- disables:
#      e/E +/-equs                     emit local EQU symbols
#      s/S +/-symbols                  emit local non-EQU symbols (labels)
#    --emit-locals                   alias for --emit-locals=s
#    --error-file[=<file>]           redirect all diagnostic messages
#    --error-limit=<nr>              set maximum number of errors (default: 42)
#    --info-messages                 generate info messages
#    --kanji                         support for Shift JIS Kanji in strings
#    --make-target=<name>            specify target name for --dep-file output
#    --max-nesting=<nr>              set the maximum include file nesting level
#                                    (default: 31)
#    --no-skip-asm-comment           do not skip parsing after assembly comment
#                                    ';'
#    --page-length=<length>          set page length of the list file
#    --page-width=<width>            set page width of the list file
#    --parameters-redefine           allow macro parameters to be redefined
#    --prompt=<prompt>               set the prompt for the %IN command
#                                    (default: '>')
#    --sfr-file=<file>               specify an SFR file to include
#    --warn-on-undefined-macro       warn on expansion of undefined macros
#    --warnings-as-errors[=<nr>,...] treat all or specific warnings as errors
#------------------------------------------------------------------------------
AS_ENV  = $(LD_ENV)
AS      = $(COMPILER_BIN)\as51.exe

#Please add only absolutely mandatory options below
ASFLAGS_VECTOR_MAKESUPPORT = -o $@

#Please add any other option below (vector default options)
ASFLAGS_VECTOR_OPTIONS = --core=$(CPU_CORE_$(DERIVATIVE))

#Please enter all customer options below
ASFLAGS_CUSTOMER_OPTIONS =

#------------------------------------------------------------------------------
# $(ASVERSION) defines the assembler switch for version report
# E.g.: ASVERSION = -V
#------------------------------------------------------------------------------
ASVERSION = -V

#------------------------------------------------------------------------------
# $(AS_LC) defines the number of lines used for assembler version information
# in BrsVinfo.h and Deliverydescription (default is 5)
#------------------------------------------------------------------------------
AS_LC = 5

#------------------------------------------------------------------------------
#------------------------- MUST be filled out ---------------------------------
# $(CC_ENV) is the environment necessary to run the compiler
# $(CC) defines the path to the C-Compiler
# $(CFLAGS_VECTOR_MAKESUPPORT) defines all compiler switches, mandatory for
#                               the Vector build environment (Makesupport/BrsHw)
# $(CFLAGS_VECTOR_OPTIONS) defines the Vector default compiler switches
# $(CFLAGS_CUSTOMER_OPTIONS) defines the customer requested compiler switches
# Depending of CFLAGS_SELECTOR, CFLAGS_VECTOR_OPTIONS or CFLAGS_CUSTOMER_OPTIONS
# are used together with CFLAGS_VECTOR_MAKESUPPORT for Build.
#------------------------------------------------------------------------------
# Available Compiler-flags (Tasking 6.2r2)
#
#  -?  --help[=<item>,...]            show option summary, or extended info
#        o   options                    show extended option descriptions
#  -C  --cpu=<type>                   select target CPU
#  -D  --define=<macro>[=<value>]     define preprocessor macro
#  -E  --preprocess[=<flag>,...]      preprocess only (default: CILMP)
#                                     lowercase/+ enables, uppercase/- disables:
#        c/C +/-comments                keep comments
#        i/I +/-includes                show included source files
#        l/L +/-list                    generate a list of macro definitions
#        m/M +/-make                    generate dependencies for make
#        p/P +/-noline                  strip #line source position info
#  -H  --include-file=<file>,...      include a file at the start of the
#                                     compilation
#  -I  --include-directory=<dir>      add include directory
#  -L  --library-directory[=<dir>]    add library directory
#  -M  --model=<model>                select memory model (default: s)
#        a   aux                        aux
#        l   large                      large
#        s   small                      small
#  -U  --undefine=<macro>             remove preprocessor macro
#  -V  --version                      display version header only
#  -Wa --pass-assembler=<option>      pass option directly to the assembler
#  -Wc --pass-c=<option>              pass option directly to the C compiler
#  -Wl --pass-linker=<option>         pass option directly to the linker
#  -c  --create[=<stage>]             select final output type (default: o)
#        l   relocatable                create relocatable output file
#        m   mil                        create mil file(s)
#        o   object                     create object file(s)
#        s   assembly                   create assembly file(s)
#  -d  --lsl-file=<file>,...          linker script file
#  -f  --option-file=<file>,...       read command line information from file
#  -g  --debug-info[=<flag>]          enable symbolic debug information
#        1                              emit small set of debug information
#        2                              emit default symbolic debug information
#        3                              emit full symbolic debug information
#        a   all                        alias for -g3
#        c   small                      alias for -g1
#        d   default                    alias for -g2
#  -g  --debug-info                   alias for -g2
#  -k  --keep-output-files            keep output files after errors
#  -l  --library=<lib>                add library
#  -n  --dry-run                      verbose output and suppress execution
#  -o  --output=<file>                set output file name
#  -p  --profile[=<flags>,...]        profiling (default: S)
#                                     lowercase/+ enables, uppercase/- disables:
#        s/S +/-static                  static profile generation
#  -p  --profile                      alias for -ps
#  -t  --keep-temporary-files         do not delete intermediate output files
#  -u  --uchar                        char defaults to unsigned
#  -v  --verbose                      verbose output
#  -w  --no-warnings[=<nr>[-<nr>],...]
#                                     suppress all or specific warnings
#      --address-size=<num>           set address size for IHEX [1|2|4] or SREC
#                                     [2|3|4] files
#      --asm-sfr-file                 automatic include the TASKING sfr file for
#                                     assembly files
#      --check                        check the source, but don't generate code
#      --control-flow-info            generate control flow information
#      --core=<value>                 the core architecture the code is intended
#                                     for (default: c51)
#            c51                        generic 8051 architecture
#            scr2g                      XC800 architecture for AURIX 2G SCR
#      --cpu-list[=<pattern>]         display a list of target CPU ids to use
#                                     with the -C/--cpu option
#      --dep-file[=<file>]            also generate dependencies for make
#      --diag=[<fmt>:]{all|<nr>,...}  display a description of one or more
#                                     diagnostic messages using the specified
#                                     format: html, rtf or text (default)
#      --error-file                   redirect all diagnostic messages
#      --error-limit=<number>         set maximum number of errors (default: 42)
#      --format=<type>                set linker output format [ihex|srec]
#      --fp-model[=<flag>,...]        floating-point model (default: clnrTz)
#        0                              alias for --fp-model=CLNRtZ (strict)
#        1                              alias for --fp-model=cLNRTZ (precise)
#        2                              alias for --fp-model=clnrTz (fast-dp)
#        3                              alias for --fp-model=clnrTz (fast-sp)
#                                     lowercase/+ enables, uppercase/- disables:
#        c/C +/-contract                allow expression contraction
#        l/L +/-fastlib                 allow less precise library functions
#        n/N +/-nonan                   allow optimizations to ignore NaN/Inf
#        r/R +/-rewrite                 allow expression rewriting
#        t/T +/-trap                    support trapping on exceptions
#        z/Z +/-negzero                 ignore sign of -0.0
#      --global-type-checking         enable global type checking
#      --ignore-default-library-path  ignore the default search path for
#                                     libraries
#      --include-sfr-file             automatic include the TASKING sfr file for
#                                     C files
#      --iso=<year>                   ISO C standard (90 or 99) (default: 99)
#      --link-only                    link only, no locating
#      --list-files[=<file>]          generate assembler list files
#      --lsl-core=<core>              specify the core for which to link the
#                                     application
#      --make-target[=<name>]         specify target name for -Em/--dep-file
#                                     output
#      --no-default-libraries         do not include default list of libraries
#      --no-map-file                  do not generate linker map file
#      --no-preprocessing-only        force full compilation
#      --processors[=<file>]          read additional processors.xml file
#      --reentrant                    reentrant function support by using a less
#                                     efficient (virtual) dynamic stack
#      --registerbank=<bank>          select registerbank (default: 0)
#        0                              bank 0
#        1                              bank 1
#        2                              bank 2
#        3                              bank 3
#        n   none                       registerbank independent
#      --signed-bitfields             treat "int" bitfield as signed
#      --warnings-as-errors[=<nr>[-<nr>],...]
#                                     treat all or specific warnings as errors
#
#  --cpu-list
#  --- D:\uti\Tasking\TriCore\6.2r2\c51\etc\processors.xml ---
#              id            name                CPU           core
#  Infineon TriCore 1 Family
#    AURIX Family
#              tc26x         TC26x               tc26x         c51
#              tc26xb        TC26xB              tc26xb        c51
#    AURIX 2G Family
#              tc38x         TC38x               tc38x         scr2g
#              tc39x         TC39x               tc39x         scr2g
#              tc39xb        TC39xB              tc39xb        scr2g
#              51            Generic 8051        51            c51
#------------------------------------------------------------------------------
CC_ENV  =
CC      = $(COMPILER_BIN)\CC51.exe

#Please add only absolutely mandatory options below
CFLAGS_VECTOR_MAKESUPPORT = -DBRS_DERIVATIVE_$(DERIVATIVE)      \
                            -DBRS_CPU_CORE_$(CPU_CORE)          \
                            -DBRS_OS_USECASE_$(OS_USECASE)      \
                            -DBRS_PLATFORM_$(PLATFORM)          \
                            -DBRS_COMP_$(COMPILER_MANUFACTURER) \
                            -c                                  \
                            -o $@

CFLAGS_SMALL = -Ms
CFLAGS_AUX   = -Ma
CFLAGS_LARGE = -Ml

#Please add any other option below (vector default options)
CFLAGS_VECTOR_OPTIONS = --cpu=$(DERIVATIVE) \
                        -g                  \
                        -ps                 \
                        $(CFLAGS_$(MEM_MODEL))

#Please enter all customer options below
CFLAGS_CUSTOMER_OPTIONS =

#------------------------------------------------------------------------------
# $(CVERSION) defines the compiler switch for version report
# E.g.: CVERSION = -V
#------------------------------------------------------------------------------
CVERSION = -V

#------------------------------------------------------------------------------
# $(CC_LC) defines the number of lines used for compiler version information
# in BrsVinfo.h and Deliverydescription (default is 5)
#------------------------------------------------------------------------------
CC_LC = 5

#------------------------------------------------------------------------------
# $(CINC) defines the include switch of the used compiler.
# E.g.: COSMIC Compiler use: CINC = -i
#------------------------------------------------------------------------------
CINC = -I

#------------------------------------------------------------------------------
#------------------------- MUST be filled out ---------------------------------
# $(LD_ENV) is the environment necessary to run the linker
# $(LD) defines the path linker
# $(LDFLAGS_VECTOR_MAKESUPPORT) defines all linker switches, mandatory for
#                               the Vector build environment (Makesupport/BrsHw)
# $(LDFLAGS_VECTOR_OPTIONS) defines the Vector default linker switches
# $(LDFLAGS_CUSTOMER_OPTIONS) defines the customer requested linker switches
# Depending of LDFLAGS_SELECTOR, LDFLAGS_VECTOR_OPTIONS or LDFLAGS_CUSTOMER_OPTIONS
# are used together with LDFLAGS_VECTOR_MAKESUPPORT for Build.
#------------------------------------------------------------------------------
# Available Linker-flags (Taskin v6.2r2)
#
#  -? --help[=<item>,...]             show option summary, or extended info:
#       o   options                     show extended option descriptions
#  -C --core=<name>                   select core (as specified in LSL file) for
#                                     current task
#  -D --define=<macro>[=<def>]        define preprocessor macro for LSL file
#  -I --include-directory=<dir>,...   add directory to LSL include file search
#                                     path
#  -L --library-directory[=<dir>,...] first search in <dir> for system libraries
#                                     specified with -l, then in default path.
#                                     When no argument is given, search only in
#                                     directories specified with -L
#  -M --map-file[=<file>,...]         generate task related map file
#  -N --no-rom-copy                   do not generate ROM copy for
#                                     re-initializing data memory
#  -O --optimize[=<flags>,...]        specify optimization level (default: 1)
#       0                               alias for -OCLTXY (none)
#       1                               alias for -OcLtxy (normal)
#       2                               alias for -Ocltxy (all)
#                                     lowercase/+ enables, uppercase/- disables:
#       c/C +/-delete-unreferenced-sections
#                                       delete un-referenced sections from the
#                                       output file
#       l/L +/-first-fit-decreasing     use a 'first fit decreasing' algorithm
#                                       to locate unrestricted sections in
#                                       memory
#       t/T +/-copytable-compression    emit smart restrictions to reduce copy
#                                       table size
#       x/X +/-delete-duplicate-code    delete duplicate code from the output
#                                       file
#       y/Y +/-delete-duplicate-data    delete duplicate constant data from the
#                                       output file
#  -S --strip-debug                   do not include debug information in
#                                     resulting file
#  -V --version                       display version information only
#  -c --chip-output=[<basename>]:<format>[:<addr_size>],...
#                                     generate a hex file for each chip in the
#                                     specified format (IHEX, SREC, BIN, CARR);
#                                     addr_size is the size of addresses in
#                                     bytes (except for CARR); supported values:
#                                     1,2, and 4 for IHEX, 2,3, and 4 for SREC
#  -d --lsl-file=<file>...            name of linker script file(s)
#  -e --extern=<symbol>,...           specify a symbol as unresolved external
#  -f --option-file=<file>,...        read command line information from file
#  -i --user-provided-initialization-code
#                                     the user provides his own initialization
#                                     routine, do not emit the copytable
#  -k --keep-output-files             keep output files after errors
#  -l --library=<name>                search also in system library lib<name>.a
#                                     or <name>.lib, depending on the convention
#                                     used
#  -m --map-file-format[=<flags>...]  map file formatting options (default: 2)
#       0                               alias for -mcDfikLMNoQrSU (link info)
#       1                               alias for -mCDfiKlMNoQRSU (locate info)
#       2                               alias for -mcdfiklmNoQrSu (most info)
#                                     lowercase/+ enables, uppercase/- disables:
#       c/C +/-callgraph                call graph info
#       d/D +/-removed                  removed sections info
#       f/F +/-files                    processed files info
#       i/I +/-invocation               invocation and tool info
#       k/K +/-link                     link result info
#       l/L +/-locate                   locate result info
#       m/M +/-memory                   memory usage info
#       n/N +/-nonalloc                 non alloc info
#       o/O +/-overlay                  overlay info
#       q/Q +/-statics                  module local symbols
#       r/R +/-crossref                 cross references info
#       s/S +/-lsl                      processor and memory info
#       u/U +/-rules                    locate rules
#  -o --output=[<filename>][:<format>[:<addr_size>][,<space_name>]]...
#                                     specify an output object file
#  -r --incremental                   link incrementally
#  -v --verbose                       verbose information (use twice for extra
#                                     verbose)
#  -w --no-warnings[=<number>,...]    suppress warning <number>
#     --case-insensitive              link case insensitive
#     --dep-file[=[<file>]]           generate a depencencies file for make
#     --diag=[<fmt>:]{all|<nr>,...}   display a description of one or more
#                                     diagnostic messages using the specified
#                                     format: html, rtf or text (default)
#     --endianness=<endianness>       specify the task endianness
#     --error-file[=<file>]           redirect error messages to specified file
#     --error-limit=<nr>              the maximum number of emitted errors
#     --first-library-first           each unresolved reference is solved by
#                                     scanning the libraries in the order given
#                                     on the command line
#     --global-type-checking          verify types of variable and function
#                                     references against their definitions
#     --hex-format[=<flags>,...]      boolean flags for hex file and c-array
#                                     format settings (default: s)
#                                     lowercase/+ enables, uppercase/- disables:
#       s/S +/-start-address            emit start address record
#     --hex-record-size=<number>      size of data records in number of data
#                                     bytes
#     --ignore-default-library-path   alias for -L
#     --import-object=<file>,...      name of binary file containing a raw data
#                                     section
#     --link-only                     link only, no locating
#     --lsl-check                     check LSL file(s) and exit
#     --lsl-dump[=[<file>]]           dump processor and memory info from LSL
#                                     file
#     --make-target=<name>            specify the target to use in the
#                                     dependencies file
#     --misra-c-report[=<file>]       generate MISRA-C report file
#     --new-task                      create an additional task, following
#                                     options only apply to the new task
#     --no-rescan                     do not rescan libraries to solve
#                                     unresolved externals
#     --non-romable                   application is not romable, all rom
#                                     sections are located in ram
#     --warnings-as-errors[=<nr>,...] treat all or specific warnings as errors
#     --whole-archive=<file>          link all objects contained in the
#                                     specified library
#------------------------------------------------------------------------------
LD_ENV    =
LD        = $(COMPILER_BIN)\lk51.exe

#Please add only absolutely mandatory options below
LDFLAGS_VECTOR_MAKESUPPORT = -M \
                             -o $(OUTPUT_FOLDER)$(PROJECT_NAME).$(BINARY_SUFFIX)

LDFLAGS_SMALL = -lc51ss
LDFLAGS_AUX   = -lc51as
LDFLAGS_LARGE = -lc51ls

#Please add any other option below (vector default options)
LDFLAGS_VECTOR_OPTIONS = --core=$(LSL_CORE_$(DERIVATIVE)) \
                         $(LDFLAGS_$(MEM_MODEL))          \
                         -lrt51                           \
                         --lsl-file=$(LINKER_COMMAND_FILE)

#Please enter all customer options below
LDFLAGS_CUSTOMER_OPTIONS =

#------------------------------------------------------------------------------
# $(LDVERSION) defines the linker switch for version report
# E.g.: LDVERSION = -v
#------------------------------------------------------------------------------
LDVERSION = -v

#------------------------------------------------------------------------------
# $(LD_LC) defines the number of lines used for linker version information
# in BrsVinfo.h and Deliverydescription (default is 5)
#------------------------------------------------------------------------------
LD_LC = 5

#------------------------------------------------------------------------------
#------------------------- MUST be filled out ---------------------------------
# $(LB_ENV) is the environment necessary to run the librarian
# $(LB) defines the path to the C-librarian
# $(LBFLAGS) defines all librarian switches
#------------------------------------------------------------------------------
# Available Librarian-flags could be posted here
#------------------------------------------------------------------------------
LB_ENV  = $(LD_ENV)
LB      = $(LD)

LBFLAGS =

#------------------------------------------------------------------------------
# $(LBVERSION) defines the archiver switch for version report
# E.g.: LBVERSION = -v
#------------------------------------------------------------------------------
LBVERSION = $(LDVERSION)

#------------------------------------------------------------------------------
# $(LB_LC) defines the number of lines used for librarian version information
# in BrsVinfo.h
#------------------------------------------------------------------------------
LB_LC = $(LD_LC)

#------------------------------------------------------------------------------
# Additional includes essentially for compilation
#------------------------------------------------------------------------------
ADDITIONAL_INCLUDES +=

#------------------------------------------------------------------------------
# Additional objects essentially for linking
# E.g.: ADDITIONAL_OBJECTS = $(OBJ_PATH)\myobject.$(OBJ_SUFFIX)
#------------------------------------------------------------------------------
ADDITIONAL_OBJECTS +=

#------------------------------------------------------------------------------
# List of assembler source files
# E.g.: ASM_SOURCES = source\startup.$(ASM_SUFFIX)
#------------------------------------------------------------------------------
ASM_SOURCES +=

#------------------------------------------------------------------------------
# Add Startup code to application source list
# E.g.: APP_SOURCE_LST += source\startup.c
#------------------------------------------------------------------------------
APP_SOURCE_LST +=

#------------------------------------------------------------------------------
# Check if all necessary variables are set
# (Checks that are not possible to be performed within Makefile.static)
#------------------------------------------------------------------------------

###############################################################################
######### DO NOT remove these lines from the end of the Makefile!!! ###########
###############################################################################

#------------------------------------------------------------------------------
# Platform/compiler/derivative/emulator dependant makefile is included here
# It defines a rule to generate the linker and a rule to generate the
# symbol preprocessor command file.
# A template for this Makefile can be found under
#     R:\Can_Base\CANtate\BRS\PlatformSpecific\...\OrganiAndMake\...
#------------------------------------------------------------------------------
include Makefile.$(PLATFORM).$(COMPILER_MANUFACTURER).$(EMULATOR).make

#------------------------------------------------------------------------------
# Include the main makefile where all the targets are defined
#------------------------------------------------------------------------------
include $(MAKESUPPORT_DIR)\Global.Makefile.target.make.$(VERSION)

#End of Makefile
