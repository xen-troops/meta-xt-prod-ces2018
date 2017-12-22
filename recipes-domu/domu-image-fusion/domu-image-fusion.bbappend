FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
FILESEXTRAPATHS_prepend := "${THISDIR}/../../inc:"

###############################################################################
# extra layers and files to be put after Yocto's do_unpack into inner builder
###############################################################################
# these will be populated into the inner build system on do_unpack_xt_extras
# N.B. xt_shared_env.inc MUST be listed AFTER meta-xt-prod-extra
XT_QUIRK_UNPACK_SRC_URI += "\
    file://xt_shared_env.inc;subdir=repo/meta-xt-prod-extra/inc \
    file://meta-xt-prod-extra;subdir=repo \
"

XT_QUIRK_BB_ADD_LAYER += " \
    meta-xt-prod-extra \
"

SRC_URI = "\
    repo://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo;protocol=https;branch=dab;manifest=dab_4.0.2.xml;scmdata=keep;name=agl-repo \
"

configure_versions() {
    local local_conf="${S}/build/conf/local.conf"

    cd ${S}

    # HACK: force ipk instead of rpm b/c it makes troubles to PVR UM build otherwise
    base_update_conf_value ${local_conf} PACKAGE_CLASSES "package_ipk"

    # FIXME: normally bitbake fails with error if there are bbappends w/o recipes
    # which is the case for agl-demo-platform's recipe-platform while building
    # agl-image-weston: due to AGL's Yocto configuration recipe-platform is only
    # added to bblayers if building agl-demo-platform, thus making bitbake to
    # fail if this recipe is absent. Workaround this by allowing bbappends without
    # corresponding recipies.
    base_update_conf_value ${local_conf} BB_DANGLINGAPPENDS_WARNONLY "yes"

    base_update_conf_value ${local_conf} SERIAL_CONSOLE "115200 hvc0"
}

python do_configure_append() {
    bb.build.exec_func("configure_versions", d)
}

