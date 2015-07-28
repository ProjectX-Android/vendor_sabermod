# Copyright (C) 2015 The SaberMod Project
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

# Filter device
ifneq ($(filter %m8,$(TARGET_PRODUCT)),)
  TARGET_DEVICE := m8
endif

ifneq ($(filter %bacon,$(TARGET_PRODUCT)),)
  TARGET_DEVICE := bacon
endif

ifneq ($(filter %sprout4,$(TARGET_PRODUCT)),)
  TARGET_DEVICE := sprout4
endif

ifneq ($(filter %sprout8,$(TARGET_PRODUCT)),)
  TARGET_DEVICE := sprout8
endif

ifneq ($(filter %titan,$(TARGET_PRODUCT)),)
  TARGET_DEVICE := titan
endif

# Filter ROM base
include $(SM_VENDOR)/product/px_product.mk

# General ROM strings

# -O3 disabled by default.  To enable it change here to := true,
# or enable in vendor/sm/device/sm_device.mk
export LOCAL_O3 := false
