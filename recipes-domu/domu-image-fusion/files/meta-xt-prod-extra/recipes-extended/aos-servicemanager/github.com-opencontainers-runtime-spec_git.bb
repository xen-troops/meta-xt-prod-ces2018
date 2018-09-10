DESCRIPTION = "OCI Runtime Specification http://www.opencontainers.org"

GO_IMPORT = "github.com/opencontainers/runtime-spec"

inherit go

SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${PN}-${PV}/src/${GO_IMPORT}"
SRCREV = "cc07cb974ea61a4b545d368849df8ac54c32daa9"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=b355a61a394a504dacde901c958f662c"
PTEST_ENABLED = ""

FILES_${PN} += "${GOBIN_FINAL}/*"

do_compile[noexec] = "1"
