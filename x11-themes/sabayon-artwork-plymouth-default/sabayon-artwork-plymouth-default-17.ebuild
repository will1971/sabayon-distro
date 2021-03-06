# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
#

EAPI=5
inherit eutils sabayon-artwork

DESCRIPTION="Official Sabayon Linux Plymouth Artwork"
HOMEPAGE="http://www.sabayon.org/"
SRC_URI="mirror://sabayon/${CATEGORY}/${PN}/${PN}-${PVR}.tar.xz"
LICENSE="CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~arm ~x86 ~amd64"
IUSE=""
RDEPEND="
	x11-themes/sabayon-artwork-plymouth-base
	sys-apps/findutils
"
S="${WORKDIR}/${PN}"
src_install() {
	# Plymouth
	insinto /usr/share/plymouth/themes
	doins -r "${S}"
}

pkg_postinst() {
	einfo "You can switch to this theme with 'plymouth-set-default-theme ${PN}'"

	einfo "Please report bugs or glitches to"
	einfo "http://bugs.sabayon.org"
}
