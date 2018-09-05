DESCRIPTION = "dbus is a simple library that implements native Go client bindings for the D-Bus message bus system."

GO_IMPORT = "github.com/godbus/dbus"

inherit go

SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${PN}-${PV}/src/${GO_IMPORT}"
SRCREV = "5f1bd775722e6927aef8a0b2940ae5a5ba76255c"
LICENSE = "BSD-2-Clause"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=09042bd5c6c96a2b9e45ddf1bc517eed"
PTEST_ENABLED = ""

FILES_${PN} += "${GOBIN_FINAL}/*"

do_compile[noexec] = "1"
