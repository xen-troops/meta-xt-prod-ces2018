FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

PVRUM_URL = "git://git@gitpct.epam.com/epmd-aepr/pvr_um_vgpu_img.git"
BRANCH = "1.7/4563938-ces2018"
SRCREV = "${AUTOREV}"

SRC_URI_r8a7795 = "${PVRUM_URL};protocol=ssh;branch=${BRANCH}"
SRC_URI_r8a7796 = "${PVRUM_URL};protocol=ssh;branch=${BRANCH}"

SRC_URI_remove = " \
    file://0001-EGL-eglext.h-Include-eglmesaext.h-to-avoid-compile-error.patch \
"

SRC_URI_append = " \
    file://0001-EGL-eglext.h-Include-eglmesaext.h.patch \
"

