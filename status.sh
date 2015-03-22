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
		#thisTarBase="ubuntu-$v-core-cloudimg-${UBUNTU_ARCH}"
		#baseUrl="https://partner-images.canonical.com/core/$v/current"
		serial="$(awk -F '=' '$1 == "SERIAL" { print $2 }' build-info.txt)"
		echo '- `ubuntu:'"$v"'`: '"$serial"
	)
done
