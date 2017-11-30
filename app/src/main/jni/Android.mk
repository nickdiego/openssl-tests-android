LOCAL_PATH := $(call my-dir)

OPENSSL_DIR := $(LOCAL_PATH)/openssl

# Declaring prebuilt libssl.a
include $(CLEAR_VARS)
LOCAL_MODULE := libssl
LOCAL_SRC_FILES := $(OPENSSL_DIR)/lib/$(TARGET_ARCH_ABI)/libssl.a
include $(PREBUILT_STATIC_LIBRARY)

# Declaring prebuilt libssl.a
include $(CLEAR_VARS)
LOCAL_MODULE := libcrypto
LOCAL_SRC_FILES := $(OPENSSL_DIR)/lib/$(TARGET_ARCH_ABI)/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)

# libnative-lib.so
include $(CLEAR_VARS)
LOCAL_MODULE    := native-lib
LOCAL_SRC_FILES := native-lib.cpp
LOCAL_LDLIBS    := -llog
LOCAL_C_INCLUDES := $(OPENSSL_DIR)/include
LOCAL_STATIC_LIBRARIES := libssl libcrypto
include $(BUILD_SHARED_LIBRARY)

