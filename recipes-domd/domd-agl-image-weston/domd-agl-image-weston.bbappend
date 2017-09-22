FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

###############################################################################
# extra layers and files to be put after Yocto's do_unpack into inner builder
###############################################################################
# these will be populated into the inner build system on do_unpack_xt_extras
XT_QUIRK_UNPACK_SRC_URI += "file://meta-xt-prod-extra;subdir=repo"

# add new xt-distro machines into AGL
XT_QUIRK_UNPACK_SRC_URI += "file://meta-agl;subdir=repo"
XT_QUIRK_UNPACK_SRC_URI += "file://meta-agl-bsp;subdir=repo/meta-agl"

# these layers will be added to bblayers.conf on do_configure
XT_QUIRK_BB_ADD_LAYER += "meta-xt-prod-extra"

################################################################################
# AGL has its own setup script which calls poky's one internally
################################################################################
XT_BB_CONFIG_CMD = "source meta-agl/scripts/aglsetup.sh -m ${MACHINE}-xt agl-appfw-smack"
XT_BB_RUN_CMD = "source meta-agl/scripts/aglsetup.sh -m ${MACHINE}-xt agl-appfw-smack"

# Renesas R-Car
################################################################################
SRCREV_agl-repo = "${AUTOREV}"
SRCREV_img-proprietary = "6030ba3604495a49361102792743f08499f25106"

SRC_URI_rcar = "repo://gerrit.automotivelinux.org/gerrit/AGL/AGL-repo;protocol=https;branch=dab;manifest=dab_4.0.1.xml;scmdata=keep;name=agl-repo \
    git://git@git.epam.com/epmd-aepr/img-proprietary;protocol=ssh;branch=master;name=img-proprietary;destsuffix=repo/proprietary \
    file://0001-Do-not-try-to-use-XDG-environment-while-setting-up.patch \
"

################################################################################
# Generic
################################################################################
XT_BB_IMAGE_TARGET = "agl-image-weston"
