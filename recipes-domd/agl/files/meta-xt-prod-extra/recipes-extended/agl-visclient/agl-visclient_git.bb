DESCRIPTION = "AGL VIS client"
SECTION = "apps"
LICENSE = "Apache-2.0"

SRCREV = "${AUTOREV}"
SRC_URI = "git://github.com/xen-troops/agl_visclient.git;protocol=https;branch=aos-demo-2"

LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"

S = "${WORKDIR}/git"

DEPENDS = "qtquickcontrols2 qtwebsockets"

inherit qmake5 aglwgt
