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
    file://domd.cfg \
"

S = "${WORKDIR}"

# TODO: use Xen defined location for storing domain artifacts
IMAGE_DST_DIR = "xt"
IMAGE_DST_DIR_DOMD = "${IMAGE_DST_DIR}/domd"

do_install() {
    install -d ${D}${base_prefix}/${IMAGE_DST_DIR_DOMD}
    install -m 0744 ${WORKDIR}/domd.cfg ${D}${base_prefix}/${IMAGE_DST_DIR_DOMD}
}

FILES_${PN} += " \
    ${base_prefix}/${IMAGE_DST_DIR_DOMD}/*.cfg \
"

