
ifneq ($(TARGET_USES_LOCAL_QSAP),true)
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := $(TOP)/hardware/libhardware_legacy/wifi $(TOP)/external/libnl/include $(TOP)/external/wpa_supplicant_8/wpa_supplicant/src/drivers

LOCAL_MODULE:= libqsap_sdk

LOCAL_MODULE_TAGS := optional

LOCAL_VENDOR_MODULE := true

LOCAL_CFLAGS += -DSDK_VERSION=\"0.0.1.0\"

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/qsap_api.h \
                               $(LOCAL_PATH)/qsap.h

ifdef WIFI_DRIVER_MODULE_PATH
LOCAL_CFLAGS += -DWIFI_DRIVER_MODULE_PATH=\"$(WIFI_DRIVER_MODULE_PATH)\"
endif

ifdef WIFI_DRIVER_MODULE_ARG
LOCAL_CFLAGS += -DWIFI_DRIVER_MODULE_ARG=\"$(WIFI_DRIVER_MODULE_ARG)\"
endif

ifdef WIFI_DRIVER_MODULE_NAME
LOCAL_CFLAGS += -DWIFI_DRIVER_MODULE_NAME=\"$(WIFI_DRIVER_MODULE_NAME)\"
endif

ifdef WIFI_SDIO_IF_DRIVER_MODULE_PATH
LOCAL_CFLAGS += -DWIFI_SDIO_IF_DRIVER_MODULE_PATH=\"$(WIFI_SDIO_IF_DRIVER_MODULE_PATH)\"
endif

ifdef WIFI_SDIO_IF_DRIVER_MODULE_NAME
LOCAL_CFLAGS += -DWIFI_SDIO_IF_DRIVER_MODULE_NAME=\"$(WIFI_SDIO_IF_DRIVER_MODULE_NAME)\"
endif

ifdef WIFI_CFG80211_DRIVER_MODULE_PATH
LOCAL_CFLAGS += -DWIFI_CFG80211_DRIVER_MODULE_PATH=\"$(WIFI_CFG80211_DRIVER_MODULE_PATH)\"
endif

ifdef WIFI_CFG80211_DRIVER_MODULE_ARG
LOCAL_CFLAGS += -DWIFI_CFG80211_DRIVER_MODULE_ARG=\"$(WIFI_CFG80211_DRIVER_MODULE_ARG)\"
endif

ifdef WIFI_CFG80211_DRIVER_MODULE_NAME
LOCAL_CFLAGS += -DWIFI_CFG80211_DRIVER_MODULE_NAME=\"$(WIFI_CFG80211_DRIVER_MODULE_NAME)\"
endif

ifdef WIFI_DRIVER_CONF_FILE
LOCAL_CFLAGS += -DWIFI_DRIVER_CONF_FILE=\"$(WIFI_DRIVER_CONF_FILE)\"
endif

ifdef WIFI_DRIVER_DEF_CONF_FILE
LOCAL_CFLAGS += -DWIFI_DRIVER_DEF_CONF_FILE=\"$(WIFI_DRIVER_DEF_CONF_FILE)\"
endif

LOCAL_CFLAGS += -Wall -Wextra -Werror

LOCAL_SRC_FILES := qsap_api.c \
                   qsap.c

LOCAL_SHARED_LIBRARIES := libnetutils libutils libbinder libcutils libhardware_legacy libnl liblog

LOCAL_HEADER_LIBRARIES := libcutils_headers

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE := libqsap_headers
LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)
LOCAL_VENDOR_MODULE := true
include $(BUILD_HEADER_LIBRARY)
endif
