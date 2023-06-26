# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGIT_REPO_URI="https://github.com/SlimeVR/SlimeVR-OpenVR-Driver.git"
EGIT_COMMIT="ce8072677311a82a9b641eaf509a49b75c58a07a"

inherit cmake git-r3

DESCRIPTION="SlimeVR OpenVR Driver - integration of SlimeVR trackers into SteamVR"
HOMEPAGE="https://github.com/SlimeVR/SlimeVR-OpenVR-Driver"
SRC_URI=""
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 ~x86"
IUSE=""

DEPEND="
    dev-util/cmake
"

RDEPEND="${DEPEND}"

src_prepare() {
    # Apply the patch
    eapply "${FILESDIR}/no-vcpkg.patch"

    # Call the default src_prepare (often needed after patching)
    cmake_src_prepare
}

src_configure() {
    cmake_src_configure
}

src_install() {
    dodir /usr/share/slimevr-openvr
    cp -r "${S}/driver/slimevr/bin" "${D}/usr/share/slimevr-openvr" || die "Failed to copy bin"
    cp -r "${S}/driver/slimevr/resources" "${D}/usr/share/slimevr-openvr" || die "Failed to copy resources"
    cp "${S}/driver/slimevr/driver.vrdrivermanifest" "${D}/usr/share/slimevr-openvr" || die "Failed to copy driver.vrdrivermanifest"

    einfo "Please run the steam install script as your user to add slimevr to your steam drivers."
    einfo "~/.steam/steam/steamapps/common/SteamVR/bin/vrpathreg.sh adddriver /usr/share/slimevr-openvr"
    dodoc README.md
}
