# Copyright 2006 SabayonLinux
# Distributed under the terms of the GNU General Public License v2

inherit eutils

DESCRIPTION="SabayonLinux Live tools for autoconfiguration of the system"
HOMEPAGE="http://www.sabayonlinux.org"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE="opengl"

RDEPEND="dev-util/dialog
	sys-apps/pciutils
	sys-apps/gawk
	app-admin/eselect-opengl
	!app-misc/livecd-tools
	x11-misc/desktop-acceleration-helpers
	"
DEPEND="${RDEPEND}"

src_unpack() {
	cd ${WORKDIR}
	cp ${FILESDIR}/${PV}/livecd-functions.sh . -p
	cp ${FILESDIR}/${PV}/net-setup . -p
	cp ${FILESDIR}/${PV}/x-setup-init.d . -p
	cp ${FILESDIR}/${PV}/x-setup-configuration . -p
	cp ${FILESDIR}/${PV}/xorg.conf.sabayon . -p
	cp ${FILESDIR}/${PV}/bashlogin . -p
	cp ${FILESDIR}/${PV}/opengl-activator . -p
	cp ${FILESDIR}/${PV}/sabayonlive . -p
	cp ${FILESDIR}/${PV}/vga-cmd-parser . -p
}

src_install() {

	cd ${WORKDIR}

	if use opengl; then
		dosbin x-setup-configuration
		newinitd x-setup-init.d x-setup
	fi

	dosbin net-setup
	into /
	dosbin livecd-functions.sh
	dobin bashlogin
	dobin vga-cmd-parser
	exeinto /usr/bin
	doexe opengl-activator

	insinto /etc/X11
	doins xorg.conf.sabayon

	newinitd sabayonlive sabayonlive

}
