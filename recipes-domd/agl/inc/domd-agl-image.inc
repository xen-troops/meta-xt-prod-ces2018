FILESEXTRAPATHS_prepend := "${THISDIR}/../files:"

###############################################################################
# extra layers and files to be put after Yocto's do_unpack into inner builder
###############################################################################
# these will be populated into the inner build system on do_unpack_xt_extras
XT_QUIRK_UNPACK_SRC_URI += "file://meta-xt-prod-extra;subdir=repo"

# add new xt-distro machines into AGL
XT_QUIRK_UNPACK_SRC_URI += "file://meta-agl;subdir=repo"
XT_QUIRK_UNPACK_SRC_URI += "file://meta-agl-bsp;subdir=repo/meta-agl"

# these layers will be added to bblayers.conf on do_configure
XT_QUIRK_BB_ADD_LAYER += "meta-xt-prod-extra \
    meta-virtualization \
    meta-selinux \
"

# N.B. the revision to use must be aligned with Poky's version of AGL to be built with
SRC_URI_append = " \
    git://git.yoctoproject.org/meta-virtualization;destsuffix=repo/meta-virtualization;branch=morty \
    git://git.yoctoproject.org/meta-selinux;destsuffix=repo/meta-selinux;branch=morty \
"

# Renesas R-Car
################################################################################
SRCREV_agl-repo = "${AUTOREV}"
SRCREV_img-proprietary = "ef24526e95ba339c39ef966f2a7e364b563946d2"

SRC_URI_rcar = "repo://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo;protocol=https;branch=dab;manifest=dab_4.0.1.xml;scmdata=keep;name=agl-repo \
    git://git@git.epam.com/epmd-aepr/img-proprietary;protocol=ssh;branch=master;name=img-proprietary;destsuffix=repo/proprietary \
    file://0001-Do-not-try-to-use-XDG-environment-while-setting-up.patch \
"

configure_versions_rcar() {
    local local_conf="${S}/build/conf/local.conf"

    cd ${S}
    base_update_conf_value ${local_conf} PREFERRED_VERSION_xen "4.9+git\%"
    base_update_conf_value ${local_conf} PREFERRED_VERSION_u-boot_rcar "v2015.04\%"

    # vGPU settings
    base_update_conf_value ${local_conf} PVR_NUM_OSID "2"
}

python do_configure_append_rcar() {
    bb.build.exec_func("configure_versions_rcar", d)
}

