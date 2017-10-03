FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

BRANCH = "vgpu-dev"
SRCREV = "${AUTOREV}"

SRC_URI = " \
    git://github.com/xen-troops/linux.git;branch=${BRANCH} \
    file://defconfig \
  "

