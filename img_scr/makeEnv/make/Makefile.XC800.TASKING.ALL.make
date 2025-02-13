#######################################################################################################################
# File Name  : Makefile.AURIX.TASKING.ALL.make                                                                        #
# Description: Linker/Symbol Preprocessor command file generation                                                     #
# Project    : Vector Basic Runtime System                                                                            #
# Module     : BrsHw for Platform Infineon Xc800                                                                      #
#              and Compiler Tasking                                                                                   #
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
# Benjamin Walter               visbwa        Vector Informatik GmbH                                                  #
#---------------------------------------------------------------------------------------------------------------------#
# REVISION HISTORY                                                                                                    #
#---------------------------------------------------------------------------------------------------------------------#
# Version   Date        Author  Description                                                                           #
# --------  ----------  ------  --------------------------------------------------------------------------------------#
# 01.00.00  2020-08-06  visbwa  Initial creation for MakeSupport 3.13                                                 #
#######################################################################################################################

#------------------------------------------------------------------------
# For derivatives without LINK_LOCATE_RULE_ use original Tasking lsl file
# For SafeContext OS, specific lsl file has to be used
#------------------------------------------------------------------------
define LINK_LOCATE_RULE
 $(ECHO) '#include "$(DERIVATIVE).lsl"' > $@;
endef

#------------------------------------------------------------------------------
# rule to generate linker command file
#------------------------------------------------------------------------------
$(PROJECT_NAME).$(LNK_SUFFIX): Makefile \
                               Makefile.config \
                               Makefile.Project.Part.Defines \
                               Makefile.$(PLATFORM).$(COMPILER_MANUFACTURER).$(EMULATOR).make

#---------------------------------------------------------------------------------
# _NEVER_ delete the leading "Tab" in the first ECHO-line below!!!
# The Linker-Command-File which will be generated:
#---------------------------------------------------------------------------------
	@$(ECHO) "Generating linker command file $@ for derivative $(DERIVATIVE) and LSL architecture $(LSL_CORE_$(DERIVATIVE)):"; \
  $(LINK_LOCATE_RULE) \
  $(ECHO) "...done";  \
  $(ECHO) "";

#End of Makefile.AURIX.TASKING.ALL.make
