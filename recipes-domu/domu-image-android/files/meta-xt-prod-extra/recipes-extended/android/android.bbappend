SRCREV = "${AUTOREV}"

SRC_URI_append = "repo://github.com/xen-troops/manifests;protocol=https;branch=master;manifest=prod_ces2018/doma.xml;scmdata=keep"

EXTRA_OEMAKE_append = " TARGET_BOARD_PLATFORM=${SOC_FAMILY}"

################################################################################
# Renesas R-Car
################################################################################

SOC_FAMILY_r8a7795 = "r8a7795"
SOC_FAMILY_r8a7796 = "r8a7796"

ANDROID_VARIANT_rcar = "userdebug"
ANDROID_PRODUCT_salvator = "salvator"

