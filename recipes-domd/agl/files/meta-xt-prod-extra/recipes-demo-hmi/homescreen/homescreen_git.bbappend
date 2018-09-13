FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
PATCHTOOL = "git"

SRC_URI += "\
    file://0001-Add-agl_surface_switcher-icon.patch \
    file://0002-Add-visclient-icon.patch \
"
