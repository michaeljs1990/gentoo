# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit toolchain-funcs

DESCRIPTION="ALSA mixer dockapp, fork of wmsmixer"
HOMEPAGE="https://github.com/gryf/wmamixer"
SRC_URI="https://github.com/gryf/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/libXpm
	x11-libs/libXext
	x11-libs/libX11"
DEPEND="${RDEPEND}
	x11-proto/xproto"

DOCS=( README.rst )
src_compile() {
	$(tc-getCC) ${CFLAGS} -c -o wmamixer.o wmamixer.c
	$(tc-getCC) ${LDFLAGS} -o wmamixer wmamixer.o -lm -lXpm -lXext -lX11 -lasound
}

src_install() {
	dobin wmamixer
	einstalldocs
}
