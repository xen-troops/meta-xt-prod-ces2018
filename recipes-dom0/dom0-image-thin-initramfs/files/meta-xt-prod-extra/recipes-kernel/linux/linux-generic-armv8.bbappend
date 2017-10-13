FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

BRANCH = "ces2018"
SRCREV = "${AUTOREV}"

SRC_URI = " \
    git://github.com/xen-troops/linux.git;branch=${BRANCH} \
    file://defconfig \
  "

