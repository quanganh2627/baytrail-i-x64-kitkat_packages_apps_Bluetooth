ifneq ($(CONFIG_USE_INTEL_CERT_BINARIES),true)

ifneq ($(BOARD_USES_WCS),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := \
        $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := Bluetooth
LOCAL_CERTIFICATE := platform

LOCAL_JNI_SHARED_LIBRARIES := libbluetooth_jni
LOCAL_JAVA_LIBRARIES := javax.obex telephony-common mms-common com.intel.config
LOCAL_STATIC_JAVA_LIBRARIES := com.android.vcard

LOCAL_JAVA_LIBRARIES += com.intel.config
LOCAL_JAVA_LIBRARIES += com.intel.asf

LOCAL_REQUIRED_MODULES := libbluetooth_jni bluetooth.default

LOCAL_PROGUARD_ENABLED := disabled

include $(BUILD_PACKAGE)

include $(call all-makefiles-under,$(LOCAL_PATH))

endif # BOARD_USES_WCS != true

endif # CONFIG_USE_INTEL_CERT_BINARIES
