ARCHS = armv7 armv7s arm64
TARGET = iphone:clang:7.0:6.0

include theos/makefiles/common.mk

TOOL_NAME = pbcopy pbpaste

pbcopy_FILES = pbcopy.m
pbcopy_FRAMEWORKS = UIKit Foundation MobileCoreServices

pbpaste_FILES = pbpaste.m
pbpaste_FRAMEWORKS = UIKit Foundation MobileCoreServices

include $(THEOS_MAKE_PATH)/tool.mk
