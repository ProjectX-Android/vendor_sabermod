# Compile the kernel inline

# Note for this to work you will need to remove prebuilt kernel building in device tree,
# and any other inline kernel building implementations.

# Original Author Jameson Williams jameson.h.williams@intel.com

ifneq ($(filter %m8,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/htc/msm8974
  KERNEL_BINARY_IMAGE := zImage-dtb
  KERNEL_DEFCONFIG := cm_m8_defconfig
endif

ifneq ($(filter %bacon,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/oneplus/msm8974
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter px%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cyanogenmod_bacon_defconfig
  endif
endif

ifneq ($(filter %sprout4,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/mediatek/sprout
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter px%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cyanogenmod_sprout_defconfig
  endif
endif

ifneq ($(filter %sprout8,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/mediatek/sprout
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter px%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cyanogenmod_sprout_defconfig
  endif
endif

ifneq ($(filter %titan,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/motorola/msm8226
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter px%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := titan_defconfig
  endif
endif

ifneq ($(filter %lettuce,$(TARGET_PRODUCT)),)
  KERNEL_DIR := kernel/cyanogen/msm8916
  KERNEL_BINARY_IMAGE := zImage-dtb
  ifneq ($(filter px%,$(TARGET_PRODUCT)),)
    KERNEL_DEFCONFIG := cyanogenmod_lettuce_defconfig
  endif
endif


ifdef KERNEL_DIR
  include $(KERNEL_DIR)/AndroidKernel_sm.mk
endif

# cp will do.
.PHONY: $(PRODUCT_OUT)/kernel
$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel

