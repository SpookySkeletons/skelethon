# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop xdg-utils

NODE_MODULES_SRC_URI="
	https://registry.npmjs.org/@fontsource/fira-code/-/fira-code-5.0.13.tgz -> webcord-dep--fira-code-5.0.13.tgz
	https://registry.npmjs.org/@fontsource/roboto/-/roboto-5.0.8.tgz -> webcord-dep--roboto-5.0.8.tgz
	https://registry.npmjs.org/@fontsource/ubuntu/-/ubuntu-5.0.8.tgz -> webcord-dep--ubuntu-5.0.8.tgz
	https://registry.npmjs.org/@spacingbat3/disconnection/-/disconnection-1.3.1.tgz -> webcord-dep--disconnection-1.3.1.tgz
	https://registry.npmjs.org/@spacingbat3/kolor/-/kolor-3.2.3.tgz -> webcord-dep--kolor-3.2.3.tgz
	https://registry.npmjs.org/@spacingbat3/lss/-/lss-1.2.0.tgz -> webcord-dep--lss-1.2.0.tgz
	https://registry.npmjs.org/buffer-from/-/buffer-from-1.1.2.tgz -> webcord-dep--buffer-from-1.1.2.tgz
	https://registry.npmjs.org/deepmerge-ts/-/deepmerge-ts-5.1.0.tgz -> webcord-dep--deepmerge-ts-5.1.0.tgz
	https://registry.npmjs.org/dompurify/-/dompurify-3.0.6.tgz -> webcord-dep--dompurify-3.0.6.tgz
	https://registry.npmjs.org/highlight.js/-/highlight.js-11.9.0.tgz -> webcord-dep--highlight.js-11.9.0.tgz
	https://registry.npmjs.org/marked/-/marked-9.1.2.tgz -> webcord-dep--marked-9.1.2.tgz
	https://registry.npmjs.org/marked-highlight/-/marked-highlight-2.0.6.tgz -> webcord-dep--marked-highlight-2.0.6.tgz
	https://registry.npmjs.org/marked-gfm-heading-id/-/marked-gfm-heading-id-3.1.0.tgz -> webcord-dep--marked-gfm-heading-id-3.1.0.tgz
	https://registry.npmjs.org/semver/-/semver-7.5.4.tgz -> webcord-dep--semver-7.5.4.tgz
	https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz -> webcord-dep--lru-cache-6.0.0.tgz
	https://registry.npmjs.org/source-map/-/source-map-0.6.1.tgz -> webcord-dep--source-map-0.6.1.tgz
	https://registry.npmjs.org/source-map-support/-/source-map-support-0.5.21.tgz -> webcord-dep--source-map-support-0.5.21.tgz
	https://registry.npmjs.org/tslib/-/tslib-2.6.2.tgz -> webcord-dep--tslib-2.6.2.tgz
	https://registry.npmjs.org/twemoji-colr-font/-/twemoji-colr-font-14.1.3.tgz -> webcord-dep--twemoji-colr-font-14.1.3.tgz
	https://registry.npmjs.org/ws/-/ws-8.14.2.tgz -> webcord-dep--ws-8.14.2.tgz
	https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz -> webcord-dep--yallist-4.0.0.tgz
	https://registry.npmjs.org/github-slugger/-/github-slugger-2.0.0.tgz -> webcord-dep--github-slugger-2.0.0.tgz
	https://registry.npmjs.org/wrappy/-/wrappy-1.0.2.tgz -> webcord-dep--wrappy-1.0.2.tgz
	https://registry.npmjs.org/wide-align/-/wide-align-1.1.5.tgz -> webcord-dep--wide-align-1.1.5.tgz
	https://registry.npmjs.org/whatwg-url/-/whatwg-url-5.0.0.tgz -> webcord-dep--whatwg-url-5.0.0.tgz
	https://registry.npmjs.org/webidl-conversions/-/webidl-conversions-3.0.1.tgz -> webcord-dep--webidl-conversions-3.0.1.tgz
	https://registry.npmjs.org/util-deprecate/-/util-deprecate-1.0.2.tgz -> webcord-dep--util-deprecate-1.0.2.tgz
	https://registry.npmjs.org/tr46/-/tr46-0.0.3.tgz -> webcord-dep--tr46-0.0.3.tgz
	https://registry.npmjs.org/tar/-/tar-6.2.0.tgz -> webcord-dep--tar-6.2.0.tgz
	https://registry.npmjs.org/fs-minipass/-/fs-minipass-2.1.0.tgz -> webcord-dep--fs-minipass-2.1.0.tgz
	https://registry.npmjs.org/minipass/-/minipass-3.3.6.tgz -> webcord-dep--minipass-3.3.6.tgz
	https://registry.npmjs.org/strip-ansi/-/strip-ansi-6.0.1.tgz -> webcord-dep--strip-ansi-6.0.1.tgz
	https://registry.npmjs.org/string-width/-/string-width-4.2.3.tgz -> webcord-dep--string-width-4.2.3.tgz
	https://registry.npmjs.org/string_decoder/-/string_decoder-1.3.0.tgz -> webcord-dep--string_decoder-1.3.0.tgz
	https://registry.npmjs.org/signal-exit/-/signal-exit-3.0.7.tgz -> webcord-dep--signal-exit-3.0.7.tgz
	https://registry.npmjs.org/set-blocking/-/set-blocking-2.0.0.tgz -> webcord-dep--set-blocking-2.0.0.tgz
	https://registry.npmjs.org/safe-buffer/-/safe-buffer-5.2.1.tgz -> webcord-dep--safe-buffer-5.2.1.tgz
	https://registry.npmjs.org/rimraf/-/rimraf-3.0.2.tgz -> webcord-dep--rimraf-3.0.2.tgz
	https://registry.npmjs.org/readable-stream/-/readable-stream-3.6.2.tgz -> webcord-dep--readable-stream-3.6.2.tgz
	https://registry.npmjs.org/path-is-absolute/-/path-is-absolute-1.0.1.tgz -> webcord-dep--path-is-absolute-1.0.1.tgz
	https://registry.npmjs.org/once/-/once-1.4.0.tgz -> webcord-dep--once-1.4.0.tgz
	https://registry.npmjs.org/node-fetch/-/node-fetch-2.7.0.tgz -> webcord-dep--node-fetch-2.7.0.tgz
	https://registry.npmjs.org/ms/-/ms-2.1.2.tgz -> webcord-dep--ms-2.1.2.tgz
	https://registry.npmjs.org/mkdirp/-/mkdirp-1.0.4.tgz -> webcord-dep--mkdirp-1.0.4.tgz
	https://registry.npmjs.org/minizlib/-/minizlib-2.1.2.tgz -> webcord-dep--minizlib-2.1.2.tgz
	https://registry.npmjs.org/minipass/-/minipass-5.0.0.tgz -> webcord-dep--minipass-5.0.0.tgz
	https://registry.npmjs.org/minimatch/-/minimatch-3.1.2.tgz -> webcord-dep--minimatch-3.1.2.tgz
	https://registry.npmjs.org/is-fullwidth-code-point/-/is-fullwidth-code-point-3.0.0.tgz -> webcord-dep--is-fullwidth-code-point-3.0.0.tgz
	https://registry.npmjs.org/inherits/-/inherits-2.0.4.tgz -> webcord-dep--inherits-2.0.4.tgz
	https://registry.npmjs.org/inflight/-/inflight-1.0.6.tgz -> webcord-dep--inflight-1.0.6.tgz
	https://registry.npmjs.org/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz -> webcord-dep--https-proxy-agent-5.0.1.tgz
	https://registry.npmjs.org/has-unicode/-/has-unicode-2.0.1.tgz -> webcord-dep--has-unicode-2.0.1.tgz
	https://registry.npmjs.org/glob/-/glob-7.2.3.tgz -> webcord-dep--glob-7.2.3.tgz
	https://registry.npmjs.org/fs.realpath/-/fs.realpath-1.0.0.tgz -> webcord-dep--fs.realpath-1.0.0.tgz
	https://registry.npmjs.org/emoji-regex/-/emoji-regex-8.0.0.tgz -> webcord-dep--emoji-regex-8.0.0.tgz
	https://registry.npmjs.org/detect-libc/-/detect-libc-2.0.2.tgz -> webcord-dep--detect-libc-2.0.2.tgz
	https://registry.npmjs.org/delegates/-/delegates-1.0.0.tgz -> webcord-dep--delegates-1.0.0.tgz
	https://registry.npmjs.org/debug/-/debug-4.3.4.tgz -> webcord-dep--debug-4.3.4.tgz
	https://registry.npmjs.org/console-control-strings/-/console-control-strings-1.1.0.tgz -> webcord-dep--console-control-strings-1.1.0.tgz
	https://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz -> webcord-dep--concat-map-0.0.1.tgz
	https://registry.npmjs.org/color-support/-/color-support-1.1.3.tgz -> webcord-dep--color-support-1.1.3.tgz
	https://registry.npmjs.org/chownr/-/chownr-2.0.0.tgz -> webcord-dep--chownr-2.0.0.tgz
	https://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.11.tgz -> webcord-dep--brace-expansion-1.1.11.tgz
	https://registry.npmjs.org/balanced-match/-/balanced-match-1.0.2.tgz -> webcord-dep--balanced-match-1.0.2.tgz
	https://registry.npmjs.org/aproba/-/aproba-2.0.0.tgz -> webcord-dep--aproba-2.0.0.tgz
	https://registry.npmjs.org/ansi-regex/-/ansi-regex-5.0.1.tgz -> webcord-dep--ansi-regex-5.0.1.tgz
	https://registry.npmjs.org/agent-base/-/agent-base-6.0.2.tgz -> webcord-dep--agent-base-6.0.2.tgz
	https://registry.npmjs.org/abbrev/-/abbrev-1.1.1.tgz -> webcord-dep--abbrev-1.1.1.tgz
	https://registry.npmjs.org/node-pipewire/-/node-pipewire-1.0.8.tgz -> webcord-dep--node-pipewire-1.0.8.tgz
"

DESCRIPTION="A Discord and Fosscord client made with the Electron API."
HOMEPAGE="https://github.com/SpacingBat3/WebCord"
SRC_URI="
	https://github.com/kakxem/WebCord/archive/v${PV}.tar.gz -> ${P}.tar.gz
	${NODE_MODULES_SRC_URI}
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="systray"

DEPEND="
	>=dev-util/electron-20.0.0:=
"
RDEPEND="${DEPEND}
	systray? ( dev-libs/libappindicator:3 )
"
BDEPEND="
	dev-util/esbuild
"

S="${WORKDIR}/WebCord-${PV}"

src_unpack() {
	# From dev-util/electron from electron overlay
	local a
	local fn

	mkdir -p "${WORKDIR}/npm-cache" || die

	for a in ${A} ; do
		case "${a}" in
			${PN}-dep*)
				# Npm artifact
				fn="${a#${PN}-dep--}"
				fn="${fn#${PN}-dep-}"
				ln -s "${DISTDIR}/${a}" "${WORKDIR}/npm-cache/${fn}" || die
				;;
			*)
				# Fallback to the default unpacker.
				unpack "${a}"
				;;
		esac
	done
}

src_prepare() {
	default

	einfo "Installing nodejs dependencies from cache"
	for npm_tgz in "${WORKDIR}/npm-cache/"*; do
		einfo $(basename ${npm_tgz})
		npm install --no-package-lock --silent --offline "${npm_tgz}"
	done

	npm ci --omit=dev --ignore-scripts --prefix=.
	rm -r "sources/code/build"
	rm "sources/assets/icons/app.ic"*
}

src_compile() {
	shopt -s globstar
	einfo "Compiling typescript with esbuild"
	esbuild "sources/code/"**/*".ts" \
		--outbase="sources" \
		--outdir="app" \
		--minify \
		--platform=node \
		--target=es2022 \
		--format=cjs \
		--supported:dynamic-import=false
	shopt -u globstar
}

src_install() {
	dodir /usr/lib/webcord
	dodir /usr/lib/webcord/sources

	newmenu "${FILESDIR}/app.desktop" webcord.desktop

	insinto /usr/lib/webcord
	doins package.json
	doins "${FILESDIR}/buildInfo.json"
	doins -r app
	doins -r node_modules

	newicon -s 512x512 "sources/assets/icons/app.png" webcord.png

	insinto /usr/lib/webcord/sources
	doins -r sources/assets
	doins -r sources/translations

	dosym "../sources/translations" "/usr/lib/webcord/app/translations"

	echo "#!/bin/sh" > "webcord"
	echo "electron '/usr/lib/webcord' \"\$@\"" >> "webcord"
	dobin "webcord"
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
