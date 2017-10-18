SUMMARY = "config files and scripts for a guest"
DESCRIPTION = "config files and scripts for guest which will be running for tests"

require inc/xt_shared_env.inc

PV = "0.1"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = " \
    file://bridge-nfsroot.sh \
    file://bridge.sh \
    file://displ_be.cfg \
    file://snd_be.cfg \
"

S = "${WORKDIR}"

do_install() {
    install -d ${D}${base_prefix}${XT_DIR_ABS_ROOTFS_SCRIPTS}
    install -m 0744 ${WORKDIR}/*.sh ${D}${base_prefix}${XT_DIR_ABS_ROOTFS_SCRIPTS}

    install -d ${D}${base_prefix}${XT_DIR_ABS_ROOTFS_CFG}
    install -m 0744 ${WORKDIR}/*.cfg ${D}${base_prefix}${XT_DIR_ABS_ROOTFS_CFG}
}

FILES_${PN} += " \
    ${base_prefix}${XT_DIR_ABS_ROOTFS_SCRIPTS}/*.sh \
    ${base_prefix}${XT_DIR_ABS_ROOTFS_CFG}/*.cfg \
"

