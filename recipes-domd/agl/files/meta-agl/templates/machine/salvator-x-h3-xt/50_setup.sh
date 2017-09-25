# setup proprietary gfx drivers and multimedia packages
pushd $METADIR 2>/dev/null

export XDG_DOWNLOAD_DIR="${METADIR}/proprietary/rcar/m3_h3_gfx"

SETUP_MM_SCRIPT=$METADIR/meta-agl/meta-agl-bsp/meta-rcar-gen3/scripts/setup_mm_packages.sh
if [ -f $SETUP_MM_SCRIPT ]; then
	. $SETUP_MM_SCRIPT
	copy_mm_packages
fi

popd 2>/dev/null
