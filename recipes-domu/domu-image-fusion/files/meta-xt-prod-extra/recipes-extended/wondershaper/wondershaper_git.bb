DESCRIPTION = "Wonder Shaper is a script that allow the user to limit the bandwidth of one or more network adapters"

LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"

SRCREV = "${AUTOREV}"
SRC_URI = "git://git@github.com/magnific0/wondershaper;protocol=ssh;branch=master"

S = "${WORKDIR}/git"

do_install() {
    install -d ${D}${bindir}
    install -m 755 ${S}/wondershaper ${D}${bindir}/wondershaper
}
