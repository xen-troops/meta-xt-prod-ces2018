DESCRIPTION = "Gorilla WebSocket is a Go implementation of the WebSocket protocol."

GO_IMPORT = "github.com/gorilla/websocket"

inherit go

SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${PN}-${PV}/src/${GO_IMPORT}"
SRCREV = "66b9c49e59c6c48f0ffce28c2d8b8a5678502c6d"
LICENSE = "BSD-2-Clause"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=c007b54a1743d596f46b2748d9f8c044"
PTEST_ENABLED = ""

FILES_${PN} += "${GOBIN_FINAL}/*"

do_compile[noexec] = "1"
