FINALPACKAGE = 1

TARGET := iphone:clang:latest:16.0
INSTALL_TARGET_PROCESSES = Apollo

ARCHS = arm64

THEOS_PACKAGE_SCHEME=rootless

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ApolloAPI

ApolloAPI_FILES = Tweak.x
ApolloAPI_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
