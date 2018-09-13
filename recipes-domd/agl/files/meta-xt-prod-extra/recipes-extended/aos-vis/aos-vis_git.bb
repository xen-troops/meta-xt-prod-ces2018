DESCRIPTION = "AOS Service Manager"

LICENSE = "CLOSED"

GO_IMPORT = "gitpct.epam.com/epmd-aepr/aos_vis"

SRCREV = "${AUTOREV}"
SRC_URI = "\
    git://git@${GO_IMPORT}.git;protocol=ssh;destsuffix=${PN}-${PV}/src/${GO_IMPORT};branch=aos-demo-2 \
    file://aos-vis.service \
    file://visconfig.json \
"

inherit go

GO_INSTALL = "${GO_IMPORT}"

DEPENDS += "\
    golang.org-x-sys \
    github.com-godbus-dbus \
    github.com-gorilla-websocket \
    github.com-sirupsen-logrus \
"

RDEPENDS_${PN} += "\
    openssl \
    ca-certificates \
    iptables \
"

RDEPENDS_${PN}-dev += "bash"

FILES_${PN} += "${GOBIN_FINAL}/*"

inherit systemd

SYSTEMD_PACKAGES = " \
    ${PN} \
"

SYSTEMD_SERVICE_${PN} = "aos-vis.service"

FILES_${PN} += " \
    ${systemd_system_unitdir}/aos-vis.service \
    ${base_prefix}/var/aos/vis/data/*.pem \
    ${base_prefix}/var/aos/vis/visconfig.json \
"

do_install_append() {
    install -d ${D}${base_prefix}/var/aos/vis
    install -m 0644 ${WORKDIR}/visconfig.json ${D}${base_prefix}/var/aos/vis

    install -d ${D}${base_prefix}/var/aos/vis/data
    install -m 0644 ${S}/src/${GO_IMPORT}/data/*.pem ${D}${base_prefix}/var/aos/vis/data

    install -d ${D}${systemd_system_unitdir}
    install -m 0644 ${WORKDIR}/*.service ${D}${systemd_system_unitdir}
}
