# Copyright 2004-2011 Sabayon
# Distributed under the terms of the GNU General Public License v2

ETYPE="sources"
K_SABKERNEL_NAME="fusion"
K_SABKERNEL_URI_CONFIG="yes"
K_SABKERNEL_SELF_TARBALL_NAME="fusion"
K_ONLY_SOURCES="1"
K_SABKERNEL_FORCE_SUBLEVEL="0"
inherit sabayon-kernel
KEYWORDS="~amd64 ~x86"
DESCRIPTION="Official Sabayon Linux Fusion (on steroids) kernel sources"
RESTRICT="mirror"
IUSE="sources_standalone"

DEPEND="${DEPEND}
	sources_standalone? ( !=sys-kernel/linux-fusion-${PVR} )
	!sources_standalone? ( =sys-kernel/linux-fusion-${PVR} )"
