# Copyright 2004-2006 SabayonLinux
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit kde autotools flag-o-matic eutils

IUSE=""
LANGS="ca_ES de_DE en_GB es_AR es_ES fr_FR hu_HU it_IT ja_JP ko_KR ru_RU pl_PL pt_BR pt_PT sv_FI sv_SE uk_UA zh_CN zh_HK zh_TW"

for X in ${LANGS} ; do
	IUSE="${IUSE} linguas_${X}"
done

DESCRIPTION="Beryl KDE Window Decorator (svn)"
HOMEPAGE="http://beryl-project.org"
SRC_URI="http://releases.beryl-project.org/${PV}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="x11-wm/beryl-core"

need-kde 3.5


pkg_setup() {
	strip-linguas ${LANGS}

	if [ -z "${LINGUAS}" ]; then
		export LINGUAS_BERYL="en_GB"
		ewarn
		ewarn " To get a localized build, set the according LINGUAS variable(s). "
		ewarn
	else
		export LINGUAS_BERYL=`echo ${LINGUAS}`
	fi
}

src_compile() {
	append-flags -fno-inline

	kde_src_compile --with-lang="${LINGUAS_BERYL}"
}

pkg_postinst() {
	kde_pkg_postinst
	echo
	einfo "Please report all bugs to http://bugs.gentoo-xeffects.org"
	einfo "Thank you on behalf of the Gentoo XEffects team"
}
