#
# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Install the prebuilt webview apk.

ifneq ($(TARGET_USES_AOSP_BROWSER),true)
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE       := Chromium
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := APPS
#LOCAL_SRC_FILES    := 64bit/MonochromePublic.apk
#LOCAL_CERTIFICATE  := PRESIGNED
LOCAL_MODULE_PATH  := $(TARGET_OUT_APPS)
LOCAL_MULTILIB := both
LOCAL_CERTIFICATE := $(DEFAULT_SYSTEM_DEV_CERTIFICATE)
LOCAL_REQUIRED_MODULES := \
        libmonochrome_loader \
        libmonochrome_plat_support

LOCAL_MODULE_TARGET_ARCH := arm arm64
my_src_arch := $(call get-prebuilt-src-arch,$(LOCAL_MODULE_TARGET_ARCH))
LOCAL_SRC_FILES := prebuilt/$(my_src_arch)/MonochromePublic.apk

LOCAL_PREBUILT_JNI_LIBS_arm := @lib/armeabi-v7a/libmonochrome.so
LOCAL_PREBUILT_JNI_LIBS_arm64 := @lib/arm64-v8a/libmonochrome.so

include $(BUILD_PREBUILT)
endif

