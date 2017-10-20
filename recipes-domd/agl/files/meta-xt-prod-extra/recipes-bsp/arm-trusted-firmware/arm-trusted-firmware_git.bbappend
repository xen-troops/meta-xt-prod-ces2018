FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append = " \
    file://0001-BL2-Disable-TLB-cache-function-of-IPMMU-caches.patch \
"
