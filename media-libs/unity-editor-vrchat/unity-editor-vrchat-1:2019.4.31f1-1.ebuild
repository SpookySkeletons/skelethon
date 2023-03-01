# Copyright 2023 Your Name
# Distributed under the terms of the GNU General Public License v2

EAPI=7

_prefix="/opt/Unity"
_unityhub_id="bd5abf232a62"

DESCRIPTION="Allows building your Unity projects for VRChat"
HOMEPAGE="https://unity3d.com/"
SRC_URI="
    https://download.unity3d.com/download_unity/${_unityhub_id}/LinuxEditorInstaller/Unity.tar.xz
    https://download.unity3d.com/download_unity/${_unityhub_id}/MacEditorTargetInstaller/UnitySetup-Windows-Mono-Support-for-Editor-${PV}.pkg
    https://download.unity3d.com/download_unity/${_unityhub_id}/MacEditorTargetInstaller/UnitySetup-Android-Support-for-Editor-${PV}.pkg
    ${FILESDIR}/${PN}
    ${FILESDIR}/${PN}.desktop
    ${FILESDIR}/${PN}-icon.png
    ${FILESDIR}/eula.txt
"

LICENSE="custom"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
  dev-util/desktop-file-utils
  x11-misc/xdg-utils
  sys-devel/gcc
  gnome-base/gconf
  x11-libs/libGLw
  media-libs/glu
  dev-libs/nss
  media-libs/libpng
  x11-libs/libXtst
  dev-libs/libpqxx
  net-libs/nodejs
  dev-cpp/tbb
  x11-libs/gtk+:3
"

DEPEND="${RDEPEND}"

src_prepare() {
  mkdir "${WORKDIR}/Android"
  cd "${WORKDIR}/Android"
  bsdtar -xvf "${DISTDIR}/${P}-android.pkg"
  cd "${WORKDIR}"
}

src_install() {
  emake DESTDIR="${D}" install

  # HACK: fixes WebGL builds by adding a symlink (python -> python2) to the PATH
  ln -s /usr/bin/python2 "${ED}/usr/$(get_libdir)/${PN}/Editor/python"

  # Fix permissions
  find "${ED}/usr/$(get_libdir)/${PN}/Editor/Data" -type d -exec chmod ga+rx {} \;

  # Add version to desktop file
  sed -i "/^Version=/c\Version=${PV}" "${WORKDIR}/${PN}.desktop"

  # Add version/name to launch script
  sed -i "s/%PKGNAME%/${PN}/g" "${WORKDIR}/${PN}"
  sed -i "s/%PKGVER%/${PV}/g" "${WORKDIR}/${PN}"

  # Install files
  insinto /usr/share/applications
  doins "${WORKDIR}/${PN}.desktop"
  insinto /usr/share/icons/hicolor/256x256/apps
  doins "${WORKDIR}/${PN}-icon.png"
  insinto /usr/bin
  doins "${WORKDIR}/${PN}"
  insinto /usr/share/licenses/${PN}
  doins "${WORKDIR}/eula.txt"

  # Install Windows Standalone Support
  _dest_win="${ED}/usr/$(get_libdir)/${PN}/Editor/Data/PlaybackEngines/WindowsStandaloneSupport"
  mkdir -p "${_dest_win}"
  cd "${_dest_win}"
  cat "${WORKDIR}/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
  cd "${WORKDIR}"

  # Install Android Player
  _dest_android="${ED}/usr/$(get_libdir)/${PN}/Editor/Data/PlaybackEngines/AndroidPlayer"
  mkdir -p "${_dest_android}"
  cd "${_dest_android}"
  cat "${WORKDIR}/Android/TargetSupport.pkg.tmp/Payload" | gzip -dc | cpio -i
  cd "${WORKDIR}"
}