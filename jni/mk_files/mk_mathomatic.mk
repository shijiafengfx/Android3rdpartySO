
include $(CLEAR_VARS)

	LOCAL_MODULE 		:= LocalMathomatic
	
#包含目录 
	LOCAL_C_INCLUDES := $(MY_HEAD_PATH_INCLUDES)

	LOCAL_CFLAGS := -DLIBRARY -DREADLINE

	LOCAL_SRC_FILES 	:= 3rdparty/mathomatic-16.0.5/am.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/cmds.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/complex.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/complex_lib.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/diff.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/factor.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/factor_int.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/fx_interfaces.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/gcd.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/globals.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/help.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/integrate.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/lib.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/list.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/parse.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/poly.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/simplify.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/solve.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/super.c
	LOCAL_SRC_FILES 	+= 3rdparty/mathomatic-16.0.5/unfactor.c

#include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)