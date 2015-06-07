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


ifdef KERNEL_DIR
  include $(KERNEL_DIR)/AndroidKernel_sm.mk
endif

# cp will do.
.PHONY: $(PRODUCT_OUT)/kernel
$(PRODUCT_OUT)/kernel: $(TARGET_PREBUILT_KERNEL)
	cp $(TARGET_PREBUILT_KERNEL) $(PRODUCT_OUT)/kernel

