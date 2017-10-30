FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

require inc/xt_shared_env.inc

PVRUM_URL = "git://git@gitpct.epam.com/epmd-aepr/pvr_um_vgpu_img.git"
BRANCH = "1.7/4563938-ces2018"
SRCREV = "${AUTOREV}"

PVRUM_BUILD_DIR_r8a7795 = "r8a7795_linux"
PVRUM_BUILD_DIR_r8a7796 = "r8a7796_linux"

SRC_URI_r8a7795 = "${PVRUM_URL};protocol=ssh;branch=${BRANCH}"
SRC_URI_r8a7796 = "${PVRUM_URL};protocol=ssh;branch=${BRANCH}"

SRC_URI_append = " \
    file://0001-Make-compiler-target-aarch64-agl-linux-be-recognized.patch \
"

EXTRA_OEMAKE += "SUPPORT_PVRSRV_GPUVIRT=1 PVRSRV_GPUVIRT_NUM_OSID=${XT_PVR_NUM_OSID}"

