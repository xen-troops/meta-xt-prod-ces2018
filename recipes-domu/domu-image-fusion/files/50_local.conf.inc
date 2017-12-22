# XXX: disable smack security so we can boot with nfsroot
# FIXME: at the moment this is the first occurance of BBMASK
# for the build, so we cannot use .= syntax here as configuration fails
BBMASK = "meta-intel-iot-security/meta-security-smack/recipes-kernel/linux"
