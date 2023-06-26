EAPI=7

inherit git-r3

DESCRIPTION="Udev rules for accessing XR (VR and AR) hardware devices"
HOMEPAGE="https://gitlab.freedesktop.org/monado/utilities/xr-hardware/"
LICENSE="Boost"
SLOT="0"
KEYWORDS="amd64 ~x86"
EGIT_REPO_URI="https://gitlab.freedesktop.org/monado/utilities/xr-hardware.git"
EGIT_COMMIT="8618eed28a3401ae1c657cb6cddfb1ff67155e80"

DEPEND="
    dev-python/attrs
"
BDEPEND="
    ${DEPEND}
    dev-python/flake8
"

src_compile() {
    emake -C "${S}" clean_package all
}

src_test() {
    emake -C "${S}" test
}

src_install() {
    emake -C "${S}" DESTDIR="${D}" PREFIX='/usr' install_package
}
