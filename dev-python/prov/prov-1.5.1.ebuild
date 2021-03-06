# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="W3C provenance data dodel library"
HOMEPAGE="https://pypi.org/project/prov/"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-python/pydot[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	>=dev-python/networkx-1.10[${PYTHON_USEDEP}]
	dev-python/rdflib[${PYTHON_USEDEP}]
	>=dev-python/six-1.10[${PYTHON_USEDEP}]
"
DEPEND="
	test? ( ${RDEPEND} )
	dev-python/setuptools[${PYTHON_USEDEP}]
"

python_test() {
	${EPYTHON} -m unittest discover || die
}
