# Copyright 2023 Nobbele <realnobbele@gmail.com>
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit unpacker

DESCRIPTION="The Unity Hub is a standalone application that streamlines the way you find, download, and manage your Unity Projects and installations."
HOMEPAGE="https://unity.com/"
SRC_URI="
        https://hub.unity3d.com/linux/repos/deb/pool/main/u/unity/unityhub_amd64/unityhub-amd64-${PV}.deb
        ${FILESDIR}/license.txt
    "

LICENSE="custom"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libappindicator-gtk3 gconf icu50 icu70"

RDEPEND="
    dev-libs/nss
    x11-libs/gtk+:3
    sys-apps/cpio
    dev-libs/openssl:1.1
    libappindicator-gtk3? ( x11-libs/libappindicator-gtk3 )
    gconf? ( gnome-base/gconf )
    icu50? ( dev-libs/icu:50 )
    icu70? ( dev-libs/icu:70 )
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/"

src_unpack() {
    unpack ${A}
    tar -xvf data.tar.xz -C "${S}"
}

src_install() {
    local license_dir="/usr/share/licenses/${PF}"

    mkdir -p "${D}/usr/bin"
    ln -s /opt/unityhub/unityhub "${D}/usr/bin/unityhub"

    insinto "${license_dir}"
    doins "${WORKDIR}/usr/share/doc/${PF}/license.txt"
}