#!/bin/bash
set -e

cd "$(dirname "$BASH_SOURCE")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )

source _ubuntu_arch.sh
for v in "${versions[@]}"; do
	(
		cd "$v"
		thisTarBase="ubuntu-$v-core-cloudimg-${UBUNTU_ARCH}"
		baseUrl="https://partner-images.canonical.com/core/$v/current"
		echo
		wget -qO- "$baseUrl/unpacked/build-info.txt" | git --no-pager diff --no-index -- "build-info.txt" - || true
		wget -qO- "$baseUrl/$thisTarBase.manifest" | git --no-pager diff --no-index -- "$thisTarBase.manifest" - || true
		echo
	)
done
