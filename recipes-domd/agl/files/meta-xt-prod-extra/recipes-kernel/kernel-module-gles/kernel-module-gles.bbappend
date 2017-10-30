require inc/xt_shared_env.inc

PVRKM_URL = "git://git@gitpct.epam.com/epmd-aepr/pvr_km_vgpu_img.git"
BRANCH = "1.7/4563938-ces2018"
SRCREV = "${AUTOREV}"

SRC_URI_r8a7795 = "${PVRKM_URL};protocol=ssh;branch=${BRANCH}"
SRC_URI_r8a7796 = "${PVRKM_URL};protocol=ssh;branch=${BRANCH}"

S = "${WORKDIR}/git"

BUILD = "release"
KBUILD_OUTDIR_r8a7795 = "binary_r8a7795_linux_${BUILD}/host/target_aarch64/kbuild/"
KBUILD_OUTDIR_r8a7796 = "binary_r8a7796_linux_${BUILD}/host/target_aarch64/kbuild/"

EXTRA_OEMAKE += "SUPPORT_PVRSRV_GPUVIRT=1 PVRSRV_GPUVIRT_NUM_OSID=${XT_PVR_NUM_OSID} KCFLAGS=-DGPUVIRT_HOST_NOT_1_TO_1"

