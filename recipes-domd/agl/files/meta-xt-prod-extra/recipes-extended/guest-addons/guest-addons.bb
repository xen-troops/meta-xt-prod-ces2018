# Copyright
# License:
#
# Filename: guest-addons.bb

SUMMARY = "config files and scripts for a guest"
DESCRIPTION = "config files and scripts for guest which will be running for tests"
PV = "0.1"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"

SRC_URI = "\
  file://bridge-nfsroot.sh \
  file://bridge.sh \
  file://displ_be.cfg \
  file://snd_be.cfg \
"

S = "${WORKDIR}"

# TODO: use Xen defined location for storing domain artifacts
IMAGE_DST_DIR = "xt"
IMAGE_DST_DIR_SCRIPTS = "${IMAGE_DST_DIR}/scripts"
IMAGE_DST_DIR_CONFIGS = "${IMAGE_DST_DIR}/cfg"

do_install() {
    install -d ${D}${base_prefix}/${IMAGE_DST_DIR_SCRIPTS}
    install -m 0744 ${WORKDIR}/*.sh ${D}${base_prefix}/${IMAGE_DST_DIR_SCRIPTS}

    install -d ${D}${base_prefix}/${IMAGE_DST_DIR_CONFIGS}
    install -m 0744 ${WORKDIR}/*.cfg ${D}${base_prefix}/${IMAGE_DST_DIR_CONFIGS}
}

FILES_${PN} += " \
    ${base_prefix}/${IMAGE_DST_DIR_SCRIPTS}/*.sh \
    ${base_prefix}/${IMAGE_DST_DIR_CONFIGS}/*.cfg \
"
