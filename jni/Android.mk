LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifeq ($(strip $(INTEL_FEATURE_ASF)),true)
    LOCAL_CPPFLAGS += -DPLATFORM_ASF_VERSION=$(PLATFORM_ASF_VERSION)
endif

LOCAL_SRC_FILES:= \
    com_android_bluetooth_btservice_AdapterService.cpp \
    com_android_bluetooth_hfp.cpp \
    com_android_bluetooth_a2dp.cpp \
    com_android_bluetooth_avrcp.cpp \
    com_android_bluetooth_hid.cpp \
    com_android_bluetooth_hdp.cpp \
    com_android_bluetooth_pan.cpp \
    com_android_bluetooth_gatt.cpp

LOCAL_C_INCLUDES += \
    $(JNI_H_INCLUDE) \

LOCAL_SHARED_LIBRARIES := \
    libandroid_runtime \
    libnativehelper \
    libcutils \
    libutils \
    liblog \
    libhardware

ifeq ($(strip $(INTEL_FEATURE_ASF)),true)
ifneq ($(strip $(PLATFORM_ASF_VERSION)),1)
ifneq ($(strip $(PLATFORM_ASF_VERSION)),0)
    LOCAL_SHARED_LIBRARIES += libsecuritydeviceserviceclient \
                              libbinder
    LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/libsecuritydeviceserviceclient
endif
endif
endif



#LOCAL_CFLAGS += -O0 -g

LOCAL_MODULE := libbluetooth_jni
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
