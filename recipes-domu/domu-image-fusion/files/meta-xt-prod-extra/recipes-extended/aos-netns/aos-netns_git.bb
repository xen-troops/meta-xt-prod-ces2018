DESCRIPTION = "github.com/genuinetools/netns/"

GO_IMPORT = "github.com/genuinetools/netns/"

inherit go

SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${PN}-${PV}/src/${GO_IMPORT}"
SRCREV = "01e3a7040667b52ee60b08539d0413e08409d7e3"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=48ef0979a2bcc3fae14ff30b8a7f5dbf"

FILES_${PN} += "${GOBIN_FINAL}/*"
