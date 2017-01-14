LOCAL_PATH := $(call my-dir)

MY_PROJECT_ROOT_PATH := $(LOCAL_PATH)

include $(CLEAR_VARS)

#系统库

	MY_HEAD_PATH_INCLUDES += $(LOCAL_PATH)/3rdparty/p7zip/CPP
	MY_HEAD_PATH_INCLUDES += $(LOCAL_PATH)/3rdparty/p7zip/CPP/include_windows
	MY_HEAD_PATH_INCLUDES += $(LOCAL_PATH)/3rdparty/p7zip/CPP/myWindows
	MY_HEAD_PATH_INCLUDES += $(LOCAL_PATH)/3rdparty/p7zip/C
	MY_HEAD_PATH_INCLUDES += $(LOCAL_PATH)/3rdparty/p7zip
	
	MY_HEAD_PATH_INCLUDES += $(LOCAL_PATH)/3rdparty/mathomatic-16.0.5

#编译SO库(.so)

include $(LOCAL_PATH)/mk_files/mk_p7zip.mk
include $(LOCAL_PATH)/mk_files/mk_mathomatic.mk
