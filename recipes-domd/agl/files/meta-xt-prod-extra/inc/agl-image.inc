IMAGE_INSTALL_append = " \
    guest-addons \
    libxenbe \
    displbe \
    kmscube \
    sndbe \
"

#Add Xen and additional packages to build
IMAGE_INSTALL_append = " \
    nftables \
    dhcp-client \
    xen-base \
    xen-flask \
    xen-xenstat \
    pulseaudio \
    alsa-utils \
"

# Configuration for ARM Trusted Firmware
EXTRA_IMAGEDEPENDS += " arm-trusted-firmware"

# u-boot
EXTRA_IMAGEDEPENDS += " u-boot"

# Do not support secure environment
IMAGE_INSTALL_remove = " \
    optee-linuxdriver \
    optee-linuxdriver-armtz \
    optee-client \
"

CORE_IMAGE_BASE_INSTALL_remove += "gtk+3-demo clutter-1.0-examples"

