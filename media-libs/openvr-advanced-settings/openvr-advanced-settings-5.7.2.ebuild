 # Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OpenVR Advanced Settings - Dashboard Application for VR"
HOMEPAGE="https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings"
EGIT_REPO_URI="https://github.com/OpenVR-Advanced-Settings/OpenVR-AdvancedSettings.git"
EGIT_COMMIT="b3c36596f69a7a4f73dd7b62db69200f74d837ab"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

DEPEND="
    dev-qt/qtcore:5
    dev-qt/qtgui:5
    dev-qt/qtwidgets:5
    dev-qt/qtdeclarative:5
    dev-libs/boost
"

RDEPEND="${DEPEND}"

# Inherit the qmake-utils and git-r3 eclass
inherit qmake-utils git-r3

src_prepare() {
    # Call the default src_prepare (recommended unless you know what you're doing)
    default

    # Apply patches or additional preparations here
}

src_configure() {
    # Configure the build using eqmake5 (it is a wrapper around qmake for Qt5)
    eqmake5
}

src_compile() {
    # Compile the project
    emake
}

src_install() {
    # Copy the output directory to the desired installation path
    dodir /usr/share/OpenVR-AdvancedSettings
    cp -r "${S}/bin/linux/AdvancedSettings/"{default_action_manifests,res,action_manifest.json,libopenvr_api.so,manifest.vrmanifest,AdvancedSettings} "${D}/usr/share/OpenVR-AdvancedSettings/" || die "Failed to copy to share"
    
    # Optionally, you can create a symbolic link in /usr/bin for easier access
    #dosym /opt/OpenVR-AdvancedSettings/AdvancedSettings /usr/bin/AdvancedSettings

    # Install additional files like documentation, etc.
    #dodoc README.md
}
