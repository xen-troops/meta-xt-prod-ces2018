################################################################################
# We only need Xen tools, so we can start domains
################################################################################
XEN_REL = "4.9"

SRCREV = "${AUTOREV}"

SRC_URI = "git://github.com/xen-troops/xen.git;protocol=https;branch=vgpu-dev"

DEPENDS_remove = "systemd"

PACKAGECONFIG[xsm] = ""

do_install_append() {
    # FIXME: we do not want XSM, but Xen still installs it making
    # package QA Issue to raise for files installed
    rm ${D}/boot/xenpolicy-${XEN_REL}-rc

    # FIXME: this is to fix run-time issues
    # "libxl__lock_domain_userdata: Domain 0:cannot open lockfile /var/lib/xen/"

    install -d ${D}${localstatedir}/lib/xen
}

FILES_${PN}-xencommons += " \
    ${localstatedir}/lib/xen \
"

