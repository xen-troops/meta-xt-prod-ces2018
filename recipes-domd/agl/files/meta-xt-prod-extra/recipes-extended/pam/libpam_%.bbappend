# workaround dbus/systemd long login:
# https://bugs.launchpad.net/ubuntu/+source/systemd/+bug/1591411/comments/4
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=770135#133

do_install_append () {
    sed -i '/pam_systemd.so/ s/^/#/' ${D}${sysconfdir}/pam.d/common-session
}

