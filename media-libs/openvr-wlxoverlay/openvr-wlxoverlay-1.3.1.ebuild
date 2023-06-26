 # Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A lightweight OpenVR overlay for Wayland and X11 desktops, inspired by XSOverlay."
HOMEPAGE="https://github.com/galister/WlxOverlay"
EGIT_REPO_URI="https://github.com/galister/WlxOverlay.git"
EGIT_COMMIT="0a44734311fa681225e4a7842e016eb32f6b15bd"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
RESTRICT="!network-sandbox"

DEPEND="
    dev-dotnet/dotnet-sdk-bin
"

RDEPEND="${DEPEND}"

inherit git-r3

src_prepare() {
    # Call the default src_prepare (recommended unless you know what you're doing)
    default

    # Apply patches or additional preparations here
}

src_unpack() {
    # Call the default src_unpack from git-r3 eclass
    git-r3_src_unpack

    # Navigate to the directory where the .csproj file is located
    cd "${WORKDIR}/${P}" || die "Failed to enter ${WORKDIR}/${P}"

    # Run dotnet restore to fetch the NuGet packages
    dotnet restore || die "Failed to restore NuGet packages"
}

src_compile() {
    # Run dotnet build
    dotnet build --configuration Release --no-restore || die "Build failed"
}

src_install() {
    # Determine the major version of dotnet-sdk-bin
    local dotnet_version=$(dotnet --version | cut -d'.' -f1)

    # Choose the path based on the major version
    local path
    if [[ "$dotnet_version" -eq 6 ]]; then
        path="bin/Release/net6.0/*"
    elif [[ "$dotnet_version" -eq 7 ]]; then
        path="bin/Release/net7.0/*"
    else
        die "Unsupported dotnet version"
    fi

    # Install the contents of the appropriate directory to /usr/share/wlxoverlay
    insinto /usr/share/wlxoverlay
    doins ${path} || die "Failed to install files"
}
