################################################################################
# Renesas R-Car
################################################################################
SRCREV_rcar = "${AUTOREV}"

SRC_URI_append_rcar = " git://github.com/xen-troops/DisplayManager.git;protocol=https;branch=master"

RDEPENDS_${PN} += " dbus-cpp"

EXTRA_OECMAKE_append_rcar = " -DWITH_DOC=OFF -DCMAKE_BUILD_TYPE=Release"
